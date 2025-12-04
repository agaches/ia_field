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

## 🔒 Sécurité

- L'accès à Ollama est protégé par API key via Otoroshi
- Les quotas sont configurés (10M requêtes/jour)
- Pour la production, changez les credentials par défaut
- Configurez HTTPS via Otoroshi pour les connexions externes

## 📖 Documentation

- [Ollama API](https://github.com/ollama/ollama/blob/main/docs/api.md)
- [Otoroshi Documentation](https://maif.github.io/otoroshi/manual/)
- [OpenAI API Compatibility](https://github.com/ollama/ollama/blob/main/docs/openai.md)

## ⚡ GPU AMD (ROCm)

Le conteneur utilise l'image `ollama/ollama:rocm` pour le support GPU AMD.
Les devices `/dev/kfd` et `/dev/dri` sont mappés automatiquement.

Pour utiliser CPU uniquement, modifiez `docker-compose.yml` :
```yaml
ollama:
  image: ollama/ollama:latest  # Au lieu de :rocm
  # Supprimez la section devices
```

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
