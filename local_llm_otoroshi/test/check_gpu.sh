#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   🔍 Diagnostic GPU AMD / ROCm${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 1. Vérifier les devices GPU sur l'hôte
echo -e "${YELLOW}1️⃣  Devices GPU sur l'hôte${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -e /dev/kfd ] && [ -e /dev/dri ]; then
    echo -e "${GREEN}✓${NC} Devices GPU trouvés:"
    ls -la /dev/kfd /dev/dri/card* /dev/dri/renderD* 2>/dev/null
else
    echo -e "${RED}✗${NC} Devices GPU non trouvés (/dev/kfd ou /dev/dri manquants)"
    echo "   Votre système n'a peut-être pas de GPU AMD ou ROCm n'est pas configuré"
fi
echo ""

# 2. Vérifier les permissions
echo -e "${YELLOW}2️⃣  Permissions des devices GPU${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -e /dev/kfd ]; then
    stat -c "  /dev/kfd: %U:%G (permissions: %a)" /dev/kfd
    groups | grep -q render && echo -e "${GREEN}✓${NC} Vous êtes dans le groupe 'render'" || echo -e "${YELLOW}⚠${NC}  Vous n'êtes pas dans le groupe 'render'"
    groups | grep -q video && echo -e "${GREEN}✓${NC} Vous êtes dans le groupe 'video'" || echo -e "${YELLOW}⚠${NC}  Vous n'êtes pas dans le groupe 'video'"
else
    echo -e "${RED}✗${NC} /dev/kfd non accessible"
fi
echo ""

# 3. Vérifier ROCm sur l'hôte
echo -e "${YELLOW}3️⃣  ROCm sur l'hôte${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if command -v rocm-smi &> /dev/null; then
    echo -e "${GREEN}✓${NC} rocm-smi trouvé sur l'hôte"
    rocm-smi --showproductname 2>/dev/null || rocm-smi 2>/dev/null | head -20
elif command -v rocminfo &> /dev/null; then
    echo -e "${GREEN}✓${NC} rocminfo trouvé sur l'hôte"
    rocminfo | grep -A 5 "Agent" | head -20
else
    echo -e "${YELLOW}⚠${NC}  ROCm non installé sur l'hôte (normal si utilisation via Docker uniquement)"
fi
echo ""

# 4. Vérifier les devices dans le conteneur Ollama
echo -e "${YELLOW}4️⃣  Devices GPU dans le conteneur Ollama${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if docker ps | grep -q ollama; then
    if docker exec ollama test -e /dev/kfd 2>/dev/null; then
        echo -e "${GREEN}✓${NC} /dev/kfd monté dans le conteneur"
        docker exec ollama ls -la /dev/kfd 2>/dev/null
    else
        echo -e "${RED}✗${NC} /dev/kfd NON monté dans le conteneur"
    fi
    
    if docker exec ollama test -e /dev/dri 2>/dev/null; then
        echo -e "${GREEN}✓${NC} /dev/dri monté dans le conteneur"
        docker exec ollama ls -la /dev/dri/ 2>/dev/null | head -5
    else
        echo -e "${RED}✗${NC} /dev/dri NON monté dans le conteneur"
    fi
else
    echo -e "${RED}✗${NC} Conteneur Ollama non démarré"
fi
echo ""

# 5. Vérifier ROCm dans le conteneur
echo -e "${YELLOW}5️⃣  ROCm dans le conteneur Ollama${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if docker ps | grep -q ollama; then
    if docker exec ollama sh -c "command -v rocm-smi" &> /dev/null; then
        echo -e "${GREEN}✓${NC} rocm-smi disponible dans le conteneur"
        echo ""
        docker exec ollama rocm-smi 2>&1 | head -30
    elif docker exec ollama sh -c "command -v rocminfo" &> /dev/null; then
        echo -e "${GREEN}✓${NC} rocminfo disponible dans le conteneur"
        docker exec ollama rocminfo 2>&1 | grep -A 3 "Agent\|Device Type" | head -20
    else
        echo -e "${YELLOW}⚠${NC}  Outils ROCm non trouvés dans le conteneur"
        echo "   Vérification de la présence de bibliothèques ROCm..."
        docker exec ollama sh -c "ls /opt/rocm* 2>/dev/null || echo 'Répertoire ROCm non trouvé'"
    fi
else
    echo -e "${RED}✗${NC} Conteneur Ollama non démarré"
fi
echo ""

# 6. Test d'utilisation GPU par Ollama
echo -e "${YELLOW}6️⃣  Test d'utilisation GPU par Ollama${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if docker ps | grep -q ollama; then
    echo "Vérification des variables d'environnement ROCm..."
    docker exec ollama sh -c "env | grep -i rocm || echo 'Aucune variable ROCm trouvée'"
    echo ""
    
    # Vérifier les logs Ollama pour des messages GPU
    echo "Recherche de messages GPU dans les logs Ollama (10 dernières secondes)..."
    docker logs ollama --since 10s 2>&1 | grep -i "gpu\|rocm\|hip\|amd" || echo "Aucun message GPU trouvé"
else
    echo -e "${RED}✗${NC} Conteneur Ollama non démarré"
fi
echo ""

# 7. Informations système
echo -e "${YELLOW}7️⃣  Informations système${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Kernel: $(uname -r)"
echo "Distribution: $(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo ""
echo "Cartes graphiques détectées par lspci:"
lspci | grep -i "vga\|3d\|display" || echo "Aucune carte graphique trouvée"
echo ""

# 8. Recommandations
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   💡 Recommandations${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if ! lspci | grep -qi "AMD\|Radeon"; then
    echo -e "${YELLOW}⚠️  Aucun GPU AMD détecté${NC}"
    echo "   → Votre système n'a pas de GPU AMD"
    echo "   → Utilisez l'image CPU: changez 'ollama/ollama:rocm' vers 'ollama/ollama:latest'"
    echo "   → Supprimez la section 'devices:' du docker-compose.yml"
    echo ""
elif [ ! -e /dev/kfd ]; then
    echo -e "${YELLOW}⚠️  GPU AMD détecté mais /dev/kfd manquant${NC}"
    echo "   → ROCm n'est pas installé ou mal configuré sur l'hôte"
    echo "   → Installation ROCm (Ubuntu/Debian):"
    echo "     sudo apt-get update"
    echo "     sudo apt-get install rocm-dkms"
    echo "     sudo usermod -aG render,video \$USER"
    echo "     sudo reboot"
    echo ""
elif ! docker exec ollama test -e /dev/kfd 2>/dev/null; then
    echo -e "${RED}✗ GPU AMD disponible mais non monté dans le conteneur${NC}"
    echo "   → Vérifiez le docker-compose.yml (section devices:)"
    echo "   → Redémarrez les conteneurs: docker-compose down && docker-compose up -d"
    echo ""
else
    echo -e "${GREEN}✅ Configuration GPU semble correcte${NC}"
    echo ""
    echo "Pour tester l'utilisation GPU:"
    echo "  1. Chargez un modèle: docker exec ollama ollama pull llama2"
    echo "  2. Faites une requête"
    echo "  3. Surveillez l'utilisation: ./monitor_resources.sh continuous"
    echo ""
fi

# 9. Commandes de dépannage
echo -e "${YELLOW}🔧 Commandes de dépannage${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "# Ajouter l'utilisateur aux groupes GPU (nécessite redémarrage):"
echo "sudo usermod -aG render,video \$USER"
echo ""
echo "# Passer à l'image CPU (si pas de GPU AMD):"
echo "sed -i 's/ollama\/ollama:rocm/ollama\/ollama:latest/' docker-compose.yml"
echo "# Puis commenter la section devices dans docker-compose.yml"
echo ""
echo "# Redémarrer avec une image propre:"
echo "docker-compose down && docker-compose up -d"
echo ""
echo "# Voir les logs Ollama en temps réel:"
echo "docker logs ollama -f"
echo ""
