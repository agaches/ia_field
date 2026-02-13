# Style Guide & Structure - AI Adoption Framework

> Reference guide to maintain framework consistency and understand its structure

---

## Overview of the 3-Category Structure

The framework is organized into **3 categories** following the "Person → Project → Product" model:

```
/workspace/git/agaches/ia_field/IA_Adoption_FW/
├── 00-strategy-global.md          ← Global strategy, 3-category model
├── README.md                       ← Overview, navigation
├── STRUCTURE.md                    ← This file (structure + style)
├── GLOSSARY.md                     ← Cloud equivalences, AI concepts
│
├── employee/                       ← Category 1: Individual adoption
│   ├── README.md
│   ├── 01-strategy.md
│   ├── 02-plan.md
│   ├── 03-ready.md
│   ├── 04-govern.md (LIGHT)
│   ├── 05-secure.md (AWARENESS)
│   └── 06-manage.md (MINIMAL)
│
├── delivery/                       ← Category 2: Team integration
│   ├── README.md
│   ├── 01-strategy.md
│   ├── 02-plan.md
│   ├── 03-ready.md
│   ├── 04-govern.md (MEDIUM)
│   ├── 05-secure.md (PRAGMATIC)
│   └── 06-manage.md (BASIC)
│
└── automation/                     ← Category 3: Business production
    ├── README.md
    ├── 01-strategy.md
    ├── 02-plan.md
    ├── 03-ready.md
    ├── 04-govern.md (FULL)
    ├── 05-secure.md (COMPLETE)
    └── 06-manage.md (COMPLETE)
```

---

## The 3 Categories: Who, What, Why

### 1. Employee - Individual Adoption

**Who**: Individuals (tech or non-tech)

**What**: Improve personal productivity with AI tools

**Why**:
- Build foundational AI skills
- Discover tools suited to their work
- Adopt individual security best practices

**Characteristics**:
- Risk: Low-Medium
- Budget: 20-50€/month/person
- Timeline: Hours → Days
- Governance: LIGHT (1-2 pages)
- Security: AWARENESS (best practices)
- Operations: MINIMAL (SaaS subscriptions)

**Files**: [employee/](../employee/)

---

### 2. Delivery - Team Integration

**Who**: Technical teams and leads

**What**: Integrate AI into collective delivery processes

**Why**:
- Improve delivery velocity and quality
- Validate AI integration patterns in teams
- Establish collective practices

**Characteristics**:
- Risk: Medium
- Budget: Few k€/month/team
- Timeline: Weeks → Months
- Governance: MEDIUM (5-10 pages, team policies)
- Security: PRAGMATIC (OWASP basics, DLP)
- Operations: BASIC (MLOps basics)

**Prerequisites**: Team members master individual usage (Employee Levels 1-2)

**Files**: [delivery/](../delivery/)

---

### 3. Automation - Business Production

**Who**: Organizations, architects, SRE

**What**: Deploy AI applications in production to automate business processes

**Why**:
- Create business value with AI
- Deploy critical applications
- Manage AI at scale

**Characteristics**:
- Risk: High-Critical
- Budget: Tens-hundreds k€/month
- Timeline: Months → Quarters
- Governance: FULL (NIST AI RMF, AI CoE, audits)
- Security: COMPLETE (Defense-in-depth 6 layers)
- Operations: COMPLETE (MLOps/LLMOps full)

**Prerequisites**:
- Individual maturity (Employee Levels 1-2)
- Team experience (Delivery Levels 2-3)

**Files**: [automation/](../automation/)

---

## Major Divergence: 01-strategy.md

The `01-strategy.md` files of the 3 frameworks are **fundamentally different** because strategic objectives change radically:

### Employee: Personal Discovery Strategy
- **Focus**: Find tools to improve MY productivity
- **Approach**: Trial-and-error, no formal analysis
- **Content**:
  - AI tool catalog by category (coding, writing, research)
  - Discovery approach (try 2-3 tools for 1 month)
  - Simple metrics ("Does this save me time?")
  - Principle: SaaS only, no company data

### Delivery: Collective Integration Strategy
- **Focus**: Identify team integration patterns
- **Approach**: Guided experimentation (2-week sprints)
- **Content**:
  - Catalog of proven patterns (code review, doc gen, test gen)
  - Experimentation framework (selection, sprint, decision)
  - No formal business case (manageable budget, quick feedback)
  - Tech strategy: SaaS first, light PaaS, no IaaS
  - Data strategy: Team data (anonymized), no customer data

### Automation: Business Use Case Strategy
- **Focus**: Identify AI use cases with business ROI
- **Approach**: Formal analysis, business case, metrics
- **Content**:
  - Discovery methodology (internal analysis, industry research)
  - Use case definition (objective, metric, complete strategy)
  - Technology decision tree (SaaS/PaaS/IaaS)
  - Complete data strategy (governance, lifecycle, compliance)
  - Responsible AI strategy (center of excellence, regulations)

**Why this divergence?**
- Strategic needs are radically different at each level
- Duplicating content would be misleading and counterproductive
- Each framework requires an approach adapted to its context

---

## Govern/Secure/Manage Differences

### Governance (04-govern.md)

| Framework | Level | Content | Approval |
|-----------|-------|---------|----------|
| **Employee** | LIGHT | Acceptable use policy (1-2 pages) | None (self-service) |
| **Delivery** | MEDIUM | Team policies (5-10 pages), data handling, incident response | Team Lead |
| **Automation** | FULL | Complete NIST AI RMF, AI CoE, ethics committee, 3-gate approval | Multi-gate (CoE, Legal, Security) |

### Security (05-secure.md)

| Framework | Level | Content | Controls |
|-----------|-------|---------|----------|
| **Employee** | AWARENESS | Individual best practices (MFA, no secrets, bias awareness) | Individual |
| **Delivery** | PRAGMATIC | OWASP basics, DLP basics, anonymization, secret detection | Collective (team) |
| **Automation** | COMPLETE | Defense-in-depth (6 layers), pentesting, SIEM, audits, compliance | Production (org) |

### Operations (06-manage.md)

| Framework | Level | Content | MLOps |
|-----------|-------|---------|-------|
| **Employee** | MINIMAL | SaaS subscriptions management, personal productivity | None |
| **Delivery** | BASIC | Git versioning, simple deployment, monitoring basics | MLOps basics |
| **Automation** | COMPLETE | Complete CI/CD, model registry, drift detection, DR/BC | MLOps/LLMOps full |

---

## Contribution Guide by Category

### Contributing to Employee

**Style**: Accessible, educational, pragmatic
- Focus on discovery and learning
- Concrete examples of tools and use cases
- Encouraging tone, not intimidating
- No heavy technical jargon

**Length**: 8-11K tokens per file

**Checklist**:
- [ ] Is the content accessible to non-tech users?
- [ ] Are examples concrete and actionable?
- [ ] Are cited tools actually usable individually?
- [ ] Is risk properly managed (no sensitive data)?

---

### Contributing to Delivery

**Style**: Pragmatic, experimentation-oriented, anti-bureaucracy
- Focus on quick action (2-week sprints)
- No formal business case (validation through usage)
- Catalog of proven patterns (not theoretical)
- Clear guidance for experimentation

**Length**: 15-30K tokens per file (more detailed than Employee)

**Checklist**:
- [ ] Is the pattern proven in industry (real examples)?
- [ ] Is the experimentation approach clear?
- [ ] Are success metrics defined?
- [ ] Is risk manageable for a team?

---

### Contributing to Automation

**Style**: Formal, complete, production-oriented
- Focus on reliability and compliance
- Business case and ROI required
- Complete governance (NIST AI RMF, audits)
- Detailed architecture and operations

**Length**: 8-20K tokens per file (condensed but complete)

**Checklist**:
- [ ] Does content cover production aspects (HA, DR, monitoring)?
- [ ] Is compliance addressed (NIST, regulations)?
- [ ] Are critical risks identified and mitigated?
- [ ] Is architecture scalable and resilient?

---

## Pattern de référence : éviter la duplication

### Références croisées

**Principe** : Ne pas dupliquer le contenu, utiliser des références.

**Exemples** :

```markdown
<!-- Mauvais : Dupliquer les équivalences cloud -->
| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| ML Platform | SageMaker | Vertex AI | Azure ML |
...

<!-- Bon : Référencer GLOSSARY -->
Voir [GLOSSARY.md](../GLOSSARY.md) pour les équivalences de services cloud.
```

---

## Skills and Training Referencing

### SKILLS.md: Centralized Maturity Grid

[SKILLS.md](../SKILLS.md) contains:
- 4 levels with measurable criteria
- 6 skill axes
- Skills Matrix with explicit ⭐ rating
- Guided self-assessment
- Framework transition validation
- Level ↔ Framework mapping

**Use SKILLS.md instead of redefining levels.**

### TRAINING.md: Centralized Training Paths

[TRAINING.md](../TRAINING.md) contains:
- 3 paths (1→2, 2→3, 3→4)
- Concepts + Tools structure
- Tool training format (discovery)
- Project validation
- Training governance (LIGHT/MEDIUM/FULL)
- Certifications

**Reference TRAINING.md from phases (employee/delivery/automation 02-plan.md).**

### Reference Pattern

```markdown
<!-- Good: Reference SKILLS.md -->
Consult [SKILLS.md](../SKILLS.md) for maturity levels.

<!-- Good: Reference TRAINING.md -->
Consult [TRAINING.md](../TRAINING.md) section "Path Level X → Y".

<!-- Bad: Redefine levels -->
| Level | Skills | ... |
|-------|--------|-----|
| 1 | Prompt basics | ... |
```

```markdown
<!-- Mauvais : Re-expliquer les principes IA responsable -->
Les 6 principes d'IA responsable sont :
1. Équité : ...
2. Fiabilité : ...
...

<!-- Bon : Référencer README -->
Voir [README.md](../README.md) pour les 6 principes d'IA responsable.
```

### GLOSSARY.md : référence centralisée

Le fichier [GLOSSARY.md](../GLOSSARY.md) contient :
- **Équivalences cloud** (AWS/GCP/Azure) pour tous les services
- **Acronymes IA** (RAG, MLOps, NIST, etc.)
- **Concepts de base** (modèles de consommation, niveaux maturité)

**Utilisez GLOSSARY au lieu de répéter ces informations.**

---

## Template standard de phase

```markdown
# Phase X : [Nom] - [Titre descriptif]

## Vue d'ensemble

[2-3 phrases décrivant l'objectif de la phase]

## 1. [Première section]

### [Sous-section si nécessaire]

[Contenu minimal - privilégier les assets actionnables]

## 2. [Deuxième section]

...

## Checklist [Nom Phase]

### 🚀 Startup
- [ ] [3-4 items essentiels]

### 🏢 Enterprise
- [ ] [5-7 items complets]

## Prochaine étape

→ [Phase X : Nom](0X-nom.md) - Description courte
```

## Conventions de tableaux

### Format markdown standard
```markdown
| Colonne 1 | Colonne 2 | Colonne 3 |
|-----------|-----------|-----------|
| Valeur 1  | Valeur 2  | Valeur 3  |
```

### Pattern cloud-agnostic
```markdown
| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| Service | Nom AWS | Nom GCP | Nom Azure |
```

### Grilles de maturité (4 niveaux)
```markdown
| Niveau | Critère A | Critère B | Résultat |
|--------|-----------|-----------|----------|
| **Niveau 1** | Description | Description | Capacités |
| **Niveau 2** | Description | Description | Capacités |
| **Niveau 3** | Description | Description | Capacités |
| **Niveau 4** | Description | Description | Capacités |
```

### Matrices de décision/scoring
```markdown
| Critère | Poids | Score (1-5) | Justification |
|---------|-------|-------------|---------------|
| Critère 1 | XX% | ? | Explication |
| Critère 2 | XX% | ? | Explication |
```

## Patterns de diagrammes ASCII

### Hiérarchie/Organisation
```
Organization
├── Niveau 1
│   ├── Sous-niveau A
│   └── Sous-niveau B
└── Niveau 2
```

### Flux de processus
```
┌─────────────┐
│   Étape 1   │
└─────────────┘
      ↓
┌─────────────┐
│   Étape 2   │
└─────────────┘
```

### Arbre de décision
```
┌─────────────────┐
│   Question ?    │
└─────────────────┘
      ↓
  ┌───┴───┐
  │       │
Oui       Non
  │       │
  ↓       ↓
[A]      [B]
```

### Architecture système
```
[Composant 1]
      ↓
[Composant 2] ←→ [Composant 3]
      ↓
[Composant 4]
```

## Conventions de rédaction

### Ton et style
- **Ton** : Professionnel, pragmatique, direct
- **Style** : Impératifs, pas de jargon sans explication
- **Format** : Phrases courtes, bullets, tableaux
- **Focus** : Assets actionnables > explications longues

### Principes de condensation
- ❌ **Éviter** : Paragraphes explicatifs longs, répétitions, blabla
- ✅ **Privilégier** : Tableaux, grilles, matrices, checklists, diagrammes

### Équivalences cloud
- **Toujours** utiliser le pattern `| Concept | AWS | GCP | Azure |`
- **Référencer** GLOSSARY.md pour les services courants
- **Ne pas répéter** les triplets partout

### Références externes
- Frameworks standards (NIST, MITRE, OWASP) : Lien + résumé minimal
- Documentation cloud : Lien vers doc officielle
- Pas de duplication complète de contenu externe

## Pattern de références croisées

### Liens inter-phases
```markdown
→ [Phase X : Nom](0X-nom.md) - Description courte
```

### Références à sections
```markdown
Voir [Phase X](0X-nom.md) pour plus de détails sur [sujet].
```

### Références aux fichiers de support
```markdown
Voir [GLOSSARY.md](GLOSSARY.md) pour les équivalences cloud.
Voir [README.md](README.md) pour les principes IA responsable.
```

## Structure des ressources actionnables

### Checklists
- **Startup** : 3-4 items critiques uniquement
- **Enterprise** : 5-7 items complets
- Format : `- [ ] Action claire et actionnable`

### Grilles d'évaluation
- 4 niveaux de maturité
- Critères mesurables
- Résultats clairs par niveau

### Matrices
- Headers clairs
- Critères quantifiables
- Guidance pour utilisation

### Diagrammes
- ASCII art simple
- Focus sur la clarté
- Annotations minimales

### Templates
- Structure claire
- Sections prédéfinies
- Guidance d'utilisation

## Règles de taille

- **Fichiers de phase** : 8-11K tokens
- **Sections** : 2-3K tokens max
- **Tableaux** : Privilégier la densité d'information
- **Explications** : 2-3 phrases max par concept

## Anti-patterns à éviter

❌ **Ne pas faire** :
- Répéter les principes IA responsable (déjà dans README)
- Lister tous les services cloud (référencer GLOSSARY)
- Dupliquer le contenu de frameworks externes
- Créer des catalogues d'outils technologiques
- Écrire des paragraphes de plusieurs phrases
- Ajouter du "fluff" ou du "padding"

✅ **Faire** :
- Maximiser les assets actionnables
- Référencer les sources externes
- Utiliser GLOSSARY pour équivalences
- Condenser au maximum
- Focus sur la valeur pratique

---

## Principe d'Agnosticisme des Outils

### Règle d'Or

Le framework fournit des **exemples d'outils**, jamais des **prescriptions**.

**Formulation correcte**: "Examples: GitHub Copilot, Cursor, Codeium"
**Formulation incorrecte**: "We recommend GitHub Copilot"

### Pourquoi l'agnosticisme ?

1. **Éviter le vendor lock-in** - Organisations libres de choisir selon leur contexte
2. **Respecter l'existant** - Infrastructures et choix techniques déjà en place
3. **Maintenir la pertinence** - Framework reste valide malgré l'évolution du marché
4. **Permettre l'innovation** - Adoption de nouveaux outils sans refonte du framework

### Comment maintenir l'agnosticisme

#### ✅ FAIRE

**Multiples alternatives par catégorie**:
```markdown
| Code assist | GitHub Copilot / Cursor / Codeium | Dev productivity | 150-250€/month |
```

**Formulations neutres**:
- "Examples: X, Y, Z"
- "Tools such as X, Y, or Z"
- "Options include X, Y, Z"

**Critères de sélection** (pas de choix imposé):
```markdown
**Vector DB selection criteria**:
- Managed: Pinecone (ease of use)
- Hybrid: Weaviate (flexibility)
- Self-hosted: Qdrant (cost control)
```

**Équivalences cloud complètes** (voir GLOSSARY.md):
```markdown
| ML Platform | AWS SageMaker / GCP Vertex AI / Azure ML |
```

#### ❌ NE PAS FAIRE

**Langage prescriptif**:
- ❌ "We recommend X"
- ❌ "You should use X"
- ❌ "The best tool is X"
- ❌ "X is preferred for this use case"

**Outil unique sans alternative**:
```markdown
❌ | Code assist | GitHub Copilot | Dev productivity |
✅ | Code assist | GitHub Copilot / Cursor / Codeium | Dev productivity |
```

**Triplets cloud incomplets**:
```markdown
❌ AWS SageMaker / GCP Vertex
✅ AWS SageMaker / GCP Vertex AI / Azure ML
```

**Tutoriels spécifiques à un vendor** (sauf mention explicite):
```markdown
❌ "How to deploy on AWS SageMaker"
✅ "Deployment patterns (example with SageMaker, adaptable to Vertex AI/Azure ML)"
```

### Exceptions Acceptables

Certaines mentions peuvent être plus spécifiques dans ces cas:

1. **Standards de l'industrie**:
   - NIST AI RMF (standard de référence gouvernance IA)
   - OWASP LLM Top 10 (standard sécurité LLM)
   - ISO27001, SOC2 (certifications)

2. **Open-source largement adopté**:
   - Kubernetes (orchestration containers)
   - Terraform (IaC)
   - MLflow (model registry)

3. **Exemples de code avec disclaimer**:
   ```markdown
   ### Code Example (OpenAI API)

   _Note: This example uses OpenAI API. Adapt for Anthropic, Google, or other providers._

   ```python
   import openai
   ...
   ```
   ```

4. **Comparaisons techniques objectives**:
   ```markdown
   | Provider | Context Window | Cost/1M tokens |
   |----------|---------------|----------------|
   | OpenAI GPT-4 | 128K | $30 |
   | Anthropic Claude 3.5 | 200K | $15 |
   | Google Gemini 1.5 | 1M | $7 |
   ```

### Checklist de Contribution

Avant d'ajouter ou modifier une mention d'outil, vérifier:

- [ ] Est-ce un **exemple** (pas une prescription) ?
- [ ] Au moins **2 alternatives** mentionnées (sauf exceptions) ?
- [ ] **Contexte d'usage** clair (pourquoi cet outil pour ce cas) ?
- [ ] Si service cloud : **AWS + GCP + Azure** présents ?
- [ ] **Critères de sélection** fournis (pas juste une liste) ?
- [ ] **Formulation neutre** ("examples", "such as", "options") ?
- [ ] **Référence à GLOSSARY.md** si équivalences cloud ?

### Maintenance de l'Agnosticisme

**Audit régulier** (trimestriel recommandé):

```bash
# Test 1: Vérifier langage prescriptif
grep -rni "must use\|should use\|recommended\|preferred\|best tool" employee/ delivery/ automation/ --include="*.md"
# → Résultat attendu: 0 matches (sauf dans citations de standards)

# Test 2: Vérifier équilibre cloud providers
grep -c "AWS" automation/ --include="*.md"
grep -c "GCP" automation/ --include="*.md"
grep -c "Azure" automation/ --include="*.md"
# → Résultat attendu: ratios similaires (~+/-20%)

# Test 3: Vérifier références GLOSSARY
grep -c "GLOSSARY.md" automation/ --include="*.md"
# → Résultat attendu: au moins 1 par fichier mentionnant services cloud
```

**Processus de correction**:
1. Identifier les mentions problématiques (audit)
2. Ajouter alternatives manquantes
3. Remplacer formulations prescriptives par formulations neutres
4. Ajouter critères de sélection si pertinent
5. Vérifier cohérence avec GLOSSARY.md

### Exemples de Corrections

#### Avant → Après

**Cas 1: Mention unique**
```markdown
❌ | Code assist | GitHub Copilot Business | 200€/month |
✅ | Code assist | GitHub Copilot / Cursor / Codeium | 150-250€/month |
```

**Cas 2: Formulation prescriptive**
```markdown
❌ We recommend using GitHub Copilot Business for team productivity.
✅ Code assistance tools (examples: GitHub Copilot, Cursor, Codeium) improve team productivity.
   Choose based on IDE integration and budget.
```

**Cas 3: Triplet cloud incomplet**
```markdown
❌ | PaaS ML | AWS SageMaker / GCP Vertex | Training, deployment |
✅ | PaaS ML | AWS SageMaker / GCP Vertex AI / Azure ML | Training, deployment |
```

**Cas 4: Ajout de critères**
```markdown
❌ Vector DB: Pinecone, Weaviate, Qdrant

✅ **Vector DB selection**:
- Pinecone (managed, easy setup, higher cost)
- Weaviate (hybrid, flexible, moderate cost)
- Qdrant (self-hosted, full control, lower cost)
Choose based on: team expertise, budget, scale requirements.
```

---
