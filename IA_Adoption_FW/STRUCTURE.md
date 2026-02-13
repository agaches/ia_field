# Style Guide & Structure - Framework d'Adoption IA

> Guide de référence pour maintenir la cohérence du framework et comprendre sa structure

---

## Vue d'ensemble de la structure 3-catégories

Le framework est organisé en **3 catégories** suivant le modèle "Person → Project → Product" :

```
/workspace/git/agaches/ia_field/IA_Adoption_FW/
├── 00-strategy-global.md          ← Stratégie globale, modèle 3-catégories
├── README.md                       ← Vue d'ensemble, navigation
├── STRUCTURE.md                    ← Ce fichier (structure + style)
├── GLOSSARY.md                     ← Équivalences cloud, concepts IA
│
├── employee/                       ← Catégorie 1: Adoption individuelle
│   ├── README.md
│   ├── 01-strategy.md
│   ├── 02-plan.md
│   ├── 03-ready.md
│   ├── 04-govern.md (LIGHT)
│   ├── 05-secure.md (AWARENESS)
│   └── 06-manage.md (MINIMAL)
│
├── delivery/                       ← Catégorie 2: Intégration équipe
│   ├── README.md
│   ├── 01-strategy.md
│   ├── 02-plan.md
│   ├── 03-ready.md
│   ├── 04-govern.md (MEDIUM)
│   ├── 05-secure.md (PRAGMATIQUE)
│   └── 06-manage.md (BASIQUE)
│
└── automation/                     ← Catégorie 3: Production métier
    ├── README.md
    ├── 01-strategy.md
    ├── 02-plan.md
    ├── 03-ready.md
    ├── 04-govern.md (FULL)
    ├── 05-secure.md (COMPLET)
    └── 06-manage.md (COMPLET)
```

---

## Les 3 catégories : Qui, Quoi, Pourquoi

### 1. Employee - Adoption individuelle

**Qui** : Individus (tech ou non-tech)

**Quoi** : Améliorer sa productivité personnelle avec des outils IA

**Pourquoi** :
- Développer des compétences IA de base
- Découvrir les outils adaptés à son travail
- Adopter les bonnes pratiques de sécurité individuelles

**Caractéristiques** :
- Risque : Low-Medium
- Budget : 20-50€/mois/personne
- Timeline : Heures → Jours
- Gouvernance : LIGHT (1-2 pages)
- Sécurité : AWARENESS (bonnes pratiques)
- Opérations : MINIMAL (SaaS subscriptions)

**Fichiers** : [employee/](../employee/)

---

### 2. Delivery - Intégration équipe

**Qui** : Équipes techniques et leads

**Quoi** : Intégrer l'IA dans les processus collectifs de livraison

**Pourquoi** :
- Améliorer la vélocité et qualité de livraison
- Valider des patterns d'intégration IA en équipe
- Établir des pratiques collectives

**Caractéristiques** :
- Risque : Medium
- Budget : Quelques k€/mois/équipe
- Timeline : Semaines → Mois
- Gouvernance : MEDIUM (5-10 pages, politiques équipe)
- Sécurité : PRAGMATIQUE (OWASP basics, DLP)
- Opérations : BASIQUE (MLOps basics)

**Prérequis** : Membres d'équipe maîtrisent l'usage individuel (Employee Niveaux 1-2)

**Fichiers** : [delivery/](../delivery/)

---

### 3. Automation - Production métier

**Qui** : Organisations, architectes, SRE

**Quoi** : Déployer des applications IA en production pour automatiser des processus métier

**Pourquoi** :
- Créer de la valeur business avec l'IA
- Déployer des applications critiques
- Gérer l'IA à l'échelle

**Caractéristiques** :
- Risque : High-Critical
- Budget : Dizaines-centaines k€/mois
- Timeline : Mois → Trimestres
- Gouvernance : FULL (NIST AI RMF, AI CoE, audits)
- Sécurité : COMPLET (Defense-in-depth 6 layers)
- Opérations : COMPLET (MLOps/LLMOps full)

**Prérequis** :
- Maturité individuelle (Employee Niveaux 1-2)
- Expérience équipe (Delivery Niveaux 2-3)

**Fichiers** : [automation/](../automation/)

---

## Divergence majeure : 01-strategy.md

Les fichiers `01-strategy.md` des 3 frameworks sont **fondamentalement différents** car les objectifs stratégiques changent radicalement :

### Employee : Stratégie de découverte personnelle
- **Focus** : Trouver des outils pour améliorer MA productivité
- **Approche** : Essai-erreur, pas d'analyse formelle
- **Contenu** :
  - Catalogue d'outils IA par catégorie (coding, writing, research)
  - Approche de découverte (essayer 2-3 outils pendant 1 mois)
  - Métriques simples ("Est-ce que ça me fait gagner du temps ?")
  - Principe : SaaS uniquement, pas de données d'entreprise

### Delivery : Stratégie d'intégration collective
- **Focus** : Identifier des patterns d'intégration en équipe
- **Approche** : Expérimentation guidée (sprints 2 semaines)
- **Contenu** :
  - Catalogue de patterns éprouvés (code review, doc gen, test gen)
  - Framework d'expérimentation (sélection, sprint, décision)
  - Pas de business case formel (budget manageable, feedback rapide)
  - Stratégie tech : SaaS first, light PaaS, no IaaS
  - Stratégie data : Données équipe (anonymisées), pas de clients

### Automation : Stratégie de cas d'usage métier
- **Focus** : Identifier des cas d'usage IA avec ROI business
- **Approche** : Analyse formelle, business case, métriques
- **Contenu** :
  - Méthodologie de découverte (analyse interne, recherche industrie)
  - Définition cas d'usage (objectif, métrique, stratégie complète)
  - Arbre de décision technologique (SaaS/PaaS/IaaS)
  - Stratégie data complète (gouvernance, cycle de vie, conformité)
  - Stratégie IA responsable (centre d'excellence, réglementations)

**Pourquoi cette divergence ?**
- Les besoins stratégiques sont radicalement différents à chaque niveau
- Dupliquer du contenu serait trompeur et contre-productif
- Chaque framework nécessite une approche adaptée à son contexte

---

## Différences Govern/Secure/Manage

### Gouvernance (04-govern.md)

| Framework | Niveau | Contenu | Approbation |
|-----------|--------|---------|-------------|
| **Employee** | LIGHT | Politique acceptable use (1-2 pages) | Aucune (self-service) |
| **Delivery** | MEDIUM | Politiques équipe (5-10 pages), data handling, incident response | Team Lead |
| **Automation** | FULL | NIST AI RMF complet, AI CoE, comité éthique, 3 portes d'approbation | Multi-portes (CoE, Legal, Security) |

### Sécurité (05-secure.md)

| Framework | Niveau | Contenu | Contrôles |
|-----------|--------|---------|-----------|
| **Employee** | AWARENESS | Bonnes pratiques individuelles (MFA, no secrets, awareness biais) | Individuels |
| **Delivery** | PRAGMATIQUE | OWASP basics, DLP basics, anonymization, secret detection | Collectifs (équipe) |
| **Automation** | COMPLET | Defense-in-depth (6 layers), pentesting, SIEM, audits, conformité | Production (org) |

### Opérations (06-manage.md)

| Framework | Niveau | Contenu | MLOps |
|-----------|--------|---------|-------|
| **Employee** | MINIMAL | Gestion subscriptions SaaS, productivité personnelle | Aucun |
| **Delivery** | BASIQUE | Git versioning, déploiement simple, monitoring basics | MLOps basics |
| **Automation** | COMPLET | CI/CD complet, model registry, drift detection, DR/BC | MLOps/LLMOps full |

---

## Guide de contribution par catégorie

### Contribuer à Employee

**Style** : Accessible, pédagogique, pragmatique
- Focus sur la découverte et l'apprentissage
- Exemples concrets d'outils et cas d'usage
- Ton encourageant, pas intimidant
- Pas de jargon technique lourd

**Longueur** : 8-11K tokens par fichier

**Checklist** :
- [ ] Le contenu est accessible à un non-tech ?
- [ ] Les exemples sont concrets et actionnables ?
- [ ] Les outils cités sont réellement utilisables individuellement ?
- [ ] Le risque est bien encadré (pas de données sensibles) ?

---

### Contribuer à Delivery

**Style** : Pragmatique, orienté expérimentation, anti-bureaucratie
- Focus sur l'action rapide (sprints 2 semaines)
- Pas de business case formel (validation par l'usage)
- Catalogue de patterns éprouvés (pas théoriques)
- Guidance claire pour l'expérimentation

**Longueur** : 15-30K tokens par fichier (plus détaillé qu'Employee)

**Checklist** :
- [ ] Le pattern est prouvé dans l'industrie (exemples réels) ?
- [ ] L'approche d'expérimentation est claire ?
- [ ] Les métriques de succès sont définies ?
- [ ] Le risque est gérable pour une équipe ?

---

### Contribuer à Automation

**Style** : Formel, complet, orienté production
- Focus sur la fiabilité et conformité
- Business case et ROI requis
- Gouvernance complète (NIST AI RMF, audits)
- Architecture et opérations détaillées

**Longueur** : 8-20K tokens par fichier (condensé mais complet)

**Checklist** :
- [ ] Le contenu couvre les aspects production (HA, DR, monitoring) ?
- [ ] La conformité est adressée (NIST, réglementations) ?
- [ ] Les risques critiques sont identifiés et mitigés ?
- [ ] L'architecture est scalable et résiliente ?

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
