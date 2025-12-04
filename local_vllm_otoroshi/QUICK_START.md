# 🚀 Guide de Démarrage Rapide

## 📝 Résumé de votre configuration

- **GPU**: AMD Radeon 860M (RDNA3.5) - Device ID: 1114
- **CPU**: AMD Ryzen AI 7 350 (8 cœurs)
- **Statut ROCm**: ⚠️ GPU non reconnu (trop récent)
- **Recommandation**: **Utiliser le mode CPU**

## ⚡ Démarrage en 3 minutes

### Option 1: Mode CPU (Recommandé - Stable)

```bash
# 1. Démarrer en mode CPU
docker-compose down
docker-compose up -d

# 2. Attendre le démarrage
sleep 15

# 3. Configurer Otoroshi
./setup_otoroshi.sh

# 4. Charger un modèle léger pour commencer
docker exec ollama ollama pull phi

# 5. Tester
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     -H 'Content-Type: application/json' \
     -d '{"model":"phi","messages":[{"role":"user","content":"Hello!"}]}' \
     http://localhost:8080/v1/chat/completions

# 6. Surveiller les performances
./monitor_resources.sh
```

### Option 2: Tester le mode GPU (Expérimental)

```bash
# Note: Le GPU Radeon 860M n'est pas officiellement supporté
# mais vous pouvez essayer

# Surveiller les logs en temps réel
docker logs ollama -f &

# Charger un modèle et observer
docker exec ollama ollama pull phi

# Si vous voyez des erreurs ROCm, passez en mode CPU
```

## 📊 Vérifications rapides

```bash
# Vérifier que tout fonctionne
./check_gpu.sh

# Tester l'API
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models

# Monitorer en continu
./monitor_resources.sh continuous
```

## 🎯 Modèles recommandés pour votre config

### Mode CPU (RAM: 16-32GB)

| Modèle | Taille | Performance | Usage |
|--------|--------|-------------|-------|
| **phi** | 2.7GB | ⭐⭐⭐⭐⭐ | Rapide, code, chat |
| **tinyllama** | 600MB | ⭐⭐⭐⭐⭐ | Très rapide, tests |
| **llama2:7b** | 3.8GB | ⭐⭐⭐⭐ | Chat général |
| **mistral** | 4.1GB | ⭐⭐⭐⭐ | Code, analyse |
| **codellama:7b** | 3.8GB | ⭐⭐⭐⭐ | Code spécifique |

### Téléchargement

```bash
# Petit et rapide
docker exec ollama ollama pull phi
docker exec ollama ollama pull tinyllama

# Plus gros mais meilleurs
docker exec ollama ollama pull llama2:7b
docker exec ollama ollama pull mistral
```

## 🔧 Commandes utiles

```bash
# Voir les modèles installés
docker exec ollama ollama list

# Supprimer un modèle
docker exec ollama ollama rm nom_modele

# Voir l'espace disque utilisé
docker exec ollama du -sh /root/.ollama

# Redémarrer proprement
docker-compose restart

# Nettoyer complètement
docker-compose down -v
docker-compose up -d
./setup_otoroshi.sh
```

## 🐛 Résolution de problèmes

### "Otoroshi-Error: invalid apikey"

```bash
# Reconfigurer Otoroshi
./setup_otoroshi.sh
```

### "no route found"

```bash
# Vérifier que les services sont démarrés
docker ps

# Attendre plus longtemps
sleep 30
./setup_otoroshi.sh
```

### Performances lentes

```bash
# Utiliser un modèle plus petit
docker exec ollama ollama pull phi

# Vérifier l'utilisation CPU
./monitor_resources.sh
```

## 📈 Performances attendues (CPU mode)

**Avec votre Ryzen AI 7 350 (8 cœurs):**

| Modèle | Tokens/sec | Latence initiale |
|--------|-----------|------------------|
| phi | ~15-25 | ~2s |
| tinyllama | ~30-50 | ~1s |
| llama2:7b | ~8-15 | ~3s |
| mistral | ~8-12 | ~3s |

*Note: Les performances varient selon la longueur du prompt et la charge système*

## 🎓 Prochaines étapes

1. ✅ **Testez avec `phi`** - Modèle rapide et léger
2. ✅ **Explorez l'UI Otoroshi** - http://localhost:8080
3. ✅ **Créez d'autres API keys** - Pour différentes applications
4. ✅ **Ajoutez des quotas** - Limitez l'usage par client
5. ✅ **Configurez HTTPS** - Pour un usage en production

## 📚 Documentation complète

- README.md - Guide complet
- check_gpu.sh - Diagnostic GPU
- monitor_resources.sh - Monitoring
- benchmark.sh - Tests de performance

## 🆘 Besoin d'aide ?

```bash
# Diagnostic complet
./check_gpu.sh

# Logs détaillés
docker logs ollama
docker logs otoroshi

# État des conteneurs
docker ps
docker stats
```

---

**🎉 Vous êtes prêt ! Commencez par charger `phi` et testez votre première requête.**
