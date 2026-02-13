# Phase 6 : Manage - MLOps basique pour équipe

## Vue d'ensemble

La gestion opérationnelle IA pour une équipe de développement se concentre sur des pratiques **MLOps légères** : monitoring basique, versioning, gestion des coûts et continuité. L'objectif est d'assurer qualité et fiabilité sans infrastructure complexe.

## 1. Gérer les opérations : Monitoring basique

### Monitoring de l'adoption et usage

#### Métriques d'adoption à tracker

**Dashboard équipe (Google Sheets ou Notion)** :

| Métrique | Définition | Target | Actuel |
|----------|------------|--------|--------|
| **Active users** | % devs utilisant IA daily | >80% | ? |
| **PRs avec IA** | % PRs mentionnant usage IA | >60% | ? |
| **Outils utilisés** | Nombre moyen outils/dev | 2-3 | ? |
| **Satisfaction** | Score satisfaction équipe (1-5) | >4 | ? |

**Source des données** :
- GitHub Insights : PRs, commits, Copilot usage
- Survey mensuel : Satisfaction, fréquence usage
- Discussions retro : Feedback qualitatif

#### Monitoring de la performance des outils

**Métriques de performance** :

| Outil | Métrique | Mesure | Acceptable |
|-------|----------|--------|------------|
| **GitHub Copilot** | Taux d'acceptation suggestions | GitHub Insights | >30% |
| **Code review IA** | Temps review moyen | GitHub PR metrics | <2h |
| **Test generation** | Coverage increase | Code coverage tool | +10-20% |

**Monitoring simple** :
- Review mensuelle des métriques GitHub
- Pas besoin d'outils sophistiqués
- Focus sur trends, pas valeurs absolues

### Monitoring de la qualité du code

#### Comparer qualité : code IA vs manuel

**Métriques à suivre** :

| Métrique | Source | Fréquence |
|----------|--------|-----------|
| **Bug rate** | Jira/Linear (bugs per story) | Mensuelle |
| **Test coverage** | Coverage tool (Jest, pytest) | Par PR |
| **Code review comments** | GitHub PR reviews | Mensuelle |
| **Regression rate** | Incidents post-deploy | Mensuelle |

**Template de tracking** :
```
## Qualité Code - Février 2025

Code IA-généré:
- PRs: 23
- Bugs détectés: 2 (8.7%)
- Coverage moyenne: 78%
- Review comments/PR: 3.2

Code manuel:
- PRs: 17
- Bugs détectés: 2 (11.8%)
- Coverage moyenne: 72%
- Review comments/PR: 4.1

Conclusion: Code IA légèrement meilleur ce mois
```

**Insight** : Si code IA a systématiquement plus de bugs, identifier pourquoi (prompts inadéquats, manque de review, outils mal configurés).

### Monitoring uptime et performance

**SaaS tools** : Uptime géré par providers
- Pas besoin de monitoring infrastructure
- Vérifier status pages si problème

**Tracking des incidents** :

```
## Incident Log - Q1 2025

| Date | Outil | Durée | Impact | Action |
|------|-------|-------|--------|--------|
| 15/01 | Copilot | 2h | Ralentissement dev | Utilisé Codeium |
| 03/02 | ChatGPT | 1h | Pas d'impact | Utilisé Claude |
| 12/03 | GitHub | 4h | Blocage PRs | Escaladé PO |
```

**Revue trimestrielle** :
- Identifier outils avec le plus d'incidents
- Évaluer besoin de fallback plus robuste
- Ajuster plan de continuité

## 2. Gérer les déploiements : Git versioning + Simple deployment

### Versioning du code IA-généré

#### Git best practices pour code IA

**Commit messages clairs** :
```bash
# ❌ Mauvais
git commit -m "fix stuff"

# ✅ Bon
git commit -m "fix: correct authentication logic (AI-assisted)"

# ✅ Encore mieux
git commit -m "feat: add user registration endpoint

- Generated endpoint boilerplate with GitHub Copilot
- Manually added validation and error handling
- Added unit tests (AI-generated + manual review)
- Reviewed for security issues"
```

**PR Description Template** :
```markdown
## Changes
- [Description des changements]

## AI Usage
- [ ] Code généré par IA (spécifier outil et scope)
- [ ] Prompts utilisés : [lien vers prompt library]
- [ ] Review manuelle effectuée
- [ ] Tests ajoutés et validés

## Checklist
- [ ] Tests passent
- [ ] Coverage >70%
- [ ] Pas de secrets committés
- [ ] Documentation à jour
```

### Branching strategy simple

**Git Flow simplifié** :
```
main (production)
  ↑
develop (staging)
  ↑
feature/* (feature branches)
```

**Workflow** :
1. Créer feature branch depuis develop
2. Développer avec IA (commit régulièrement)
3. PR vers develop (code review)
4. Merge develop
5. Deploy develop → staging (auto)
6. Validation staging
7. PR develop → main (release)
8. Deploy main → production (auto ou manuel)

**Pas de stratégie complexe** : Pas besoin de GitOps, infrastructure as code, ou multi-environment sophistiqué pour commencer.

### Simple deployment pipeline

#### CI/CD basique avec GitHub Actions

**Pipeline type** :
```yaml
# .github/workflows/ci.yml
name: CI

on:
  pull_request:
  push:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      - name: Install dependencies
        run: npm ci
      - name: Run linter
        run: npm run lint
      - name: Run tests
        run: npm test
      - name: Check coverage
        run: npm run coverage
      - name: Security scan
        uses: snyk/actions/node@master
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/develop'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to staging
        run: |
          # Deploy script (Vercel, Netlify, AWS, etc.)
          npm run deploy:staging
        env:
          DEPLOY_TOKEN: ${{ secrets.DEPLOY_TOKEN }}

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to production
        run: npm run deploy:production
        env:
          DEPLOY_TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```

**Caractéristiques** :
- Tests automatisés sur chaque PR
- Deploy auto vers staging (develop)
- Deploy auto vers production (main)
- Security scan intégré
- Pas de manual approvals (pour simplifier)

#### Rollback simple

**Si déploiement casse production** :
```bash
# Option 1: Revert commit
git revert HEAD
git push origin main
# CI/CD redéploie automatiquement

# Option 2: Rollback to previous version
git reset --hard HEAD~1
git push --force origin main
# Attention: --force à utiliser avec précaution

# Option 3: Redeploy previous tag
git checkout v1.2.3
git push origin main --force
```

**Procedure** :
1. Identifier le problème (monitoring alerts)
2. Décider : fix forward ou rollback
3. Exécuter rollback si nécessaire (<15min)
4. Valider en staging avant redeploy production
5. Post-mortem après incident

## 3. Gérer les modèles : Tracking basique

### Quel modèle, quelle version ?

#### Tracking des modèles utilisés

**Pour outils SaaS** :
- GitHub Copilot : Modèle géré par GitHub (pas de versioning utilisateur)
- ChatGPT : GPT-3.5, GPT-4, GPT-4 Turbo (choisir dans interface)
- Claude : Haiku, Sonnet, Opus (choisir dans interface)

**Documenter dans le code** :
```python
# example.py
"""
Generated with: ChatGPT (GPT-4 Turbo)
Date: 2025-02-13
Prompt: "Create FastAPI endpoint for user authentication"
Modifications: Added rate limiting and logging
"""

@app.post("/auth/login")
async def login(credentials: LoginCredentials):
    # AI-generated boilerplate + manual security enhancements
    ...
```

**Pourquoi documenter** :
- Reproduire résultats si nécessaire
- Debug si le modèle change
- Comprendre qualité selon modèle utilisé

### Versioning des prompts critiques

#### Prompt library avec versioning Git

**Structure** :
```
team-ai-prompts/
├── CHANGELOG.md
├── prompts/
│   ├── code-review-v1.md
│   ├── code-review-v2.md (amélioré)
│   ├── test-generation-v1.md
│   └── api-doc-generation-v1.md
```

**Exemple de versioning** :
```markdown
# Code Review Prompt v2

## Changelog
- v2 (2025-02-13): Added security focus, examples
- v1 (2025-01-15): Initial version

## Prompt
"""
You are a senior security-focused code reviewer. Review this code for:

1. Security vulnerabilities:
   - SQL injection, XSS, CSRF
   - Hardcoded secrets
   - Authentication/authorization issues

2. Performance issues:
   - N+1 queries
   - Inefficient algorithms
   - Memory leaks

3. Best practices:
   - Error handling
   - Code clarity
   - Test coverage

Format response as:
🔴 Critical (must fix before merge)
🟡 Important (should fix)
🟢 Suggestions (nice to have)

Code:
[PASTE CODE]
"""

## Usage Stats
- Used: 45 times
- Success rate: 87% (found real issues)
- Best for: Backend API code
```

**Benefits** :
- Itération et amélioration continue
- Traçabilité (quelle version a produit quoi)
- Partage avec équipe

### Custom models (si vous allez jusque-là)

**Scénario rare : Fine-tuning d'un modèle**

Si votre équipe décide de fine-tuner un modèle (OpenAI, Anthropic) :

**Metadata à tracker** :
```yaml
model_id: team-code-reviewer-v1
base_model: gpt-3.5-turbo
training_date: 2025-02-10
training_data:
  - 1000 code reviews from team history
  - Anonymized, no client code
training_cost: $45
performance_vs_base: +15% relevant suggestions
status: experimental
owner: tech-lead@company.com
```

**Versioning** :
- v1 : Baseline
- v2 : Retrained with 500 additional examples
- v3 : Fine-tuned with team-specific patterns

**Monitoring** :
- Quality : Team feedback (better/same/worse than base)
- Cost : Training + inference costs
- Usage : How many team members use it

**Important** : Fine-tuning est rare pour équipes dev. La plupart utilisent modèles off-the-shelf.

## 4. Gérer les coûts : Budget équipe et allocation

### Budget équipe mensuel

#### Calculer le budget

**Coûts typiques par développeur** :
```
GitHub Copilot Business:  $19/dev/month
ChatGPT Team:             $30/dev/month (si utilisé)
Autres outils:            $10-20/dev/month

Total moyen: $40-70/dev/month
```

**Budget équipe (10 devs)** :
```
Base: 10 devs × $50/month = $500/month
Buffer 20%: $100/month (expérimentation)
Total: $600/month = $7,200/year
```

**Validation budget** :
- Comparer à 1 dev-week cost (~$2K)
- Si budget < 1 dev-week/quarter → Excellent ROI
- Si budget équipe permet gain >1 dev-week/quarter → ROI positif

#### Allocation par développeur

**Tracking par dev** :
```
| Dev | Copilot | ChatGPT | Cursor | Total | Utilisation |
|-----|---------|---------|--------|-------|-------------|
| Alice | $19 | $30 | $0 | $49 | Active daily |
| Bob | $19 | $0 | $20 | $39 | Copilot only |
| Carol | $19 | $30 | $0 | $49 | Active daily |
| Dave | $0 | $0 | $0 | $0 | Opt-out |

Total: $137/month pour 4 devs
Average: $34/dev/month
```

**Analyse** :
- Dave opt-out → Comprendre pourquoi, former si nécessaire
- Bob n'utilise pas ChatGPT → OK si Copilot suffit
- Coût réel < budget estimé → Buffer disponible pour expérimentation

### Dashboard de coûts

**Template Google Sheets** :

**Onglet 1 : Coûts mensuels**
```
| Mois | Copilot | ChatGPT | Autres | Total | Budget | Delta |
|------|---------|---------|--------|-------|--------|-------|
| Jan | $190 | $120 | $50 | $360 | $600 | -$240 |
| Feb | $190 | $150 | $75 | $415 | $600 | -$185 |
| Mar | $190 | $180 | $80 | $450 | $600 | -$150 |
```

**Onglet 2 : ROI estimé**
```
| Métrique | Valeur | Note |
|----------|--------|------|
| Coût total Q1 | $1,225 | |
| Gain vélocité | +15% | Estimation basée sur sprint velocity |
| Temps économisé | ~40h | Basé sur feedback équipe |
| Coût évité | ~$4,000 | 40h × $100/h |
| ROI | 3.3x | Bon investissement |
```

**Onglet 3 : Breakdown par outil**
```
| Outil | Coût Q1 | Utilisateurs | Coût/user | Satisfaction | Action |
|-------|---------|--------------|-----------|--------------|--------|
| Copilot | $570 | 10 | $57 | 4.5/5 | Garder |
| ChatGPT | $450 | 6 | $75 | 4.2/5 | Garder |
| Cursor | $205 | 3 | $68 | 3.8/5 | Réévaluer |
```

### Optimisation des coûts équipe

#### Stratégie 1 : Licences partagées vs individuelles

**GitHub Copilot** :
- Individual : $10/user/month
- Business : $19/user/month (audit logs, policy controls)
- **Recommandation** : Business pour équipes (features justifient le coût)

**ChatGPT** :
- Plus (individuel) : $20/user/month
- Team : $30/user/month (2 users min, workspace partagé)
- **Recommandation** : Team si >3 utilisateurs actifs (shared GPTs, admin controls)

#### Stratégie 2 : Allocation intelligente

**Tous les devs** :
- ✅ GitHub Copilot (essentiel)

**Tech leads et seniors** :
- ✅ ChatGPT Team (tasks complexes)

**Juniors** :
- ⚠️ ChatGPT optionnel (évaluer si bénéfique)
- Alternative : Utiliser version gratuite pour commencer

**Principe** : Prioriser outils pour ceux qui les utilisent le plus.

#### Stratégie 3 : Monitoring et ajustements

**Revue mensuelle (30min)** :
1. Présenter dashboard coûts
2. Identifier sous-utilisation (tools non utilisés)
3. Demander feedback (outil X utile ou à annuler ?)
4. Ajuster allocations mois suivant

**Actions type** :
- Si Dev Y n'utilise jamais ChatGPT → Annuler son compte
- Si équipe demande nouvel outil → Tester 1 mois avec buffer
- Si coûts dépassent budget → Identifier cuts

### FinOps léger

**Principes FinOps appliqués** :

1. **Visibility** : Dashboard mensuel → Équipe voit les coûts
2. **Accountability** : Chaque dev responsable de son usage
3. **Optimization** : Revue mensuelle → Annuler sous-utilisation
4. **Forecasting** : Projeter coûts Q+1 basé sur trends

**Pas besoin de** :
- Outils FinOps sophistiqués (Kubecost, CloudHealth)
- Analyse coûts quotidienne
- Budgets par feature/projet
- Showback/chargeback complexe

**Suffisant** : Google Sheets + revue mensuelle 30min.

## 5. Gérer les données : Data versioning basique

### Versioning des datasets (si applicable)

**Scénario** : Équipe utilise RAG ou fine-tuning

#### Datasets pour RAG

**Structure de versioning** :
```
data/
├── embeddings/
│   ├── codebase-v1.json (Jan 2025)
│   ├── codebase-v2.json (Feb 2025)
│   └── CHANGELOG.md
├── docs/
│   └── technical-docs/ (versioned in Git)
```

**CHANGELOG.md** :
```markdown
# Embeddings Changelog

## v2 (2025-02-15)
- Added 50 new code files
- Removed deprecated modules
- Re-embedded with updated model (text-embedding-3-large)
- Size: 2.3MB (was 1.8MB)

## v1 (2025-01-10)
- Initial embedding of codebase
- 200 files embedded
- Model: text-embedding-ada-002
```

**Pourquoi versionner** :
- Reproduire résultats RAG
- Debug si qualité baisse
- Rollback si nouvelle version pire

#### Data quality checks basiques

**Script de validation** :
```python
# validate_embeddings.py
import json

def validate_embeddings(file_path):
    with open(file_path) as f:
        data = json.load(f)

    # Check structure
    assert "embeddings" in data
    assert "metadata" in data

    # Check completeness
    assert len(data["embeddings"]) > 0
    print(f"✅ {len(data['embeddings'])} embeddings found")

    # Check metadata
    assert "version" in data["metadata"]
    assert "date" in data["metadata"]
    print(f"✅ Version {data['metadata']['version']}")

    return True

if __name__ == "__main__":
    validate_embeddings("embeddings/codebase-v2.json")
```

**Exécuter** :
- Avant commit : `python validate_embeddings.py`
- CI/CD : Automatiser validation

### Backup des données critiques

**Données à backup** :
- Embeddings/vectors (si RAG)
- Fine-tuned models (si custom)
- Prompt library (Git suffit)
- Configurations (Git suffit)

**Stratégie simple** :
- **Git** : Code, prompts, configs (primary backup)
- **Cloud storage** : Embeddings, models (S3, GCS, Azure Blob)
- **Fréquence** : Chaque version majeure

**Exemple backup** :
```bash
# Backup embeddings to S3
aws s3 cp embeddings/codebase-v2.json \
  s3://team-ai-backups/embeddings/codebase-v2.json

# Tag version in Git
git tag -a embeddings-v2 -m "Embeddings v2 backup"
git push origin embeddings-v2
```

## 6. Continuité : Backup basique et fallback

### Plan de continuité équipe

#### Scénarios de risque

| Scénario | Probabilité | Impact | RTO | Stratégie |
|----------|-------------|--------|-----|-----------|
| **GitHub Copilot down** | Faible | Moyen | N/A | Utiliser Codeium ou travailler manuellement |
| **ChatGPT down** | Faible | Faible | N/A | Utiliser Claude ou Gemini |
| **GitHub down** | Très faible | Élevé | 4h | Attendre restoration (pas d'alternative) |
| **Dev machine failure** | Moyen | Moyen | 2h | Backup sur cloud, reinstall tools |

**RTO** : Recovery Time Objective (temps max acceptable de downtime)

#### Fallback tools configurés

**Primary → Fallback** :
- Copilot → Codeium (pré-installé, désactivé par défaut)
- ChatGPT → Claude (tous les devs ont compte)
- Cursor → VS Code + Copilot

**Préparation** :
- Installer fallback tools (désactivés)
- Documenter procédure d'activation
- Tester 1x/trimestre

**Procédure d'activation** :
```markdown
# Si GitHub Copilot down

1. Vérifier status.github.com
2. Désactiver Copilot extension
3. Activer Codeium extension
4. Notifier équipe dans Slack
5. Continuer développement normalement
6. Réactiver Copilot quand up
```

### Backup environnement de dev

**Configurations à sauvegarder** :

1. **VS Code settings** : Git repo ou Settings Sync
2. **Extensions list** : `extensions.json` dans repo équipe
3. **Dotfiles** : `.bashrc`, `.zshrc`, etc. dans Git
4. **Prompt library** : Git repo
5. **Project setup** : `README.md` avec instructions

**Backup personnel (chaque dev)** :
- Utiliser Time Machine (macOS) ou équivalent
- Cloud backup (Dropbox, Google Drive)
- GitHub: Push code régulièrement

**Recovery time** : 2h pour reinstall complet environnement de dev

### Incident response basique

**Si problème impacte toute l'équipe** :

1. **Identifier** (5 min)
   - Quel outil ? Quel impact ?
   - Confirmer avec équipe (Slack)

2. **Communiquer** (10 min)
   - Notifier équipe : "Copilot down, utiliser fallback"
   - Notifier PO si impact delivery

3. **Activer fallback** (15 min)
   - Suivre procédure documentée
   - Aider les devs si nécessaire

4. **Monitor** (ongoing)
   - Vérifier status page provider
   - Update équipe quand résolu

5. **Post-incident** (optional)
   - Si >2h downtime : documenter incident
   - Ajuster plan de continuité si nécessaire

**Template incident log** :
```markdown
# Incident: GitHub Copilot Outage

Date: 2025-02-13
Duration: 14h00 - 16h30 (2.5h)
Impact: Ralentissement développement (~20%)

## Timeline
- 14h00: Copilot suggestions stopped working
- 14h05: Confirmed outage on status.github.com
- 14h10: Notified team, activated Codeium fallback
- 16h30: Copilot restored

## Actions
- Fallback worked well (Codeium)
- No delivery impact
- No changes needed to continuity plan

## Learnings
- Good to have fallback pre-installed
- Team adapted quickly (~10min)
```

## Checklist Manage (Delivery)

### 🏢 Équipe

#### Opérations
- [ ] Créer dashboard adoption équipe (Google Sheets/Notion)
- [ ] Configurer tracking métriques GitHub (PRs, Copilot usage)
- [ ] Établir routine revue mensuelle (30min)
- [ ] Documenter procédure incident response

#### Déploiements
- [ ] Configurer CI/CD pipeline avec security scans
- [ ] Établir PR template avec mention usage IA
- [ ] Documenter procédure rollback (<15min)
- [ ] Tester rollback 1x/trimestre

#### Modèles
- [ ] Documenter modèles utilisés (dans code ou wiki)
- [ ] Versionner prompt library dans Git
- [ ] Tracker performance prompts (usage stats)

#### Coûts
- [ ] Définir budget équipe ($40-70/dev/month)
- [ ] Créer dashboard coûts (Google Sheets)
- [ ] Configurer alertes si dépassement budget
- [ ] Établir revue mensuelle coûts (30min)
- [ ] Calculer ROI trimestriel

#### Données
- [ ] Versionner datasets critiques (embeddings, docs)
- [ ] Mettre en place backup (Git + cloud storage)
- [ ] Configurer data quality checks basiques

#### Continuité
- [ ] Identifier fallback tools (Copilot → Codeium, etc.)
- [ ] Pré-installer fallback tools (désactivés)
- [ ] Documenter procédure activation fallback
- [ ] Tester plan de continuité 1x/trimestre
- [ ] Configurer backup environnement dev (Settings Sync, dotfiles)

## Métriques de succès équipe

**Après 6 mois d'usage IA équipe** :
- [ ] Adoption >80% (devs utilisent IA daily)
- [ ] Vélocité +10-20% (sprint velocity)
- [ ] Qualité maintenue ou améliorée (bug rate stable ou baisse)
- [ ] Coûts <$70/dev/month
- [ ] ROI >3x (gain temps vs coût)
- [ ] Satisfaction équipe >4/5

**Si métriques non atteintes** : Identifier root causes et ajuster stratégie.

## Conclusion

La gestion opérationnelle IA pour une équipe reste **légère et pragmatique**. Focalisez-vous sur :

1. **Monitoring** : Dashboard simple, revue mensuelle 30min
2. **Versioning** : Git pour code et prompts, changelog pour datasets
3. **Coûts** : $40-70/dev/month, ROI >3x
4. **Continuité** : Fallback tools pré-configurés, test trimestriel

**Éviter** :
- Infrastructure complexe (Kubernetes, MLflow, Airflow)
- Over-engineering (micro-optimizations, dashboards sophistiqués)
- Processus lourds (approbations multiples, comités)

**Principe** : Commencer simple, itérer basé sur besoins réels.

## Prochaines étapes

Vous avez complété le framework d'adoption IA équipe. Pour aller plus loin :

1. **Scale progressivement** : Si succès équipe, répliquer sur autres équipes
2. **Partager learnings** : Présenter à d'autres équipes, contribuer au AI CoE
3. **Explorer automation** : Si besoins avancés (fine-tuning, RAG custom), voir [Automation](../automation/)
4. **Réviser régulièrement** : Les 6 phases évoluent avec maturité équipe

**Ressources complémentaires** :
- [GLOSSARY.md](../GLOSSARY.md) : Équivalences cloud et concepts avancés
- [README.md](../README.md) : Vue d'ensemble du framework complet
- Phase Automation : Pour équipes prêtes à aller plus loin
