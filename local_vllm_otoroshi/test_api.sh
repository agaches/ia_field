#!/bin/bash

echo "🧪 Tests d'accès à Ollama via Otoroshi"
echo "========================================"
echo ""

echo "✅ Test 1: Accès avec API Key CLIENT (devrait fonctionner)"
echo "-----------------------------------------------------------"
curl -s -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models | jq .
echo ""

echo "❌ Test 2: Accès SANS API Key (devrait échouer)"
echo "------------------------------------------------"
curl -s -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models
echo ""
echo ""

echo "❌ Test 3: Accès avec mauvaise API Key (devrait échouer)"
echo "---------------------------------------------------------"
curl -s -H 'Otoroshi-Client-Id: wrong-id' \
     -H 'Otoroshi-Client-Secret: wrong-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models
echo ""
echo ""

echo "ℹ️  Test 4: Accès DIRECT à Ollama (bypass Otoroshi)"
echo "----------------------------------------------------"
curl -s http://localhost:11434/v1/models | jq .
echo ""

echo "📊 Résumé:"
echo "- Les credentials ADMIN (admin-api-apikey-id) sont pour gérer Otoroshi"
echo "- Les credentials CLIENT (my-llm-client-id) sont pour accéder à Ollama"
echo "- Seuls les clients avec l'API Key peuvent passer par Otoroshi"
