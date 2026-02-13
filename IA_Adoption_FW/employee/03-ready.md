# Phase 3 : Ready - Configuration environnement personnel IA

## Vue d'ensemble

Cette phase décrit la **configuration de votre environnement de travail personnel** pour utiliser efficacement les outils IA. L'objectif est de créer un setup productif, sécurisé et conforme aux politiques de l'entreprise.

## 1. Gouvernance : Politique d'usage acceptable

### Comprendre la politique

Avant de configurer quoi que ce soit, vous devez comprendre et accepter la **politique d'usage acceptable IA** de votre organisation.

**Éléments clés à lire** :
- Outils approuvés et interdits
- Données autorisées vs interdites dans les prompts
- Obligations de sécurité (MFA, gestion des credentials)
- Processus de signalement des incidents
- Conséquences en cas de non-respect

**Où trouver la politique** :
- Intranet de l'entreprise
- Documentation RH/IT
- Email d'onboarding
- Demander à votre manager si introuvable

### Acceptation formelle

**Actions requises** :
1. Lire la politique complète (15-30 minutes)
2. Signer l'attestation d'acceptation (si requis)
3. Conserver une copie pour référence
4. Poser des questions à votre manager en cas de doute

**Questions à clarifier** :
- Puis-je utiliser mon compte personnel ChatGPT/Claude pour le travail ?
- Est-ce que mon équipe a des licences d'entreprise disponibles ?
- Quels outils sont déjà approuvés ?
- Où signaler un incident ?

## 2. Réseau : N/A (Solutions SaaS)

### Pourquoi pas de configuration réseau ?

Pour l'usage individuel d'outils SaaS (ChatGPT, Copilot, Claude, etc.), **aucune configuration réseau n'est nécessaire**.

**Raisons** :
- Les outils sont accessibles via HTTPS standard
- Pas de VPN spécifique requis
- Pas de firewall à configurer
- Pas d'infrastructure à gérer

### Vérifications basiques

**Ce que vous devez vérifier** :
- ✅ Accès internet fonctionnel
- ✅ HTTPS non bloqué par votre entreprise
- ✅ Pas de proxy d'entreprise bloquant les outils IA
- ✅ Latence acceptable (<500ms vers les services cloud)

**Si bloqué** : Contacter votre IT support pour débloquer l'accès.

## 3. Fiabilité : Responsabilité du provider SaaS

### Pourquoi pas de gestion de la fiabilité ?

Les **providers SaaS gèrent la haute disponibilité** pour vous :
- OpenAI (ChatGPT) : Multi-région, redondance automatique
- Anthropic (Claude) : Infrastructure distribuée
- GitHub (Copilot) : 99.9% SLA
- Google (Gemini) : Infrastructure Google Cloud

**Votre rôle** : Vérifier les status pages en cas de problème
- [OpenAI Status](https://status.openai.com/)
- [Anthropic Status](https://status.anthropic.com/)
- [GitHub Status](https://www.githubstatus.com/)

### Plan de continuité personnel

**Si votre outil principal est down** :
1. Vérifier la status page du provider
2. Passer temporairement à un outil alternatif
3. Signaler à votre manager si impact critique
4. Reprendre le travail non-IA pendant l'interruption

**Outils de backup recommandés** :
- Si ChatGPT down → Essayer Claude ou Gemini
- Si Copilot down → Travailler manuellement temporairement
- Pas besoin de setup complexe : garder 1-2 comptes alternatifs

## 4. Fondation : Setup IDE et extensions IA

### Étape 1 : Installer votre IDE (si nécessaire)

#### Option A : Visual Studio Code (Recommandé pour devs)

**Installation** :
```bash
# macOS
brew install --cask visual-studio-code

# Windows
winget install -e --id Microsoft.VisualStudioCode

# Linux (Debian/Ubuntu)
sudo apt install code
```

**Configuration de base** :
- Thème : Au choix (Dark+ recommandé)
- Extensions minimales : GitLens, Prettier, ESLint
- Settings sync : Activer pour sauvegarder votre config

#### Option B : Cursor (IDE IA-first)

**Installation** :
- Télécharger depuis [cursor.sh](https://cursor.sh)
- Installer (drag & drop sur macOS, setup.exe sur Windows)
- Importer settings depuis VS Code (optionnel)

**Avantages de Cursor** :
- IA intégrée nativement
- Chat avec codebase
- Multi-file editing
- Composer mode

#### Option C : Autres IDEs

| IDE | Support IA | Utilisation |
|-----|-----------|-------------|
| **IntelliJ IDEA** | AI Assistant (JetBrains) | Java, Kotlin, etc. |
| **PyCharm** | AI Assistant | Python |
| **WebStorm** | AI Assistant | JavaScript/TypeScript |
| **Zed** | Claude integration | Moderne, performant |

### Étape 2 : Installer les extensions IA

#### GitHub Copilot (VS Code)

**Installation** :
1. Ouvrir VS Code
2. Extensions panel (Cmd/Ctrl + Shift + X)
3. Chercher "GitHub Copilot"
4. Install
5. Sign in avec votre compte GitHub
6. Activer la licence (personnelle 10€/mois ou entreprise)

**Configuration** :
```json
// settings.json
{
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false
  },
  "github.copilot.editor.enableAutoCompletions": true
}
```

**Vérification** :
- Ouvrir un fichier code
- Taper un commentaire : `// Function to calculate factorial`
- Attendre suggestion (quelques secondes)
- Accepter avec Tab

#### Codeium (Alternative gratuite à Copilot)

**Installation** :
1. Extensions → Chercher "Codeium"
2. Install
3. Sign up (gratuit)
4. Activer l'extension

**Différences vs Copilot** :
- Gratuit pour usage individuel
- Support multi-modèles
- Moins de contexte dans les suggestions

#### Cursor AI (si vous utilisez Cursor)

**Configuration** :
1. Ouvrir Cursor
2. Settings → AI
3. Choisir votre modèle (GPT-4, Claude Sonnet)
4. Connecter votre API key (si custom) ou subscription
5. Tester le chat (Cmd/Ctrl + K)

**Features à activer** :
- Copilot++ : Suggestions améliorées
- Cursor Tab : Auto-completion
- Chat : Cmd/Ctrl + L
- Composer : Cmd/Ctrl + I (multi-file editing)

### Étape 3 : Configurer les outils de productivité

#### ChatGPT / Claude (Browser)

**Setup** :
1. Créer compte sur [chat.openai.com](https://chat.openai.com) ou [claude.ai](https://claude.ai)
2. Souscrire à l'abonnement Pro/Plus (20€/mois)
3. Activer MFA (obligatoire)
4. Configurer les settings :
   - Désactiver "Improve model for everyone" (privacy)
   - Activer "Chat history & training" seulement si approuvé
5. Créer des GPTs personnalisés (optionnel)

**Extensions navigateur utiles** :
- **WebChatGPT** : Ajouter contexte web à ChatGPT
- **ChatGPT Writer** : Rédiger emails avec IA
- **Save ChatGPT** : Exporter conversations

#### Outils de writing

**Grammarly** :
1. Installer extension navigateur
2. Créer compte (gratuit ou Premium 12€/mois)
3. Configurer préférences : US English, Formality level
4. Utiliser dans Gmail, docs, etc.

**Notion AI** (si votre entreprise utilise Notion) :
1. Activer Notion AI dans votre workspace (10€/mois)
2. Utiliser `/ai` dans les pages
3. Cas d'usage : résumés, rédaction, brainstorming

### Étape 4 : Sécurité et bonnes pratiques

#### Activer MFA partout

**Outils critiques à sécuriser** :
- GitHub (pour Copilot)
- OpenAI (ChatGPT)
- Anthropic (Claude)
- Cursor account
- Tous les autres outils IA

**Méthode recommandée** : Authenticator app (Google Authenticator, Authy, 1Password)

**Configuration** :
1. Aller dans Account Settings → Security
2. Enable Two-Factor Authentication
3. Scanner QR code avec authenticator app
4. Sauvegarder backup codes

#### Gestionnaire de mots de passe

**Recommandations** :
- **1Password** : Intégration excellente, support entreprise
- **Bitwarden** : Open-source, gratuit
- **LastPass** : Populaire, freemium

**Setup** :
1. Installer l'extension navigateur
2. Créer un master password fort (12+ caractères)
3. Sauvegarder le master password de manière sécurisée
4. Ajouter tous vos comptes IA au gestionnaire
5. Activer auto-fill

#### Ne jamais sauvegarder de credentials dans l'IDE

**Anti-patterns à éviter** :
```python
# ❌ JAMAIS faire ça
API_KEY = "sk-proj-abc123..."
DATABASE_PASSWORD = "mypassword123"

# ✅ Utiliser des variables d'environnement
import os
API_KEY = os.getenv("OPENAI_API_KEY")
DATABASE_PASSWORD = os.getenv("DB_PASSWORD")
```

**Configuration `.env`** :
```bash
# .env (à ajouter dans .gitignore)
OPENAI_API_KEY=sk-proj-abc123...
ANTHROPIC_API_KEY=sk-ant-abc123...
```

**Vérifier .gitignore** :
```
.env
.env.local
*.key
*.pem
config/secrets.json
```

### Étape 5 : Workspace organization

#### Structure de dossiers recommandée

```
~/Work/
├── Projects/
│   ├── project-a/
│   ├── project-b/
│   └── experiments/      # Pour tests IA
├── AI-Prompts/           # Bibliothèque de prompts
│   ├── coding/
│   ├── writing/
│   └── analysis/
└── Docs/
    └── ai-policy.md      # Copie politique entreprise
```

#### Bibliothèque de prompts personnels

**Créer un repo Git de prompts** :
```bash
mkdir ~/Work/AI-Prompts
cd ~/Work/AI-Prompts
git init
```

**Exemples de prompts à sauvegarder** :
```markdown
# coding-prompts.md

## Code Review
"Review this code for security vulnerabilities, performance issues, and best practices. Suggest improvements."

## Bug Debugging
"Analyze this error message and stack trace. Suggest likely root causes and debugging steps."

## Test Generation
"Generate comprehensive unit tests for this function, including edge cases and error handling."
```

**Avantages** :
- Réutilisation de prompts efficaces
- Partage avec l'équipe (si approuvé)
- Versioning et amélioration continue

## Checklist Ready (Employee)

### 🚀 Startup / Individu

- [ ] Lire et accepter la politique d'usage acceptable IA
- [ ] Installer un IDE (VS Code, Cursor, ou équivalent)
- [ ] Configurer extension IA (GitHub Copilot ou Codeium)
- [ ] Créer compte ChatGPT/Claude Pro avec MFA
- [ ] Installer gestionnaire de mots de passe
- [ ] Configurer .gitignore pour exclure secrets
- [ ] Créer bibliothèque de prompts personnels
- [ ] Tester setup sur un petit projet

## Prochaine étape

→ [Phase 4 : Govern](04-govern.md) - Gouverner votre usage personnel de l'IA
