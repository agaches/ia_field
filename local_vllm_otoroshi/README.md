# Ollama + Otoroshi - Configuration LLM avec API Gateway

Ce projet configure une infrastructure LLM locale avec :
- **Ollama** : Serveur d'inférence LLM avec support GPU AMD (ROCm)
- **Otoroshi** : API Gateway pour sécuriser et gérer l'accès à Ollama

## 🚀 Démarrage rapide

```bash
# 1. Démarrer l'infrastructure
docker-compose up -d

# 2. Attendre le démarrage (15 secondes)
sleep 15

# 3. Configurer Otoroshi (créer la route et l'API key)
./setup_otoroshi.sh

# 4. Charger un modèle
docker exec ollama ollama pull llama2

# 5. Tester
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models
```

## 📋 Prérequis

- Docker et Docker Compose
- GPU AMD compatible avec ROCm (optionnel, sinon utiliser `ollama/ollama:latest`)
- Permissions Docker : `sudo usermod -aG docker $USER`

## 🔧 Configuration

### Credentials par défaut

**Otoroshi Admin UI** (http://localhost:8080)
- Login: `admin@otoroshi.io`
- Password: `password`

**API Key pour accéder à Ollama**
- Client ID: `my-llm-client-id`
- Client Secret: `my-llm-client-secret`

### Ports exposés

- `8080` : Otoroshi (UI + API)
- `8443` : Otoroshi HTTPS
- `11434` : Ollama (accès direct, optionnel)

## 📚 Exemples d'utilisation

### Lister les modèles disponibles

```bash
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models
```

### Chat Completion

```bash
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     -H 'Content-Type: application/json' \
     -d '{
       "model": "llama2",
       "messages": [
         {"role": "user", "content": "Hello!"}
       ]
     }' \
     http://localhost:8080/v1/chat/completions
```

### Streaming Response

```bash
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     -H 'Content-Type: application/json' \
     -d '{
       "model": "llama2",
       "messages": [
         {"role": "user", "content": "Write a short poem"}
       ],
       "stream": true
     }' \
     http://localhost:8080/v1/chat/completions
```

## 🔄 Gestion des modèles

```bash
# Télécharger un modèle
docker exec ollama ollama pull llama2
docker exec ollama ollama pull mistral
docker exec ollama ollama pull codellama

# Lister les modèles locaux
docker exec ollama ollama list

# Supprimer un modèle
docker exec ollama ollama rm llama2
```

## 🛠️ Maintenance

### Redémarrer l'infrastructure

```bash
docker-compose restart
```

### Redémarrer complètement (avec nettoyage)

```bash
docker-compose down -v
docker-compose up -d
sleep 15
./setup_otoroshi.sh
```

### Voir les logs

```bash
# Logs Otoroshi
docker logs otoroshi -f

# Logs Ollama
docker logs ollama -f

# Logs des deux services
docker-compose logs -f
```

## 📊 Monitoring et Benchmarks

### Monitoring des ressources

```bash
# Snapshot unique des ressources
./monitor_resources.sh

# Monitoring continu avec GPU (si mode GPU)
./monitor_resources.sh continuous

# Export des statistiques
./monitor_resources.sh export
```

**Note:** Le monitoring GPU affichera un avertissement en mode CPU ou si le GPU n'est pas supporté.

### Benchmarks de performance

```bash
# Rendre les scripts exécutables
chmod +x monitor_resources.sh benchmark.sh

# Test de latence (10 requêtes séquentielles)
./benchmark.sh latency 10

# Test de charge (5 requêtes simultanées pendant 30s)
./benchmark.sh load 5 30

# Benchmark complet
./benchmark.sh full
```

### Métriques surveillées

- **CPU**: Utilisation par conteneur et globale
- **Mémoire**: RAM utilisée par conteneur et système
- **GPU**: Utilisation GPU AMD (si ROCm installé)
- **Réseau**: I/O réseau par conteneur
- **Disque**: Utilisation des volumes Docker
- **Latence**: Temps de réponse des requêtes
- **Throughput**: Requêtes par seconde

## 🔒 Sécurité

### Deux types de credentials

1. **Credentials ADMIN** (pour gérer Otoroshi)
   - Client ID: `admin-api-apikey-id`
   - Client Secret: `admin-api-apikey-secret`
   - Usage: Créer routes, API keys, configuration via API d'admin
   - ⚠️ Ne jamais utiliser pour les requêtes applicatives

2. **API Key CLIENT** (pour accéder à Ollama)
   - Client ID: `my-llm-client-id`
   - Client Secret: `my-llm-client-secret`
   - Usage: Accès à Ollama via Otoroshi
   - ✅ À utiliser dans vos applications

### Test de sécurité

Lancez le script de test pour vérifier :
```bash
chmod +x test_api.sh
./test_api.sh
```

- L'accès à Ollama est protégé par API key via Otoroshi
- Les quotas sont configurés (10M requêtes/jour)
- Pour la production, changez les credentials par défaut
- Configurez HTTPS via Otoroshi pour les connexions externes

## 📖 Documentation

- [Ollama API](https://github.com/ollama/ollama/blob/main/docs/api.md)
- [Otoroshi Documentation](https://maif.github.io/otoroshi/manual/)
- [OpenAI API Compatibility](https://github.com/ollama/ollama/blob/main/docs/openai.md)

## ⚡ GPU AMD (ROCm)

### ⚠️ Important: GPU Radeon 860M (RDNA3.5)

Votre GPU **AMD Radeon 860M** (intégré au Ryzen AI 7 350) est très récent (2024) et le **support ROCm est encore expérimental**.

**Deux modes disponibles :**

### Mode CPU (Recommandé - Stable)

```bash
chmod +x switch_mode.sh
./switch_mode.sh cpu
```

**Avantages:**
- ✅ Stable et fonctionnel
- ✅ Bonne performance avec votre Ryzen AI 7 350 (8 cœurs)
- ✅ Pas de problèmes de compatibilité

**Inconvénients:**
- ❌ Plus lent que GPU pour les grands modèles
- ❌ Consommation mémoire RAM plus importante

### Mode GPU (Expérimental)

```bash
./switch_mode.sh gpu
docker logs ollama -f  # Surveillez les logs
```

**Note:** Le Radeon 860M (Device ID: 1114) n'est pas encore officiellement supporté par ROCm.
Vous pouvez essayer mais des erreurs sont attendues.

### Vérifier le mode actuel

```bash
./switch_mode.sh status
```

### Configuration GPU requise (si mode GPU)

**1. Ajouter votre utilisateur au groupe video :**

```bash
sudo usermod -aG video $USER
# Déconnexion/reconnexion nécessaire
```

**2. Identifier la version GFX de votre GPU :**

```bash
# Votre GPU Radeon 860M est probablement:
# - gfx1102 (RDNA3.5) → HSA_OVERRIDE_GFX_VERSION=11.0.2
# - ou gfx1100 (RDNA3) → HSA_OVERRIDE_GFX_VERSION=11.0.0

rocminfo | grep gfx
```

**3. Ajuster docker-compose.yml si nécessaire**

### Performances comparatives

```bash
# Benchmark CPU vs GPU
./benchmark.sh latency 5
```

**Attendu avec votre configuration:**
- **CPU Mode**: ~10-30 tokens/sec (selon le modèle)
- **GPU Mode**: Si compatible, ~30-100 tokens/sec

## 🎯 Architecture

```
┌─────────────┐
│   Client    │
└──────┬──────┘
       │ HTTP + API Key
       ▼
┌─────────────────┐
│   Otoroshi      │ (Port 8080)
│   API Gateway   │
└──────┬──────────┘
       │ HTTP (réseau interne)
       ▼
┌─────────────────┐
│     Ollama      │ (Port 11434)
│   LLM Server    │
└─────────────────┘
```
