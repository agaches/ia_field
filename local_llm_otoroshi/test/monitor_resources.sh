#!/bin/bash

# Couleurs pour l'affichage
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   📊 Monitoring des ressources - Ollama + Otoroshi${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Fonction pour obtenir les stats d'un conteneur
get_container_stats() {
    local container=$1
    docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}" $container
}

# Fonction pour obtenir les stats GPU AMD (ROCm)
get_gpu_stats() {
    # Vérifier si rocm-smi existe dans le conteneur Ollama
    if docker exec ollama sh -c "command -v rocm-smi" &> /dev/null; then
        echo -e "\n${GREEN}🎮 GPU AMD (ROCm) - depuis conteneur Ollama${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        docker exec ollama rocm-smi --showuse --showmemuse --showtemp 2>/dev/null || \
        docker exec ollama rocm-smi 2>/dev/null
    elif command -v rocm-smi &> /dev/null; then
        echo -e "\n${GREEN}🎮 GPU AMD (ROCm) - depuis hôte${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        rocm-smi --showuse --showmemuse --showtemp
    else
        echo -e "\n${YELLOW}⚠️  GPU AMD : ROCm non accessible${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        # Vérifier si les devices GPU sont montés
        if docker exec ollama test -e /dev/kfd 2>/dev/null; then
            echo -e "${GREEN}✓${NC} Devices GPU montés (/dev/kfd, /dev/dri)"
            # Essayer d'obtenir des infos basiques sur le GPU
            echo ""
            echo "Informations GPU disponibles :"
            docker exec ollama sh -c "ls -la /dev/dri/ 2>/dev/null" | head -5
        else
            echo -e "${RED}✗${NC} Devices GPU non montés"
            echo "   L'image ollama:rocm nécessite un GPU AMD avec ROCm"
            echo "   Pour utiliser CPU uniquement, changez l'image vers ollama/ollama:latest"
        fi
    fi
}

# Fonction pour un monitoring continu
continuous_monitor() {
    local interval=${1:-5}
    echo -e "${YELLOW}🔄 Mode monitoring continu (intervalle: ${interval}s)${NC}"
    echo -e "${YELLOW}   Appuyez sur Ctrl+C pour arrêter${NC}"
    echo ""
    
    while true; do
        clear
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${BLUE}   📊 Monitoring en temps réel - $(date '+%H:%M:%S')${NC}"
        echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        
        echo -e "\n${GREEN}🐳 Conteneurs Docker${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}" ollama otoroshi
        
        get_gpu_stats
        
        echo -e "\n${GREEN}💾 Utilisation disque des volumes${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        docker system df -v 2>/dev/null | grep "local_vllm_otoroshi" || echo "Aucun volume trouvé"
        
        echo -e "\n${GREEN}📦 Modèles Ollama chargés${NC}"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        docker exec ollama ollama list 2>/dev/null | tail -n +2 || echo "Aucun modèle"
        
        sleep $interval
    done
}

# Fonction pour un snapshot unique
snapshot() {
    echo -e "${GREEN}🐳 Conteneurs Docker${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    get_container_stats "ollama"
    echo ""
    get_container_stats "otoroshi"
    
    get_gpu_stats
    
    echo -e "\n${GREEN}💾 Volumes Docker${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    docker volume ls | grep "local_vllm_otoroshi"
    echo ""
    docker system df -v 2>/dev/null | grep -A 5 "VOLUME NAME" | head -10
    
    echo -e "\n${GREEN}🔍 Détails Ollama${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Modèles chargés:"
    docker exec ollama ollama list 2>/dev/null || echo "Aucun modèle chargé ou erreur"
    echo ""
    echo "Espace disque utilisé par les modèles:"
    docker exec ollama du -sh /root/.ollama 2>/dev/null || echo "Non disponible"
    
    echo -e "\n${GREEN}📈 Utilisation système globale${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "CPU:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "  Utilisation: " 100 - $1 "%"}'
    echo ""
    echo "Mémoire:"
    free -h | grep Mem | awk '{print "  Total: " $2 "\n  Utilisée: " $3 "\n  Disponible: " $7}'
    echo ""
    echo "Disque (/):"
    df -h / | tail -1 | awk '{print "  Total: " $2 "\n  Utilisé: " $3 " (" $5 ")\n  Disponible: " $4}'
}

# Fonction pour exporter les stats au format JSON
export_stats() {
    local output_file="resource_stats_$(date +%Y%m%d_%H%M%S).json"
    echo -e "${YELLOW}📄 Export des statistiques vers $output_file${NC}"
    
    {
        echo "{"
        echo "  \"timestamp\": \"$(date -Iseconds)\","
        echo "  \"containers\": {"
        
        # Stats Ollama
        local ollama_stats=$(docker stats ollama --no-stream --format "{{.CPUPerc}},{{.MemUsage}},{{.NetIO}}")
        IFS=',' read -r cpu mem net <<< "$ollama_stats"
        echo "    \"ollama\": {"
        echo "      \"cpu\": \"$cpu\","
        echo "      \"memory\": \"$mem\","
        echo "      \"network\": \"$net\","
        # Ajouter le nombre de modèles
        local model_count=$(docker exec ollama ollama list 2>/dev/null | tail -n +2 | wc -l)
        echo "      \"models_loaded\": $model_count"
        echo "    },"
        
        # Stats Otoroshi
        local otoroshi_stats=$(docker stats otoroshi --no-stream --format "{{.CPUPerc}},{{.MemUsage}},{{.NetIO}}")
        IFS=',' read -r cpu mem net <<< "$otoroshi_stats"
        echo "    \"otoroshi\": {"
        echo "      \"cpu\": \"$cpu\","
        echo "      \"memory\": \"$mem\","
        echo "      \"network\": \"$net\""
        echo "    }"
        echo "  },"
        
        # Stats GPU si disponible
        if docker exec ollama sh -c "command -v rocm-smi" &> /dev/null; then
            echo "  \"gpu\": {"
            echo "    \"available\": true,"
            echo "    \"type\": \"AMD ROCm\","
            echo "    \"accessible_from\": \"container\""
            echo "  },"
        elif command -v rocm-smi &> /dev/null; then
            echo "  \"gpu\": {"
            echo "    \"available\": true,"
            echo "    \"type\": \"AMD ROCm\","
            echo "    \"accessible_from\": \"host\""
            echo "  },"
        elif docker exec ollama test -e /dev/kfd 2>/dev/null; then
            echo "  \"gpu\": {"
            echo "    \"available\": true,"
            echo "    \"type\": \"AMD (devices mounted)\","
            echo "    \"accessible_from\": \"container\","
            echo "    \"note\": \"rocm-smi not available but devices are mounted\""
            echo "  },"
        else
            echo "  \"gpu\": {"
            echo "    \"available\": false"
            echo "  },"
        fi
        
        # Stats système
        local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
        local mem_stats=$(free -m | grep Mem | awk '{print $2","$3","$7}')
        IFS=',' read -r mem_total mem_used mem_available <<< "$mem_stats"
        
        echo "  \"system\": {"
        echo "    \"cpu_usage_percent\": $cpu_usage,"
        echo "    \"memory_mb\": {"
        echo "      \"total\": $mem_total,"
        echo "      \"used\": $mem_used,"
        echo "      \"available\": $mem_available"
        echo "    }"
        echo "  }"
        echo "}"
    } > "$output_file"
    
    echo -e "${GREEN}✅ Export terminé: $output_file${NC}"
    cat "$output_file" | jq . 2>/dev/null || cat "$output_file"
}

# Menu principal
case "${1:-snapshot}" in
    continuous|watch|-w)
        continuous_monitor "${2:-5}"
        ;;
    export|-e)
        export_stats
        ;;
    snapshot|*)
        snapshot
        ;;
esac

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "💡 Usage:"
echo "  ./monitor_resources.sh              # Snapshot unique"
echo "  ./monitor_resources.sh continuous   # Monitoring continu (5s)"
echo "  ./monitor_resources.sh continuous 10 # Monitoring continu (10s)"
echo "  ./monitor_resources.sh export       # Export JSON"
