#!/bin/bash

# Script de benchmark pour mesurer les performances sous charge

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   🏋️  Benchmark Ollama + Otoroshi${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Configuration
CLIENT_ID="my-llm-client-id"
CLIENT_SECRET="my-llm-client-secret"
HOST="ollama.oto.tools"
URL="http://localhost:8080/v1/chat/completions"
MODEL="llama2"

# Vérifier que le modèle est chargé
echo -e "${YELLOW}🔍 Vérification du modèle $MODEL...${NC}"
docker exec ollama ollama list | grep -q "$MODEL"
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}⚠️  Modèle $MODEL non trouvé. Téléchargement...${NC}"
    docker exec ollama ollama pull "$MODEL"
fi

echo -e "${GREEN}✅ Modèle prêt${NC}"
echo ""

# Fonction de test de latence
test_latency() {
    local num_requests=${1:-10}
    echo -e "${YELLOW}📊 Test de latence ($num_requests requêtes)${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    local total_time=0
    local success_count=0
    
    for i in $(seq 1 $num_requests); do
        echo -n "  Requête $i/$num_requests... "
        
        local start=$(date +%s%N)
        local response=$(curl -s -w "\n%{time_total}" \
            -H "Otoroshi-Client-Id: $CLIENT_ID" \
            -H "Otoroshi-Client-Secret: $CLIENT_SECRET" \
            -H "Host: $HOST" \
            -H "Content-Type: application/json" \
            -d "{\"model\":\"$MODEL\",\"messages\":[{\"role\":\"user\",\"content\":\"Hello\"}],\"max_tokens\":10}" \
            "$URL")
        
        local time_taken=$(echo "$response" | tail -1)
        
        if echo "$response" | head -n -1 | grep -q "chat.completion"; then
            success_count=$((success_count + 1))
            echo -e "${GREEN}✓${NC} ${time_taken}s"
            total_time=$(echo "$total_time + $time_taken" | bc)
        else
            echo -e "${RED}✗ Échec${NC}"
        fi
        
        sleep 1
    done
    
    if [ $success_count -gt 0 ]; then
        local avg_time=$(echo "scale=3; $total_time / $success_count" | bc)
        echo ""
        echo "Résultats:"
        echo "  Succès: $success_count/$num_requests"
        echo "  Temps moyen: ${avg_time}s"
        echo "  Temps total: ${total_time}s"
    fi
}

# Fonction de test de charge
load_test() {
    local concurrent=${1:-5}
    local duration=${2:-30}
    
    echo -e "${YELLOW}🔥 Test de charge ($concurrent requêtes simultanées, ${duration}s)${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Démarrer le monitoring en arrière-plan
    ./monitor_resources.sh continuous 2 > load_test_stats.log &
    local monitor_pid=$!
    
    echo "  Démarrage du test..."
    local start_time=$(date +%s)
    local end_time=$((start_time + duration))
    local request_count=0
    local error_count=0
    
    while [ $(date +%s) -lt $end_time ]; do
        for i in $(seq 1 $concurrent); do
            (
                curl -s \
                    -H "Otoroshi-Client-Id: $CLIENT_ID" \
                    -H "Otoroshi-Client-Secret: $CLIENT_SECRET" \
                    -H "Host: $HOST" \
                    -H "Content-Type: application/json" \
                    -d "{\"model\":\"$MODEL\",\"messages\":[{\"role\":\"user\",\"content\":\"Test $request_count\"}],\"max_tokens\":10}" \
                    "$URL" > /dev/null 2>&1
                
                if [ $? -eq 0 ]; then
                    echo "." >> /tmp/success_$$
                else
                    echo "." >> /tmp/error_$$
                fi
            ) &
        done
        
        wait
        request_count=$((request_count + concurrent))
        echo -n "."
    done
    
    # Arrêter le monitoring
    kill $monitor_pid 2>/dev/null
    
    echo ""
    echo ""
    
    local success_count=$(wc -l < /tmp/success_$$ 2>/dev/null || echo 0)
    local error_count=$(wc -l < /tmp/error_$$ 2>/dev/null || echo 0)
    local total_requests=$((success_count + error_count))
    local rps=$(echo "scale=2; $total_requests / $duration" | bc)
    
    echo "Résultats:"
    echo "  Durée: ${duration}s"
    echo "  Requêtes totales: $total_requests"
    echo "  Succès: $success_count"
    echo "  Erreurs: $error_count"
    echo "  Requêtes/seconde: $rps"
    
    rm -f /tmp/success_$$ /tmp/error_$$
}

# Menu
case "${1:-latency}" in
    latency|-l)
        test_latency "${2:-10}"
        ;;
    load|-L)
        load_test "${2:-5}" "${3:-30}"
        ;;
    full|-f)
        echo -e "${YELLOW}🎯 Benchmark complet${NC}"
        echo ""
        ./monitor_resources.sh snapshot
        echo ""
        test_latency 5
        echo ""
        load_test 3 20
        ;;
    *)
        echo "Usage:"
        echo "  ./benchmark.sh latency [nombre]       # Test de latence"
        echo "  ./benchmark.sh load [concurrent] [duration]  # Test de charge"
        echo "  ./benchmark.sh full                   # Benchmark complet"
        ;;
esac

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
