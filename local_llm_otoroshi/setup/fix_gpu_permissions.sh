#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   🔧 Correction des permissions GPU${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Vérifier si l'utilisateur est déjà dans les groupes
if groups | grep -q render && groups | grep -q video; then
    echo -e "${GREEN}✅ Vous êtes déjà dans les groupes render et video${NC}"
    echo ""
    echo "Redémarrage des conteneurs pour appliquer la configuration..."
    docker-compose restart ollama
    echo ""
    echo -e "${GREEN}✅ Terminé !${NC}"
    exit 0
fi

echo -e "${YELLOW}📝 Ajout de l'utilisateur aux groupes render et video${NC}"
echo ""

# Ajouter l'utilisateur aux groupes
echo "Exécution de: sudo usermod -aG render,video $USER"
sudo usermod -aG render,video $USER

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Utilisateur ajouté aux groupes avec succès${NC}"
    echo ""
    echo -e "${YELLOW}⚠️  IMPORTANT: Vous devez vous déconnecter et reconnecter pour que les changements prennent effet${NC}"
    echo ""
    echo "Options:"
    echo "  1. Déconnexion/reconnexion de votre session"
    echo "  2. Ou redémarrage complet: sudo reboot"
    echo "  3. Ou pour appliquer immédiatement (session temporaire): newgrp render"
    echo ""
    echo "Après reconnexion, relancez:"
    echo "  docker-compose restart ollama"
    echo "  ./check_gpu.sh"
else
    echo -e "${RED}✗ Erreur lors de l'ajout aux groupes${NC}"
    exit 1
fi
