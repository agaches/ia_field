# Installation locale d'un Ollama & otoroshi sur un pc local (pc portable avec Ryzen 7 IA et 32 Go de ram)

## Contexte et besoin
Usage de modèles différents sur le pc local (tests, usages restreints).
Publication des modèles simplement dans un Ollama (cible future de production), ça servira de tutoriel
Usage d'un proxy d'api pour accéder au modèle, gérer les clés et cie.
Otoroshi intéressant, très léger et open source.
Bénéficie en plus d'un workflow adapté IA (proche d'un n8n ? partie à tester)

## Cible technique
Installation automatisée et simple, usage de docker/cie pour le setup et déploiement
Configuration initiale bien documentée et variabilisée pour adaptation facile et "ready-to-prod"

## Installation et Démarrage

### Prérequis
- Docker & Docker Compose installés.
- Pilotes AMD ROCm installés sur la machine hôte (pour le support GPU).

### 1. Lancer la stack
Un fichier `.env` a été créé avec votre token Hugging Face. Docker Compose le chargera automatiquement.

```bash
# Démarrer les services (avec sudo si nécessaire)
sudo docker-compose up -d
```

### 2. Configurer Otoroshi
Une fois les conteneurs lancés, exécutez le script de configuration automatique :
```bash
./setup_otoroshi.sh
```
Ce script va :
- Attendre qu'Otoroshi soit prêt.
- Créer une **Route** exposant Ollama sur le domaine `ollama.oto.tools`.
- Sécuriser cette route avec une authentification par API Key.
- Créer une **API Key** de test (`my-llm-client-id` / `my-llm-client-secret`).

### 3. Tester l'accès
Vous pouvez maintenant interroger votre LLM via le proxy sécurisé.

**Lister les modèles disponibles :**
```bash
curl -H "Host: ollama.oto.tools" \
     -H "Authorization: Bearer my-llm-client-id:my-llm-client-secret" \
     http://localhost:8080/v1/models
```

**Tester la génération de texte (Inférence) :**
*Note : Assurez-vous d'avoir téléchargé un modèle dans Ollama au préalable (ex: `docker exec -it ollama ollama pull tinyllama`)*

```bash
curl -X POST http://localhost:8080/v1/completions \
     -H "Host: ollama.oto.tools" \
     -H "Authorization: Bearer my-llm-client-id:my-llm-client-secret" \
     -H "Content-Type: application/json" \
     -d '{
       "model": "tinyllama",
       "prompt": "L intelligence artificielle est",
       "max_tokens": 20,
       "temperature": 0.7
     }'
```

### Notes Techniques
- **Image Ollama** : Le `docker-compose.yml` utilise `ollama/ollama:rocm` pour la compatibilité AMD. Assurez-vous que les périphériques `/dev/kfd` et `/dev/dri` sont bien accessibles.
- **Modèle** : Ollama démarre vide. Vous devez télécharger un modèle via la commande `ollama pull <model>` dans le conteneur.
