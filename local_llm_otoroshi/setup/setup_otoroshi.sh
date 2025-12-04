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

# Attente supplémentaire pour s'assurer que l'API est complètement prête
sleep 3

# 1. Création de la Route (Proxy vers Ollama)
echo "🚀 Création de la route Ollama..."
ROUTE_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  -H "Content-Type: application/json" \
  -d '{
    "id": "route_ollama_proxy",
    "name": "Ollama AI Proxy",
    "description": "Route pour accéder à Ollama via Otoroshi",
    "enabled": true,
    "groups": ["default"],
    "frontend": {
      "domains": ["ollama.oto.tools"],
      "strip_path": false,
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
          "validate": true
        }
      }
    ]
  }' \
  "$OTO_URL/api/routes")

HTTP_CODE=$(echo "$ROUTE_RESPONSE" | tail -n1)
ROUTE_BODY=$(echo "$ROUTE_RESPONSE" | sed '$d')
echo "$ROUTE_BODY"
echo "📊 HTTP Status: $HTTP_CODE"

# 2. Création d'une API Key pour le client
echo -e "\n🔑 Création de l'API Key..."
APIKEY_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  -H "Content-Type: application/json" \
  -d '{
    "clientId": "my-llm-client-id",
    "clientSecret": "my-llm-client-secret",
    "clientName": "LLM Client",
    "description": "API Key pour accéder à Ollama",
    "authorizedGroup": "default",
    "authorizedEntities": ["route_ollama_proxy"],
    "enabled": true,
    "throttlingQuota": 10000000,
    "dailyQuota": 10000000,
    "monthlyQuota": 10000000
  }' \
  "$OTO_URL/api/apikeys")

HTTP_CODE=$(echo "$APIKEY_RESPONSE" | tail -n1)
APIKEY_BODY=$(echo "$APIKEY_RESPONSE" | sed '$d')
echo "$APIKEY_BODY"
echo "📊 HTTP Status: $HTTP_CODE"

# 3. Vérification des routes créées
echo -e "\n🔍 Vérification des routes..."
curl -s -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  "$OTO_URL/api/routes" | jq '.[] | {id: .id, name: .name, domains: .frontend.domains, enabled: .enabled}'

# 4. Vérification des API Keys créées
echo -e "\n🔍 Vérification des API Keys..."
curl -s -u "$ADMIN_API_ID:$ADMIN_API_SECRET" \
  -H "Host: $OTO_API_HOST" \
  "$OTO_URL/api/apikeys" | jq '.[] | {clientId: .clientId, clientName: .clientName, authorizedEntities: .authorizedEntities, enabled: .enabled}'

echo -e "\n\n🎉 Setup Terminé !"
echo ""
echo "✅ Commande de test (avec headers Otoroshi) :"
echo "curl -H 'Otoroshi-Client-Id: my-llm-client-id' -H 'Otoroshi-Client-Secret: my-llm-client-secret' -H 'Host: ollama.oto.tools' http://localhost:8080/v1/models"
echo ""
echo "📚 Pour charger un modèle dans Ollama :"
echo "docker exec ollama ollama pull llama2"
echo ""
echo "🔧 Pour tester directement Ollama (sans Otoroshi) :"
echo "curl http://localhost:11434/v1/models"
