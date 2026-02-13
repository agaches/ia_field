# Phase 3 : Ready - Infrastructure équipe partagée IA

## Vue d'ensemble

Cette phase décrit la **configuration de l'infrastructure partagée** pour permettre à une équipe de développement d'utiliser efficacement l'IA. L'objectif est de créer un environnement collaboratif, sécurisé et cohérent sans surcharge de gestion.

## 1. Gouvernance : Politiques équipe

### Documenter les politiques d'équipe

**Contenu minimum (5-10 pages)** :
- Outils approuvés pour l'équipe
- Processus d'expérimentation (2-week sprints)
- Data handling rules (voir Phase 1)
- Validation des outputs (code review, tests)
- Budget et allocation des coûts

**Template de politique équipe** :
```markdown
# Politique IA - Équipe [Nom]

## 1. Outils Approuvés
- GitHub Copilot : Tous les développeurs
- ChatGPT Team : Tech leads et seniors
- Cursor : Optionnel (subscription personnelle)

## 2. Data Handling
- ✅ Code open-source et non-propriétaire
- ⚠️ Architecture interne (après anonymisation)
- ❌ Code client propriétaire sans permission
- ❌ Credentials, API keys, secrets

## 3. Validation Obligatoire
- Code review pour tout code IA-généré
- Tests unitaires pour code critique
- Security scan automatisé (pre-commit hooks)

## 4. Budget
- $50/dev/mois pour outils standard
- Buffer 20% pour expérimentation
- Revue mensuelle des coûts

## 5. Formation
- Onboarding IA (2h) pour nouveaux membres
- Atelier mensuel de partage de best practices
```

**Où stocker la politique** :
- Wiki équipe (Confluence, Notion, GitHub Wiki)
- Accessible à tous les membres
- Versionnée (Git si possible)
- Revue trimestrielle

### Communiquer les politiques

**Actions** :
1. Présenter en team meeting (30min)
2. Envoyer par email avec lien vers doc
3. Ajouter au onboarding checklist
4. Rappeler lors des retros si nécessaire

**Format de présentation** :
- Slides courtes (5-10 slides max)
- Focus sur "pourquoi" avant "quoi"
- Q&A pour clarifier les zones grises
- Exemples concrets de do's and don'ts

## 2. Réseau : Optionnel (VPN si remote)

### Quand configurer un VPN ?

**Scénarios nécessitant VPN** :
- Équipe distribuée accédant à des ressources on-premises
- Accès à des outils IA hébergés en interne (rare)
- Conformité réglementaire stricte (finance, santé)

**Sinon** : Les outils SaaS (GitHub, ChatGPT, etc.) ne nécessitent **pas de VPN**.

### Configuration VPN basique

**Si requis par votre organisation** :

| Provider | Setup | Coût |
|----------|-------|------|
| **Tailscale** | Mesh VPN, 5 min setup | Gratuit (100 devices) |
| **Twingate** | Zero-trust network | Gratuit (5 users) |
| **OpenVPN** | Self-hosted | Gratuit (infra only) |
| **WireGuard** | Modern, performant | Gratuit (infra only) |

**Setup type (Tailscale)** :
1. Sign up sur [tailscale.com](https://tailscale.com)
2. Installer client sur chaque machine dev
3. Authentifier avec SSO (Google, GitHub, etc.)
4. Accéder aux ressources internes via VPN mesh
5. Pas de configuration réseau complexe

**Pour la plupart des équipes** : Pas nécessaire si outils 100% SaaS.

## 3. Fiabilité : SLA Awareness

### Comprendre les SLAs des providers

**SLAs typiques des outils IA** :

| Outil | SLA | Uptime historique | Fallback |
|-------|-----|-------------------|----------|
| **GitHub Copilot** | 99.9% | ~99.95% | Désactiver temporairement |
| **ChatGPT (Team)** | Pas de SLA formel | ~99.5% | Claude, Gemini |
| **Claude (Team)** | Pas de SLA formel | ~99.7% | ChatGPT, Gemini |
| **Azure OpenAI** | 99.9% (Azure SLA) | ~99.9% | OpenAI API directe |

**Implications pour l'équipe** :
- Attendre 4-8h de downtime par an (~99.9%)
- Pas de compensation financière pour SaaS gratuit/low-tier
- Plans de continuité personnels recommandés

### Plan de continuité équipe

**Si outil principal down** :

1. **Identifier l'interruption** (5 min)
   - Vérifier status page du provider
   - Confirmer avec l'équipe (Slack)

2. **Activer le fallback** (10 min)
   - Passer à outil alternatif (voir table ci-dessus)
   - Continuer travail non-bloquant
   - Documenter l'impact

3. **Communication** (immédiat)
   - Notifier product owner si impact delivery
   - Update dans standup
   - Pas besoin d'escalade si < 2h downtime

4. **Post-mortem** (si > 4h downtime)
   - Documenter impact
   - Ajuster stratégie si récurrent
   - Considérer outils alternatifs

**Template de communication** :
```
[Slack #team-dev]
🚨 GitHub Copilot est down depuis 14h (confirmé sur status.github.com)
Fallback : Continuer en manuel ou utiliser Codeium
Impact estimé : Ralentissement ~20% sur dev nouvelle feature
ETA : Inconnu, monitoring en cours
```

## 4. Fondation : Shared Team Infrastructure

### Comptes et licences partagés

#### GitHub Team (pour Copilot)

**Setup** :
1. Créer GitHub Organization (si n'existe pas)
2. Inviter tous les développeurs
3. Activer GitHub Copilot Business ($19/user/month)
4. Configurer policies :
   - Allow Copilot sur tous les repos (ou whitelist)
   - Enable audit logs
   - Disable suggestions matching public code (optionnel)

**Avantages vs licences individuelles** :
- Gestion centralisée
- Audit logs (qui utilise quoi)
- Facturation consolidée
- Contrôle par repo

#### ChatGPT Team

**Setup** :
1. Souscrire à ChatGPT Team ($30/user/month, 2 users minimum)
2. Créer workspace partagé
3. Inviter membres (tech leads, seniors)
4. Configurer settings :
   - Disable data training
   - Enable shared conversations (optionnel)
   - Set data retention (30 jours recommandé)

**Partage de GPTs personnalisés** :
- Créer GPTs pour cas d'usage équipe
- Exemple : "Team Code Reviewer", "Sprint Planning Assistant"
- Partager dans le workspace

#### Claude for Work (alternative)

**Setup similaire** :
1. Souscrire à Claude for Work ($30/user/month)
2. Créer team workspace
3. Configurer data retention et privacy
4. Partager Projects pour collaboration

### Configuration d'équipe IDE

#### VS Code Settings Sync

**Standardiser config équipe** :
1. Créer repo Git : `team-vscode-config`
2. Ajouter `settings.json`, `extensions.json`
3. Documenter setup dans README

**Exemple `extensions.json`** :
```json
{
  "recommendations": [
    "github.copilot",
    "github.copilot-chat",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "eamodio.gitlens"
  ]
}
```

**Exemple `settings.json`** :
```json
{
  "editor.formatOnSave": true,
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false
  },
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```

**Distribution** :
- Commit dans repo équipe
- Chaque dev clone et symlink vers `.vscode/`
- Update via Git pull

#### Cursor Team Config (si utilisé)

**Partager configuration** :
1. Exporter settings : File → Export Settings
2. Commit dans repo équipe
3. Nouveaux membres importent : File → Import Settings

### Shared Prompt Library

#### Créer un repo de prompts équipe

**Structure recommandée** :
```
team-ai-prompts/
├── README.md
├── coding/
│   ├── code-review.md
│   ├── test-generation.md
│   ├── refactoring.md
│   └── debugging.md
├── documentation/
│   ├── api-docs.md
│   ├── readme.md
│   └── comments.md
├── planning/
│   ├── story-breakdown.md
│   ├── estimation.md
│   └── retro-synthesis.md
└── templates/
    └── prompt-template.md
```

**Exemple de prompt partagé** :
```markdown
# Code Review Prompt

## Usage
Copier ce prompt dans ChatGPT/Claude avant de coller du code à reviewer.

## Prompt
"""
You are an expert code reviewer. Review the following code for:
1. Security vulnerabilities (SQL injection, XSS, etc.)
2. Performance issues
3. Code clarity and maintainability
4. Best practices for [LANGUAGE]
5. Edge cases not handled

Format your response as:
- 🔴 Critical issues (must fix)
- 🟡 Warnings (should fix)
- 🟢 Suggestions (nice to have)
- ✅ Positive observations

Code to review:
[PASTE CODE HERE]
"""

## Notes
- Fonctionne mieux avec GPT-4 ou Claude Sonnet
- Adapter [LANGUAGE] à votre contexte
```

**Processus de contribution** :
1. Dev découvre un prompt efficace
2. Crée PR sur repo prompts
3. Team lead review et merge
4. Annonce en standup/Slack
5. Tous bénéficient du prompt

### CI/CD Integration (Light)

#### Pre-commit Hooks (Secret Detection)

**Setup avec Gitleaks** :
```bash
# Install pre-commit
pip install pre-commit

# Create .pre-commit-config.yaml
cat > .pre-commit-config.yaml << EOF
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.18.0
    hooks:
      - id: gitleaks

  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: check-added-large-files
      - id: check-merge-conflict
      - id: detect-private-key
EOF

# Install hooks
pre-commit install
```

**Distribution équipe** :
1. Commit `.pre-commit-config.yaml` dans repo
2. Chaque dev run : `pre-commit install`
3. Hooks s'exécutent automatiquement avant commit

#### GitHub Actions (Security Scan)

**Exemple workflow** :
```yaml
# .github/workflows/security-scan.yml
name: Security Scan

on: [push, pull_request]

jobs:
  gitleaks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  dependency-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Snyk
        uses: snyk/actions/node@master
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

**Bénéfices** :
- Détection automatique de secrets committed
- Scan vulnérabilités dépendances
- Block merge si critical issues

### Monitoring et Dashboard

#### Métriques équipe à tracker

**Adoption** :
- % PRs utilisant Copilot (via GitHub Insights)
- Nombre d'utilisateurs actifs par outil
- Fréquence d'utilisation (daily active users)

**Qualité** :
- Bug rate : code IA vs code manuel
- Time to merge : PRs avec IA vs sans
- Test coverage : évolution

**Coûts** :
- Dépenses mensuelles par outil
- Coût par développeur
- ROI estimé

**Dashboard simple (Google Sheets/Notion)** :
```
| Métrique | Jan | Feb | Mar | Target |
|----------|-----|-----|-----|--------|
| PRs avec Copilot | 45% | 52% | 61% | 70% |
| Bug rate (IA) | 2.1% | 1.8% | 1.5% | <2% |
| Bug rate (manual) | 2.3% | 2.4% | 2.2% | <2.5% |
| Coût/dev/mois | $45 | $48 | $52 | <$60 |
```

**Revue mensuelle** :
- Team meeting 30min
- Présenter métriques
- Décider ajustements
- Documenter actions

## Checklist Ready (Delivery)

### 🏢 Équipe

- [ ] Documenter politique équipe (5-10 pages)
- [ ] Provisionner licences équipe (GitHub Copilot, ChatGPT Team)
- [ ] Créer shared prompt library (Git repo)
- [ ] Standardiser config IDE (VS Code settings sync)
- [ ] Configurer pre-commit hooks (secret detection)
- [ ] Setup CI/CD security scans (GitHub Actions)
- [ ] Créer dashboard métriques équipe
- [ ] Former l'équipe (onboarding 2h)
- [ ] Établir plan de continuité (fallback tools)

## Prochaine étape

→ [Phase 4 : Govern](04-govern.md) - Gouverner l'usage IA en équipe
