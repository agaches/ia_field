#!/bin/bash

# Configuration
OTO_URL="http://localhost:8080"
OTO_API_HOST="otoroshi-api.oto.tools"
# Utilisation des credentials de l'API Admin par défaut
ADMIN_API_ID="admin-api-apikey-id"
ADMIN_API_SECRET="admin-api-apikey-secret"

# Attente du démarrage d'Otoroshi
echo "⏳ Attente du démarrage d'Otoroshi..."
until curl -s -u "$ADMIN_API_ID:$ADMIN_API_SECRET" -H "Host: $OTO_API_HOST" "$OTO_URL/health" | grep -q "otoroshi"; do
  sleep 5
  echo "..."
done
echo "✅ Otoroshi est prêt !"

# 1. Création de la Route (Proxy vers Ollama)
# Redirige ollama.oto.tools vers le conteneur ollama:11434
# Ajoute l'authentification par API Key
echo "🚀 Création de la route Ollama..."
curl -X POST -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "route_ollama_proxy",
    "name": "Ollama AI Proxy",
    "frontend": {
      "domains": ["ollama.oto.tools"],
      "strip_path": true,
      "exact": false
    },
    "backend": {
      "targets": [
        {
          "hostname": "ollama",
          "port": 11434,
          "tls": false
        }
      ],
      "root": "/",
      "rewrite": false,
      "load_balancing": { "type": "RoundRobin" }
    },
    "plugins": [
      {
        "plugin": "cp:otoroshi.next.plugins.ApikeyCalls",
        "enabled": true,
        "config": {
          "validate": true,
          "header": "Authorization",
          "prefix": "Bearer "
        }
      }
    ]
  }' \
  "$OTO_URL/api/routes"

# 2. Création d'une API Key pour le client
echo -e "\n🔑 Création de l'API Key..."
curl -X POST -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  -H "Content-Type: application/json" \
  -d '{
    "clientId": "my-llm-client-id",
    "clientSecret": "my-llm-client-secret",
    "clientName": "LLM Client",
    "authorizedEntities": ["route_ollama_proxy"]
  }' \
  "$OTO_URL/api/apikeys"

echo -e "\n\n🎉 Setup Terminé !"
echo "Vous pouvez maintenant accéder à Ollama via Otoroshi :"
echo "curl -H 'Host: ollama.oto.tools' -H 'Authorization: Bearer my-llm-client-id:my-llm-client-secret' http://localhost:8080/v1/models"
