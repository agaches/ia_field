# Phase 5 : Secure - Sécuriser l'usage IA en équipe (PRAGMATIQUE)

## Vue d'ensemble

La sécurité pour l'usage IA en équipe implémente des **contrôles pragmatiques** adaptés aux capacités de l'équipe. L'approche : "Implémenter ce qu'on peut, manager ce qu'on ne peut pas encore".

## 1. OWASP LLM Top 10 - Implémentation pragmatique

### Focus sur les risques équipe les plus critiques

**Principe** : Prioriser LLM01, LLM06, LLM09 (les plus pertinents pour delivery)

| Risque | Implémentation Équipe | Outils/Approche |
|--------|----------------------|-----------------|
| **LLM01: Prompt Injection** | ✅ **IMPLÉMENTER** | Validation inputs pour code review IA, sanitization |
| **LLM02: Insecure Output** | ✅ **IMPLÉMENTER** | Validation outputs dans workflows, code scanning |
| **LLM03: Data Poisoning** | ⚠️ **MANAGER** | N/A pour équipe (provider responsibility) |
| **LLM04: Model DoS** | ⚠️ **AWARENESS** | Rate limiting awareness, monitoring usage |
| **LLM05: Supply Chain** | ✅ **IMPLÉMENTER** | Vendor validation process pour nouveaux outils |
| **LLM06: Info Disclosure** | 🚨 **CRITIQUE** | DLP monitoring, data masking, secrets detection |
| **LLM07: Insecure Plugins** | ✅ **IMPLÉMENTER** | Plugin validation process, allowlist |
| **LLM08: Excessive Agency** | ✅ **IMPLÉMENTER** | Approval pour agent actions, least privilege |
| **LLM09: Overreliance** | 🚨 **CRITIQUE** | Validation process obligatoire (code review, tests) |
| **LLM10: Model Theft** | ⚠️ **MANAGER** | N/A pour équipe (pas de modèles custom) |

### Détail des 3 risques prioritaires

#### LLM01: Prompt Injection (Code Review)

**Scénario** : Un développeur utilise l'IA pour review du code qui contient un prompt injection

**Mitigation** :
- ✅ Validation des inputs avant envoi à l'IA
- ✅ Sanitization des prompts (enlever markdown malveillant)
- ✅ Awareness équipe (formation)

**Implémentation** :
```bash
# Pre-commit hook : valider les prompts
if grep -E "(ignore previous|disregard instructions)" prompt.txt; then
  echo "⚠️ Prompt suspect détecté"
  exit 1
fi
```

#### LLM06: Information Disclosure (DLP)

**Scénario** : Un développeur partage accidentellement un secret dans un prompt

**Mitigation** :
- 🚨 **Secrets detection** : Pre-commit hooks (gitleaks, truffleHog)
- ⚠️ **DLP monitoring** : Tracking des uploads vers outils IA (si possible)
- ✅ **Data masking** : Anonymiser données sensibles avant partage

**Implémentation** :
```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: latest
    hooks:
      - id: gitleaks
```

#### LLM09: Overreliance (Validation)

**Scénario** : Code IA mergé sans validation, introduit des bugs

**Mitigation** :
- 🚨 **Code review obligatoire** : Tout code IA doit être reviewé
- ✅ **Tests obligatoires** : Coverage minimum pour code critique
- ⚠️ **Validation process** : Checklist reviewer

**Implémentation** :
- GitHub branch protection : require review
- CI : fail si coverage < 80% sur code critique
- Template PR : "Code IA ? [x] Oui [ ] Non"

## 2. Contrôles de sécurité équipe

### Access Controls

**Principe** : Least privilege pour les outils IA

| Rôle | Outils | Permissions |
|------|--------|-------------|
| **Junior Dev** | GitHub Copilot | Autocomplétion uniquement |
| **Mid Dev** | Copilot + ChatGPT Team | Code review, documentation |
| **Senior Dev** | Copilot + ChatGPT + Claude Code | Full access |
| **Tech Lead** | All tools + admin | Configuration équipe |

**Implémentation** :
- GitHub Teams : assigner par rôle
- Licences : allouer selon besoins
- Review trimestriel : ajuster les accès

### DLP Monitoring Basique

**Ce qu'on peut implémenter sans équipe sécurité dédiée** :

**1. Secrets Detection (local)** :
```bash
# Installation
brew install gitleaks

# Scan pré-commit
gitleaks detect --source . --verbose
```

**2. Data Masking (manuel)** :
- Guidelines : "Remplacer les vraies valeurs par des placeholders"
- Exemples dans la doc équipe
- Reviews : vérifier que masking appliqué

**3. Monitoring Usage (basique)** :
- Logs mensuels : qui utilise quoi
- Dashboard coûts : détecter usage anormal
- Escalade si pattern suspect

**Ce qu'on ne peut PAS faire (et c'est OK)** :
- DLP enterprise complet (coût prohibitif)
- Monitoring temps réel (complexité)
- Encryption at use (pas accessible)

### Content Filtering pour Team Tools

**Si vous self-hostez des outils IA** :

**Guardrails basiques** :
```python
# Exemple : blocker les prompts suspects
BLOCKED_PATTERNS = [
    "ignore previous instructions",
    "disregard your training",
    "you are now in developer mode"
]

def validate_prompt(prompt: str) -> bool:
    for pattern in BLOCKED_PATTERNS:
        if pattern.lower() in prompt.lower():
            return False
    return True
```

**Pour outils SaaS (ChatGPT Team, Copilot)** :
- Utiliser les guardrails du provider (activés par défaut)
- Configurer les settings équipe (content filtering)

## 3. Code Scanning

### Secrets Detection (CI/CD)

**GitHub Actions** :
```yaml
name: Security Scan
on: [push, pull_request]

jobs:
  secrets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Gitleaks
        uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

**GitLab CI** :
```yaml
secrets-scan:
  stage: test
  image: zricethezav/gitleaks:latest
  script:
    - gitleaks detect --source . --verbose
  allow_failure: false
```

### Static Code Analysis

**Pour code généré par IA** :

**Linters** :
- Python : pylint, flake8, mypy
- JavaScript : ESLint, TypeScript
- Go : golangci-lint

**SAST Tools** :
- Semgrep (open-source)
- Snyk (freemium)
- SonarQube (community edition)

**Configuration** :
```yaml
# .semgrep.yml
rules:
  - id: hardcoded-secret
    pattern: password = "..."
    message: Hardcoded secret detected
    severity: ERROR
```

## 4. Validation Process

### Code Review Checklist pour Code IA

**Reviewer doit vérifier** :

**Sécurité** :
- [ ] Pas de secrets hardcodés
- [ ] Pas de vulnérabilités évidentes (SQLi, XSS)
- [ ] Validation des inputs utilisateur
- [ ] Gestion des erreurs appropriée

**Qualité** :
- [ ] Logique correcte et compréhensible
- [ ] Tests adéquats (coverage > seuil équipe)
- [ ] Conformité aux standards équipe
- [ ] Documentation si nécessaire

**IA-specific** :
- [ ] Code IA marqué comme tel dans PR
- [ ] Prompt utilisé documenté (si pertinent)
- [ ] Output validé (pas d'hallucination évidente)

### Testing Requirements

**Pour code critique généré par IA** :

**Unit Tests** :
- Coverage minimum : 80%
- Edge cases : obligatoires
- Mocking approprié

**Integration Tests** :
- Workflows complets testés
- Cas d'erreur couverts

**Validation manuelle** :
- Tester localement avant push
- Smoke tests en staging

## 5. Vendor Validation

### Process pour nouveaux outils IA

**Étape 1 : Évaluation Tech Lead (1-2 jours)**

| Critère | Questions | Acceptable ? |
|---------|-----------|--------------|
| **Sécurité** | MFA ? SOC2 ? ISO27001 ? | ? |
| **Confidentialité** | Données utilisées pour training ? | ? |
| **Coût** | Budget équipe OK ? | ? |
| **Support** | Documentation ? Support disponible ? | ? |

**Étape 2 : Trial (1-2 semaines)**
- 2-3 personnes testent
- Feedback sur sécurité, qualité, UX
- Décision : adopter ou abandonner

**Étape 3 : Rollout équipe**
- Formation (1h session)
- Documentation interne
- Monitoring adoption

### Vendor Security Checklist

- [ ] Provider a SOC2 Type II ou ISO27001
- [ ] Data residency appropriée (EU, US, etc.)
- [ ] Politique de confidentialité claire
- [ ] Pas d'utilisation données pour training (ou opt-out)
- [ ] MFA disponible pour équipe
- [ ] SSO possible (si requirement)
- [ ] Logs d'audit disponibles

## 6. Incident Response Équipe

### Team Escalation Process

**Si incident détecté par un membre** :

```
Incident détecté
      ↓
Signaler au Tech Lead (< 1h)
      ↓
Tech Lead évalue impact
      ↓
   ┌──────┴──────┐
   │             │
Équipe  Organisation
   │             │
   ↓             ↓
Résolution    Escalade IT/Sécu
équipe
```

**Incidents "équipe"** : bugs, partage accidentel non-critique
**Incidents "org"** : fuite de secrets, compromission, violation compliance

### Playbook Basique

**Incident : Secret exposé dans code IA**

1. **< 5min** : Révoquer le secret immédiatement
2. **< 30min** : Vérifier si le secret a été utilisé (logs)
3. **< 1h** : Notifier Tech Lead + IT Security
4. **< 2h** : Post-mortem rapide équipe
5. **< 24h** : Documenter learnings, ajuster processus

**Incident : Code IA défectueux en production**

1. **< 5min** : Rollback immédiat
2. **< 30min** : Identifier la root cause
3. **< 1h** : Fix + tests
4. **< 2h** : Redéploiement validé
5. **< 24h** : Post-mortem, améliorer validation process

## 7. Monitoring Usage

### Basic Usage Monitoring

**Métriques à tracker** :

**Par outil** :
- Nombre d'utilisateurs actifs
- Volume d'usage (requests, tokens)
- Coûts mensuels

**Par personne** :
- Usage quotidien/hebdomadaire
- Anomalies (usage 10x supérieur à la moyenne)

**Dashboard simple** :
- Feuille Google Sheets / Excel
- Mise à jour mensuelle
- Review en team meeting

### Alertes basiques

**Trigger alerts si** :
- Coût mensuel > 120% du budget
- Usage individuel > 3x la moyenne équipe
- Nouvel outil utilisé sans approbation

**Action** : Tech Lead investigate et ajuste

## Checklist Secure (Delivery)

### 🏢 Équipe

- [ ] Implémenter secrets detection (pre-commit + CI)
- [ ] Établir le code review process pour code IA
- [ ] Configurer access controls par rôle
- [ ] Mettre en place vendor validation process
- [ ] Former l'équipe sur OWASP LLM Top 10 (focus LLM01, 06, 09)
- [ ] Créer le playbook incident response équipe
- [ ] Monitorer l'usage mensuel

## Prochaine étape

→ [Phase 6 : Manage](06-manage.md) - Gérer les opérations IA en équipe
