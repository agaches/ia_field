# Stratégie Globale - Framework d'Adoption IA

> Vue d'ensemble stratégique du modèle "Person → Project → Product"

## Vue d'ensemble

Ce framework d'adoption IA est structuré autour d'un modèle progressif en **3 catégories** qui reflètent la réalité de l'adoption technologique : on commence par développer des **compétences individuelles**, puis on les applique à des **processus d'équipe**, avant de les déployer en **production pour automatiser des processus métier**.

## Modèle "Person → Project → Product"

```
┌──────────────────────────────────────────────────────────────────────────┐
│                    PARCOURS D'ADOPTION IA                                 │
└──────────────────────────────────────────────────────────────────────────┘

    ┌──────────────────┐
    │     PERSON       │  ← Foundation: Compétences individuelles
    │   (Employee)     │     Usage: Productivité personnelle
    │   Niveaux 1-2    │     Risk: Low
    └──────────────────┘     Timeline: Hours → Days
            ↓
    (Maîtrise individuelle acquise)
            ↓
    ┌──────────────────┐
    │     PROJECT      │  ← Build on: Maturité individuelle
    │   (Delivery)     │     Usage: Processus collectifs d'équipe
    │   Niveaux 2-3    │     Risk: Medium
    └──────────────────┘     Timeline: Weeks → Months
            ↓
    (Expérience équipe validée)
            ↓
    ┌──────────────────┐
    │     PRODUCT      │  ← Build on: Processus + Compétences
    │  (Automation)    │     Usage: APIs métier en production
    │   Niveaux 3-4    │     Risk: High-Critical
    └──────────────────┘     Timeline: Months → Quarters
```

### En résumé

> **Person → Project → Product** = "**J'apprends** → **On collabore** → **On industrialise**"

C'est un **modèle de maturité progressive** où chaque niveau construit sur le précédent, au lieu de tout vouloir faire d'un coup !

- **Person (J'apprends)** : Je développe mes compétences individuelles avec l'IA
- **Project (On collabore)** : On applique ces compétences aux processus d'équipe
- **Product (On industrialise)** : On déploie en production pour automatiser le métier

---

## Les 3 catégories : démarcation claire

### 1. Person (Employee) - Adoption individuelle

**Qui** : Individus (tech ou non-tech)

**Quoi** : Améliorer sa productivité personnelle avec des outils IA

**Exemples** :
- Développeur utilisant GitHub Copilot
- Employé utilisant ChatGPT ou Claude pour rédaction
- Professionnel utilisant M365 Copilot
- Chercheur utilisant Perplexity ou NotebookLM

**Démarcation** :
- Usage **personnel**, pas collectif
- Données **personnelles**, pas de données clients
- Risque **low-medium** (impact limité à l'individu)
- Budget **20-50€/mois** par personne

**Framework** : [employee/](employee/README.md)

---

### 2. Project (Delivery) - Intégration équipe

**Qui** : Équipes techniques et leads

**Quoi** : Intégrer l'IA dans les processus collectifs de livraison

**Exemples** :
- Code review automatisée par IA
- Génération collective de documentation
- Testing et refactoring assistés par IA
- Sprint planning avec IA

**Démarcation** :
- Usage **collectif**, workflows d'équipe
- Données **internes d'équipe** (code, docs, architecture)
- Risque **medium** (impact sur la vélocité de l'équipe)
- Budget **quelques k€/mois** par équipe

**Prérequis** : Membres d'équipe maîtrisent l'usage individuel (Niveaux 1-2)

**Framework** : [delivery/](delivery/README.md)

---

### 3. Product (Automation) - Production métier

**Qui** : Organisations, architectes, SRE

**Quoi** : Déployer des applications IA en production pour automatiser des processus métier

**Exemples** :
- API IA exposée publiquement
- Chatbot client en production
- Workflow automatisé critique métier
- Système ML de prédiction ou recommandation

**Démarcation** :
- Usage **production**, disponibilité 24/7
- Données **clients/métier** sensibles
- Risque **high-critical** (impact sur le business)
- Budget **dizaines à centaines de k€/mois**

**Prérequis** :
- Maturité individuelle (Employee Niveaux 1-2)
- Expérience équipe (Delivery Niveaux 2-3)

**Framework** : [automation/](automation/README.md)

---

## Tableau comparatif des catégories

| Critère | Employee | Delivery | Automation |
|---------|----------|----------|------------|
| **Scope** | Individu | Équipe | Organisation |
| **Niveau maturité** | 1-2 | 2-3 | 3-4 |
| **Risque** | Low-Medium | Medium | High-Critical |
| **Budget** | 20-50€/mois/personne | Quelques k€/mois/équipe | Dizaines-centaines k€/mois |
| **Timeline** | Heures → Jours | Semaines → Mois | Mois → Trimestres |
| **Gouvernance** | LIGHT (1-2 pages) | MEDIUM (5-10 pages) | FULL (NIST AI RMF, AI CoE) |
| **Sécurité** | Awareness | Pragmatique (OWASP basics) | Complet (Defense-in-depth) |
| **Opérations** | Minimal (SaaS subscriptions) | Basique (MLOps basics) | Complet (MLOps/LLMOps) |
| **Data** | Personnelle uniquement | Interne équipe (anonymisée) | Clients/métier (sensible) |
| **Tech Stack** | SaaS uniquement | SaaS + Light PaaS | SaaS/PaaS/IaaS |
| **Approbation** | Aucune (self-service) | Team Lead | Multi-portes (CoE, Legal, Security) |

## Progression de maturité

### Niveaux 1-4 mappés sur les catégories

```
┌─────────────────────────────────────────────────────────────────────┐
│                        NIVEAUX DE MATURITÉ                           │
└─────────────────────────────────────────────────────────────────────┘

 Niveau 1                    Niveau 2                    Niveau 3                    Niveau 4
 BASIQUE                     INTERMÉDIAIRE               AVANCÉ                      EXPERT

 • SaaS uniquement           • SaaS + API usage          • RAG, ML custom            • Training grands modèles
 • Prompt basics             • Prompt engineering        • Fine-tuning               • Infrastructure complexe
 • Zero code                 • Light integration         • MLOps basics              • MLOps complet
 • Discovery                 • Data pipelines basics     • Production-ready          • Scale enterprise

 ├─────────────────────────────┤                         ├───────────────────────────────────────┤
 │     EMPLOYEE FRAMEWORK       │                         │        DELIVERY FRAMEWORK              │
 └─────────────────────────────┘                         └───────────────────────────────────────┘
                                                          ├───────────────────────────────────────────────┤
                                                          │        AUTOMATION FRAMEWORK                    │
                                                          └───────────────────────────────────────────────┘
```

### Grille de maturité détaillée

| Niveau | Compétences | Technologies | Données | Opérations | Framework |
|--------|-------------|--------------|---------|------------|-----------|
| **Niveau 1** | Prompt basics, usage SaaS | SaaS uniquement (Copilot, ChatGPT) | Personnelle | Aucune | **Employee** |
| **Niveau 2** | Prompt engineering, sélection modèles | SaaS + API usage (OpenAI API) | Personnelle + interne simple | Minimal (Git) | **Employee → Delivery** |
| **Niveau 3** | RAG, ML basics, data preprocessing | PaaS (SageMaker, Vertex AI) | Interne complexe | MLOps basics | **Delivery → Automation** |
| **Niveau 4** | Training modèles, ML avancé | IaaS (GPU clusters, K8s) | Production, clients | MLOps complet | **Automation** |

## Diagramme de dépendances entre frameworks

```
┌──────────────────────────────────────────────────────────────────────┐
│                    DÉPENDANCES ENTRE FRAMEWORKS                       │
└──────────────────────────────────────────────────────────────────────┘

                     ┌───────────────────────┐
                     │  Employee Framework   │
                     │  (Foundation)         │
                     │                       │
                     │  Compétences          │
                     │  individuelles        │
                     └───────────────────────┘
                               │
                               │ Prérequis: Niveaux 1-2
                               ↓
                     ┌───────────────────────┐
                     │  Delivery Framework   │
                     │  (Build On)           │
                     │                       │
                     │  + Processus équipe   │
                     │  + Data handling      │
                     └───────────────────────┘
                               │
                               │ Prérequis: Niveaux 2-3
                               ↓
                     ┌───────────────────────┐
                     │ Automation Framework  │
                     │ (Build On)            │
                     │                       │
                     │ + Production          │
                     │ + Gouvernance full    │
                     │ + MLOps complet       │
                     └───────────────────────┘
```

### Pourquoi cette structure en couches ?

**1. Prérequis clairs** : Chaque framework suppose que le précédent est maîtrisé
- On ne peut pas déployer en production si l'équipe n'a pas d'expérience IA
- On ne peut pas intégrer l'IA en équipe si les individus ne savent pas l'utiliser

**2. Gestion du risque progressive** : Le risque augmente avec la portée
- Individu : Risque low (gestion simple)
- Équipe : Risque medium (gouvernance équipe)
- Prod : Risque high-critical (gouvernance full)

**3. Investissement progressif** : Budget proportionnel à la valeur
- 50€/mois pour essayer (individu)
- Quelques k€/mois pour valider (équipe)
- Dizaines de k€/mois pour scaler (prod)

## Guide "Quand utiliser quel framework?"

### FAQ : Trouver votre framework

#### Q1 : "Je veux essayer GitHub Copilot pour coder plus vite"
→ **Employee Framework** - Usage personnel, productivité individuelle

#### Q2 : "Notre équipe veut automatiser les code reviews"
→ **Delivery Framework** - Processus d'équipe, intégration collective

#### Q3 : "On veut déployer un chatbot client en production"
→ **Automation Framework** - Production métier, risque élevé

#### Q4 : "Je veux utiliser ChatGPT pour mes emails"
→ **Employee Framework** - Usage personnel

#### Q5 : "On veut intégrer l'IA dans notre sprint planning"
→ **Delivery Framework** - Processus équipe

#### Q6 : "On veut créer une API IA pour nos clients"
→ **Automation Framework** - Production, API publique

#### Q7 : "Mon équipe n'a jamais utilisé l'IA"
→ **Commencez par Employee** - Développez d'abord les compétences individuelles

#### Q8 : "On a des outils individuels, on veut passer à l'équipe"
→ **Delivery Framework** - Prérequis : Niveaux 1-2 individuels validés

#### Q9 : "On veut scaler notre PoC IA en production"
→ **Automation Framework** - Prérequis : Expérience Delivery + Compétences

#### Q10 : "Combien de temps pour passer de 0 à production ?"
→ Réaliste : **6-12 mois minimum**
- 1-2 mois : Employee (adoption individuelle)
- 2-4 mois : Delivery (validation équipe)
- 3-6 mois : Automation (production)

#### Q11 : "Peut-on sauter directement à Automation ?"
→ **Non recommandé** - Les prérequis existent pour une raison :
- Sans compétences individuelles, l'équipe ne pourra pas maintenir le système
- Sans expérience équipe, vous sous-estimerez la complexité
- Le risque d'échec en production est très élevé

Exception : Si vous embauchez une équipe ML/IA déjà expérimentée (Niveaux 3-4)

#### Q12 : "Notre DSI veut un framework complet immédiatement"
→ **Automation Framework** - Mais validez les prérequis :
- [ ] Équipe avec compétences Niveaux 3-4 ?
- [ ] Expérience déploiement ML en prod ?
- [ ] Budget adapté (dizaines de k€/mois) ?

Si "Non" à l'une de ces questions, commencez par Employee puis Delivery.

#### Q13 : "On a déjà des outils IA en production, on doit tout refaire ?"
→ **Non** - Utilisez ce framework pour :
- Auditer ce qui existe (gaps de gouvernance/sécurité)
- Standardiser les pratiques
- Former les équipes manquant de compétences

#### Q14 : "Peut-on utiliser plusieurs frameworks en parallèle ?"
→ **Oui** - Les frameworks coexistent :
- Individus : Employee Framework
- Équipes : Delivery Framework
- Production : Automation Framework

Mais respectez les prérequis de chaque niveau.

#### Q15 : "Quel framework pour un PoC IA interne ?"
→ Dépend de la portée :
- **PoC personnel** (1 personne, 1 semaine) : Employee
- **PoC équipe** (5-10 personnes, 1 mois) : Delivery
- **PoC prod-ready** (app métier critique) : Automation

---

## Divergences majeures entre frameworks

### Pourquoi 01-strategy.md diverge complètement ?

Les fichiers `01-strategy.md` des 3 frameworks sont **fondamentalement différents** car les objectifs stratégiques changent radicalement :

#### Employee : Stratégie de découverte personnelle
- **Focus** : Trouver des outils pour améliorer MA productivité
- **Approche** : Essai-erreur, pas d'analyse formelle
- **Output** : Liste d'outils SaaS à tester
- **Décision** : Individuelle, pas d'approbation
- **Métrique** : "Est-ce que ça me fait gagner du temps ?"

#### Delivery : Stratégie d'intégration collective
- **Focus** : Identifier des patterns d'intégration en équipe
- **Approche** : Expérimentation guidée (sprints 2 semaines)
- **Output** : 1-2 patterns validés par l'équipe
- **Décision** : Collective (team lead + retros)
- **Métrique** : "Est-ce que ça améliore notre vélocité/qualité ?"

#### Automation : Stratégie de cas d'usage métier
- **Focus** : Identifier des cas d'usage IA avec ROI business
- **Approche** : Analyse formelle, business case, métriques
- **Output** : Stratégie IA complète (use cases, tech, data, responsable)
- **Décision** : Multi-portes (CoE, Legal, Security)
- **Métrique** : "Quel est le ROI ? Quels sont les risques ?"

### Différences de gouvernance

| Framework | Gouvernance | Approbation | Documentation | Audits |
|-----------|-------------|-------------|---------------|--------|
| **Employee** | LIGHT - Politique acceptable use (1-2 pages) | Aucune (self-service) | Minimal | Aucun |
| **Delivery** | MEDIUM - Politiques équipe (5-10 pages) | Team Lead | Standard (wikis, READMEs) | Retros équipe |
| **Automation** | FULL - NIST AI RMF, AI CoE | Multi-portes (3+ approbations) | Complet (architecture, compliance) | Trimestriels |

### Différences de sécurité

| Framework | Posture | Contrôles | Responsabilité |
|-----------|---------|-----------|----------------|
| **Employee** | Awareness - Bonnes pratiques | Individuels (MFA, no secrets) | Individu |
| **Delivery** | Pragmatique - OWASP basics | Collectifs (DLP basics, anonymization) | Tech Lead |
| **Automation** | Complet - Defense-in-depth (6 layers) | Production (SIEM, pentesting, audits) | CISO + AI CoE |

### Différences d'opérations

| Framework | MLOps | Déploiement | Monitoring | DR/BC |
|-----------|-------|-------------|------------|-------|
| **Employee** | Aucun | N/A (SaaS) | Aucun | N/A |
| **Delivery** | Basics - Git versioning | Simple (staging/prod) | Basics (logs, errors) | Minimal |
| **Automation** | Complet - CI/CD, registry, drift | Multi-env (dev/staging/prod) | Complet (metrics, traces, alerts) | Complet (RPO/RTO) |

---

## Pas de priorisation, juste cartographie

**Important** : Ce fichier ne dit **PAS** quel framework utiliser en priorité.

Il **cartographie** les 3 catégories et aide à :
- Comprendre les différences entre les frameworks
- Identifier où vous êtes actuellement
- Comprendre les prérequis pour progresser

**La priorisation dépend de VOTRE contexte** :
- Individu découvrant l'IA ? → Employee
- Équipe avec compétences IA ? → Delivery
- Organisation mature ? → Automation

**Tous les frameworks sont valides** selon votre situation.

---

## Principes partagés

### Les 6 principes d'IA Responsable

Tous les frameworks partagent les mêmes principes fondamentaux :

1. **Équité** : Traiter tous les utilisateurs de manière équitable
2. **Fiabilité et sécurité** : Fonctionnement sûr et fiable
3. **Confidentialité et sécurité** : Respect de la vie privée
4. **Inclusivité** : Accessible à tous
5. **Transparence** : Compréhensible et explicable
6. **Responsabilité** : Responsabilité claire

Voir [README.md](README.md) pour détails complets.

### Agnosticisme cloud

Tous les frameworks sont conçus pour être applicables avec n'importe quel fournisseur cloud :
- **AWS** (SageMaker, Bedrock)
- **GCP** (Vertex AI)
- **Azure** (Azure AI Foundry, OpenAI)
- **Hybride/Multi-cloud**

Voir [GLOSSARY.md](GLOSSARY.md) pour les équivalences de services.

---

## Navigation entre frameworks

### Liens rapides

- **[Employee Framework](employee/README.md)** - Adoption individuelle (Niveaux 1-2)
- **[Delivery Framework](delivery/README.md)** - Intégration équipe (Niveaux 2-3)
- **[Automation Framework](automation/README.md)** - Production métier (Niveaux 3-4)

### Documents de référence

- **[README.md](README.md)** - Vue d'ensemble, principes IA Responsable
- **[GLOSSARY.md](GLOSSARY.md)** - Équivalences cloud, acronymes IA
- **[STRUCTURE.md](STRUCTURE.md)** - Structure technique, guide de contribution

---

## Quand lire ce document ?

Ce document est utile pour :
1. **Comprendre le modèle global** avant de plonger dans un framework spécifique
2. **Choisir le bon framework** pour votre situation
3. **Planifier la progression** d'un framework à l'autre
4. **Expliquer la structure** à des stakeholders (management, équipes)

**Après lecture**, plongez directement dans le framework adapté à votre situation :
- Vous découvrez l'IA ? → [Employee Framework](employee/README.md)
- Votre équipe a des compétences IA ? → [Delivery Framework](delivery/README.md)
- Vous déployez en production ? → [Automation Framework](automation/README.md)

---

**Document Version** : 1.0
**Last Updated** : 2025-01-15
**Owner** : Framework Maintainers
**Review Cycle** : Semi-annual
