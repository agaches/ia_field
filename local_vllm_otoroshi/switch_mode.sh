#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

MODE=${1:-status}

case "$MODE" in
    cpu)
        echo -e "${YELLOW}🔄 Passage en mode CPU...${NC}"
        docker-compose down
        cp docker-compose.yml docker-compose-gpu.yml.backup
        cp docker-compose-cpu.yml docker-compose.yml
        docker-compose up -d
        echo -e "${GREEN}✅ Mode CPU activé${NC}"
        echo "Configuration sauvegardée dans docker-compose-gpu.yml.backup"
        ;;
    gpu)
        echo -e "${YELLOW}🔄 Passage en mode GPU (expérimental pour Radeon 860M)...${NC}"
        docker-compose down
        if [ -f docker-compose-gpu.yml.backup ]; then
            cp docker-compose-gpu.yml.backup docker-compose.yml
        fi
        docker-compose up -d
        echo -e "${GREEN}✅ Mode GPU activé${NC}"
        echo ""
        echo -e "${YELLOW}⚠️  Note: Le Radeon 860M (RDNA3.5) a un support ROCm limité${NC}"
        echo "Surveillez les logs: docker logs ollama -f"
        ;;
    status)
        echo -e "${BLUE}📊 État actuel${NC}"
        echo ""
        if docker inspect ollama 2>/dev/null | grep -q "ollama:rocm"; then
            echo "Mode: GPU (ROCm)"
            docker inspect ollama | grep -A 5 "Devices"
        else
            echo "Mode: CPU"
        fi
        echo ""
        docker ps --filter name=ollama --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
        ;;
    *)
        echo "Usage: $0 {cpu|gpu|status}"
        echo ""
        echo "  cpu    - Passer en mode CPU (stable)"
        echo "  gpu    - Passer en mode GPU ROCm (expérimental)"
        echo "  status - Afficher le mode actuel"
        ;;
esac
