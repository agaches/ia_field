# Ollama + Otoroshi - LLM Local avec API Gateway

## 📝 Contexte

Infrastructure locale pour héberger des modèles LLM avec sécurisation via API Gateway.
- **Ollama** : Serveur d'inférence LLM (mode CPU ou GPU AMD)
- **Otoroshi** : API Gateway pour authentification et gestion des accès
- **Déploiement** : Docker Compose, configuration automatisée

## 🏗️ Architecture

```
┌─────────────┐
│   Client    │  Requêtes avec API Key
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│   Otoroshi      │  Port 8080 - API Gateway
│                 │  - Authentification (API Keys)
│                 │  - Routage vers ollama.oto.tools
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│     Ollama      │  Port 11434 - Serveur LLM
│                 │  - Support CPU/GPU AMD (ROCm)
│                 │  - Compatible API OpenAI
└─────────────────┘
```

**Ports exposés :**
- `8080` : Otoroshi (UI Admin + API Gateway)
- `8443` : Otoroshi HTTPS
- `11434` : Ollama (accès direct interne)

## 🚀 Commandes Essentielles

### Configuration initiale (une seule fois)

Configurez votre fichier `/etc/hosts` pour accéder aux services via leurs noms de domaine :

```bash
# Ajouter les entrées DNS locales
echo "127.0.0.1 otoroshi.oto.tools otoroshi-api.oto.tools ollama.oto.tools" | sudo tee -a /etc/hosts
```

**Accès à l'interface Admin Otoroshi :**
- 🌐 URL : http://otoroshi.oto.tools:8080
- 👤 Login : `admin@otoroshi.io`
- 🔑 Mot de passe : `password`

### Démarrer l'infrastructure

```bash
# 1. Lancer les conteneurs
docker-compose up -d

# 2. Attendre le démarrage (15 secondes)
sleep 15

# 3. Configurer Otoroshi automatiquement
./setup/setup_otoroshi.sh

# 4. Charger un modèle
docker exec ollama ollama pull phi

# 5. Tester l'accès
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     http://localhost:8080/v1/models
```

### Gérer les modèles

```bash
# Télécharger un modèle
docker exec ollama ollama pull llama2
docker exec ollama ollama pull mistral

# Lister les modèles installés
docker exec ollama ollama list

# Supprimer un modèle
docker exec ollama ollama rm llama2

# Changer de modèle : il suffit de le charger puis de l'utiliser dans vos requêtes
docker exec ollama ollama pull codellama
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     -H 'Content-Type: application/json' \
     -d '{"model":"codellama","messages":[{"role":"user","content":"Hello"}]}' \
     http://localhost:8080/v1/chat/completions
```

### Gérer l'infrastructure

```bash
# Redémarrer
docker-compose restart

# Arrêter
docker-compose down

# Nettoyage complet (supprime les données)
docker-compose down -v

# Voir les logs
docker logs ollama -f
docker logs otoroshi -f
```

### Créer un client/clé API dans Otoroshi

**Via l'interface Admin :**
1. Accéder à http://localhost:8080
2. Login : `admin@otoroshi.io` / Password : `password`
3. Menu **Settings** → **Apikeys**
4. Cliquer **Create new apikey**
5. Remplir :
   - Name : `mon-app-client`
   - Client ID : `mon-client-id`
   - Client Secret : `mon-secret`
   - Authorized On : Sélectionner la route `ollama-route`
6. Sauvegarder

**Via API :**

```bash
curl -X POST http://localhost:8080/api/apikeys \
  -H 'Otoroshi-Client-Id: admin-api-apikey-id' \
  -H 'Otoroshi-Client-Secret: admin-api-apikey-secret' \
  -H 'Content-Type: application/json' \
  -d '{
    "clientId": "nouveau-client-id",
    "clientSecret": "nouveau-secret",
    "clientName": "Mon Application",
    "authorizedEntities": ["route_ollama-route"],
    "throttlingQuota": 10000000,
    "dailyQuota": 10000000
  }'
```

### Ajouter/changer de modèle

```bash
# Ajouter un nouveau modèle
docker exec ollama ollama pull mistral:7b

# Utiliser ce modèle dans vos requêtes
curl -H 'Otoroshi-Client-Id: my-llm-client-id' \
     -H 'Otoroshi-Client-Secret: my-llm-client-secret' \
     -H 'Host: ollama.oto.tools' \
     -H 'Content-Type: application/json' \
     -d '{"model":"mistral:7b","messages":[{"role":"user","content":"Bonjour"}]}' \
     http://localhost:8080/v1/chat/completions

# Changer pour un autre modèle déjà chargé : modifier le paramètre "model" dans la requête
```

### Basculer entre mode CPU et GPU

```bash
# Passer en mode CPU (recommandé, stable)
./setup/switch_mode.sh cpu

# Passer en mode GPU (expérimental, Radeon 860M pas officiellement supporté)
./setup/switch_mode.sh gpu

# Vérifier le mode actuel
./setup/switch_mode.sh status
```

## 🎯 Accéder à l'Admin Otoroshi

**URL :** http://localhost:8080

**Credentials Admin :**
- Email : `admin@otoroshi.io`
- Mot de passe : `password`

**Interface :**
- **Dashboard** : Métriques et aperçu
- **Routes** : Gérer les routes (dont `ollama-route`)
- **Apikeys** : Créer/gérer les clés d'accès clients
- **Settings** : Configuration globale

**⚠️ Sécurité :** En production, changez immédiatement les credentials par défaut.

## 📊 Tests et Monitoring

```bash
# Tester l'API
./test/test_api.sh

# Vérifier le GPU
./test/check_gpu.sh

# Monitorer les ressources
./test/monitor_resources.sh

# Benchmark de performance
./test/benchmark.sh latency 10
```

## 📁 Structure du Projet

```
local_llm_otoroshi/
├── docker-compose.yml          # Configuration des services
├── .env                        # Variables d'environnement
├── setup/                      # Scripts de configuration
│   ├── setup_otoroshi.sh      # Config automatique Otoroshi
│   ├── switch_mode.sh         # Basculer CPU/GPU
│   └── fix_gpu_permissions.sh # Permissions GPU
└── test/                       # Scripts de test
    ├── test_api.sh            # Tests API
    ├── benchmark.sh           # Performance
    ├── monitor_resources.sh   # Monitoring
    ├── check_gpu.sh           # Diagnostic GPU
    └── test_gpu_inference.sh  # Test inférence GPU
```

## 🔒 Credentials

**Admin Otoroshi (gestion du gateway) :**
- Client ID : `admin-api-apikey-id`
- Client Secret : `admin-api-apikey-secret`
- ⚠️ Ne pas utiliser pour les requêtes applicatives

**API Key Client (accès Ollama) :**
- Client ID : `my-llm-client-id`
- Client Secret : `my-llm-client-secret`
- ✅ À utiliser dans vos applications

## 📖 Références

- [Ollama API](https://github.com/ollama/ollama/blob/main/docs/api.md)
- [Otoroshi Documentation](https://maif.github.io/otoroshi/manual/)
- [OpenAI API Compatibility](https://github.com/ollama/ollama/blob/main/docs/openai.md)
