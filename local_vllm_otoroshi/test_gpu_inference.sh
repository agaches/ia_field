#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   🧪 Test d'inférence GPU avec Ollama${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

MODEL=${1:-"llama2"}

# Vérifier si le modèle existe
echo -e "${YELLOW}🔍 Vérification du modèle $MODEL...${NC}"
if ! docker exec ollama ollama list | grep -q "$MODEL"; then
    echo -e "${YELLOW}⚠️  Modèle $MODEL non trouvé. Téléchargement...${NC}"
    docker exec ollama ollama pull "$MODEL"
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Échec du téléchargement${NC}"
        exit 1
    fi
fi
echo -e "${GREEN}✅ Modèle prêt${NC}"
echo ""

# Afficher les logs Ollama en arrière-plan
echo -e "${YELLOW}📋 Surveillance des logs Ollama...${NC}"
docker logs ollama -f 2>&1 | grep -i "gpu\|rocm\|hip\|cuda\|vram\|loading" &
LOG_PID=$!

sleep 2
echo ""

# Faire une requête de test
echo -e "${YELLOW}🚀 Exécution d'une requête de test...${NC}"
echo ""

START_TIME=$(date +%s)

RESPONSE=$(curl -s \
    -H 'Otoroshi-Client-Id: my-llm-client-id' \
    -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
    -H 'Host: ollama.oto.tools' \
    -H 'Content-Type: application/json' \
    -d "{
        \"model\": \"$MODEL\",
        \"messages\": [{\"role\": \"user\", \"content\": \"Say hello in one short sentence.\"}],
        \"stream\": false
    }" \
    http://localhost:8080/v1/chat/completions)

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

# Arrêter la surveillance des logs
kill $LOG_PID 2>/dev/null

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   📊 Résultats${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if echo "$RESPONSE" | jq -e '.choices[0].message.content' > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Requête réussie${NC}"
    echo ""
    echo "Réponse du modèle:"
    echo "$RESPONSE" | jq -r '.choices[0].message.content'
    echo ""
    echo "Durée: ${DURATION}s"
    echo ""
    
    # Analyser les tokens
    if echo "$RESPONSE" | jq -e '.usage' > /dev/null 2>&1; then
        echo "Usage:"
        echo "$RESPONSE" | jq '.usage'
    fi
else
    echo -e "${RED}✗ Erreur lors de la requête${NC}"
    echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"
fi

echo ""
echo -e "${YELLOW}💡 Pour surveiller l'utilisation GPU en temps réel:${NC}"
echo "  Terminal 1: watch -n 1 'docker exec ollama sh -c \"ps aux | grep ollama\"'"
echo "  Terminal 2: ./monitor_resources.sh continuous"
echo ""

# Vérifier les statistiques du conteneur
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   📈 Statistiques conteneur Ollama${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
docker stats ollama --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"
