# Phase 2 : Plan - Planifier l'adoption IA de votre équipe

## Vue d'ensemble

Cette phase transforme votre stratégie d'équipe en plan d'action concret. Vous allez évaluer les compétences collectives, monter en compétence ensemble, accéder aux ressources nécessaires, prioriser vos premiers projets IA, et lancer des PoC d'équipe pour valider la faisabilité technique.

**Focus équipe** : Compétences Niveaux 2-3 (intermédiaire à avancé), outils SaaS + PaaS, PoC d'équipe (1-2 sprints).

## 1. Évaluer les compétences IA de l'équipe

### Framework de maturité d'équipe (Niveaux 2-3)

Évaluez les capacités actuelles de votre équipe pour planifier une montée en compétence réaliste :

| Niveau | Compétences d'équipe | Maturité données | Cas d'usage faisables |
|--------|---------------------|------------------|----------------------|
| **Niveau 2 - Pratique** | • Expérience sélection modèles IA<br>• Familiarité déploiement endpoints<br>• Expérience nettoyage/préparation données<br>• Intégration APIs dans applications | • Dataset structuré petit à moyen<br>• Données domaine accessibles<br>• Pipelines de données basiques | • Chat GenAI avec contexte statique<br>• Applications ML avec AutoML<br>• Fine-tuning léger de modèles<br>• IA analytique (Vision, NLP) via APIs<br>• Workflows d'automatisation intelligents |
| **Niveau 3 - Avancé** | • Maîtrise prompt engineering complexe<br>• Maîtrise sélection modèles, chunking, embeddings<br>• Preprocessing et feature engineering<br>• Orchestration RAG (retrieval, indexation)<br>• MLOps de base (CI/CD, monitoring) | • Grandes quantités de données historiques<br>• Données domaine bien structurées<br>• Infrastructure de données robuste<br>• Pipelines automatisés | • Applications GenAI avec RAG<br>• Training et déploiement de modèles ML custom<br>• Fine-tuning avancé de modèles<br>• Agents IA multi-tools<br>• Systèmes de recommandation<br>• Déploiement sur VM/conteneurs |

### Étapes d'évaluation d'équipe

#### 1. Cartographier les compétences actuelles

**Méthode : Skill Matrix de l'équipe**

| Membre | Prompt Eng. | ML/Data Sci. | APIs/PaaS | DevOps/MLOps | Domaine métier | Niveau global |
|--------|-------------|--------------|-----------|--------------|----------------|---------------|
| Alice | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | Niveau 2-3 |
| Bob | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ | Niveau 2 |
| Carol | ⭐ | ⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | Niveau 2 |
| **Moyenne** | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ | **Niveau 2** |

**Légende** :
- ⭐ : Débutant (besoin de formation)
- ⭐⭐ : Pratique (autonome avec support)
- ⭐⭐⭐ : Avancé (peut former les autres)

**Action** : Identifiez les gaps critiques et les experts internes qui peuvent former les autres.

#### 2. Inventorier vos assets de données

**Checklist d'audit des données** :

| Dimension | Questions clés | Niveau actuel |
|-----------|----------------|---------------|
| **Sources** | • Quelles bases de données/APIs/fichiers ?<br>• Données structurées/semi-structurées/non-structurées ?<br>• Volume total estimé ? | |
| **Qualité** | • Complétude (% de champs vides) ?<br>• Exactitude (validation nécessaire ?) ?<br>• Fraîcheur (données en temps réel ou batch ?) | |
| **Accessibilité** | • Permissions d'accès claires ?<br>• Latence acceptable (<100ms) ?<br>• Documentation des schémas disponible ? | |
| **Compliance** | • Données sensibles (PII, RGPD) ?<br>• Restrictions géographiques ?<br>• Logs d'audit en place ? | |

**Output attendu** : Document "Data Inventory" listant toutes les sources avec métadonnées.

#### 3. Évaluer l'infrastructure technique

**Checklist d'infrastructure pour IA Niveau 2-3** :

| Composant | Niveau 2 (PaaS) | Niveau 3 (PaaS + IaaS léger) | Votre statut |
|-----------|-----------------|------------------------------|--------------|
| **Compute** | Pas requis (serverless) | VM avec GPU optionnel | |
| **Stockage** | Object storage (S3, GCS, Blob) | + Data warehouse | |
| **Réseau** | APIs publiques OK | + VPN/Private endpoints | |
| **Sécurité** | IAM basique, secrets manager | + Encryption at rest, audit logs | |
| **CI/CD** | GitHub Actions / GitLab CI | + Déploiement automatisé | |
| **Monitoring** | Logs basiques | + APM, dashboards custom | |

**Action** : Identifiez les composants manquants et estimez le coût de mise en place.

## 2. Acquérir les compétences IA en équipe

### Stratégie de montée en compétence collective

#### 1. Formation d'équipe (1-2 semaines)

**Programme de formation structuré Niveau 2 → Niveau 3** :

| Module | Durée | Format | Contenu |
|--------|-------|--------|---------|
| **Fondamentaux IA/ML** | 2 jours | Workshop équipe | • Architecture des LLM<br>• ML pipelines (training, inference)<br>• Différences GenAI vs ML classique<br>• Hands-on : Utiliser une API GenAI |
| **Prompt Engineering avancé** | 1 jour | Atelier pratique | • Techniques avancées (ReAct, Tree-of-Thought)<br>• Prompt chaining et orchestration<br>• Evaluation de qualité<br>• Hands-on : Créer une bibliothèque de prompts métier |
| **RAG et Vector Databases** | 2 jours | Workshop technique | • Embeddings et similarité sémantique<br>• Chunking strategies<br>• Vector stores (Pinecone, Weaviate, Chroma)<br>• Hands-on : Implémenter un RAG basique |
| **APIs et intégration PaaS** | 1 jour | Coding dojo | • OpenAI, Anthropic, Google Vertex APIs<br>• Gestion des tokens et coûts<br>• Error handling et retry logic<br>• Hands-on : Intégrer une API dans votre stack |
| **MLOps de base** | 1 jour | Workshop DevOps | • Versioning de modèles et prompts<br>• CI/CD pour IA<br>• Monitoring de performance<br>• Hands-on : Setup d'un pipeline simple |

**Budget formation** : 5-10K€ pour une équipe de 5-7 personnes (formateur externe + plateforme).

**Plateformes recommandées** :
- **Corporate training** : Udacity for Business, Coursera for Teams, Pluralsight
- **Hands-on labs** : AWS Skill Builder, GCP Skills Boost, Azure Learn
- **Workshops externes** : O'Reilly Learning, Fast.ai, DeepLearning.AI

#### 2. Certifications d'équipe (cible : 50% de l'équipe certifiée)

**Certifications recommandées Niveau 2-3** :

| Certification | Niveau cible | Durée préparation | Coût | Priorité |
|---------------|--------------|-------------------|------|----------|
| **TensorFlow Developer Certificate** | Niveau 2 | 40h | 100$ | Moyenne |
| **AWS Machine Learning - Specialty** | Niveau 3 | 60h | 300$ | Haute (si AWS) |
| **Google Professional ML Engineer** | Niveau 3 | 60h | 200$ | Haute (si GCP) |
| **Microsoft Azure AI Engineer Associate** | Niveau 3 | 50h | 165$ | Haute (si Azure) |
| **Databricks Lakehouse Fundamentals** | Niveau 2 | 20h | Gratuit | Basse |

**Stratégie de certification** :
- Mois 1-2 : Formation d'équipe
- Mois 3-4 : Préparation certifications (2h/semaine)
- Mois 5 : Passage des certifications

**Budget** : 1K-2K€ pour une équipe de 5-7 personnes.

#### 3. Apprentissage par les pairs

**Formats de partage de connaissances** :

| Format | Fréquence | Durée | Contenu |
|--------|-----------|-------|---------|
| **Tech Talks internes** | Hebdomadaire | 30min | Un membre présente un outil/concept IA |
| **Code Review IA** | Chaque PR | 15-30min | Review spécifique des prompts, appels API, modèles |
| **Lunch & Learn** | Bi-mensuel | 1h | Discussion informelle sur une techno IA |
| **Hackathon IA** | Trimestriel | 1 jour | Expérimenter avec une nouvelle techno |
| **Pair Programming IA** | Ad-hoc | 2-4h | Travailler à 2 sur un problème IA complexe |

**Output attendu** : Knowledge base interne (Notion, Confluence) avec :
- Bibliothèque de prompts réutilisables
- Templates de code (RAG, API calls, etc.)
- Learnings de chaque PoC
- FAQ techniques

## 3. Accéder aux ressources IA

### Modèle d'accès hybride SaaS + PaaS

**Votre stack IA Niveau 2-3** :

| Catégorie | Solution | Usage | Coût estimé (équipe 5-7) |
|-----------|----------|-------|--------------------------|
| **SaaS GenAI** | ChatGPT Team / Claude Pro | Brainstorming, prototypage rapide | 150-250€/mois |
| **PaaS GenAI** | OpenAI API / Anthropic API | Applications en production | Variable (500-2K€/mois selon usage) |
| **PaaS ML** | AWS SageMaker / GCP Vertex AI / Azure ML | Training et déploiement modèles | 200-1K€/mois (dev), plus en prod |
| **Vector DB** | Pinecone Starter / Weaviate Cloud | RAG, recherche sémantique | 70-200€/mois |
| **Observability** | LangSmith / Weights & Biases | Monitoring prompts, expériences ML | 0-200€/mois (gratuit jusqu'à seuil) |
| **Code assistance** | GitHub Copilot Business | Productivité dev | 200€/mois (19€/dev/mois) |

**Coût total mensuel** : 1-4K€ en phase de développement, 3-10K€ en production selon le trafic.

### Checklist d'accès pour équipe

#### 1. Compte cloud provider (si PaaS/IaaS)

**Choix du provider** (choisissez 1 en priorité) :

| Critère | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Services IA** | Bedrock, SageMaker | Vertex AI, GenAI Studio | Azure AI Foundry, OpenAI |
| **Maturité IA** | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| **Facilité démarrage** | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| **Coût** | ⭐⭐ | ⭐⭐ | ⭐⭐ |
| **Documentation** | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |

**Setup initial (1-2 jours)** :
- [ ] Créer compte organisation (pas de comptes perso)
- [ ] Configurer IAM/RBAC (least privilege)
- [ ] Setup billing alerts (budget = 2x estimation)
- [ ] Activer les services IA nécessaires
- [ ] Configurer secrets management
- [ ] Setup audit logging

#### 2. APIs GenAI externes

**Pour une flexibilité maximale, accédez à plusieurs providers** :

| Provider | Modèles clés | API pricing (input/output) | Use case |
|----------|--------------|----------------------------|----------|
| **OpenAI** | GPT-4o, o1 | 5-15$ / 15-60$ par 1M tokens | Reasoning, code, vision |
| **Anthropic** | Claude 3.5 Sonnet | 3$ / 15$ par 1M tokens | Long context, analyse |
| **Google** | Gemini 2.0 Flash | 0.10$ / 0.30$ par 1M tokens | Multimodal, coût bas |
| **Mistral** | Mistral Large | 3$ / 9$ par 1M tokens | EU data residency |

**Budget API mensuel** : Commencez avec 500-1K€/mois, ajustez selon usage réel.

**Setup** :
- [ ] Créer comptes organisation (1 par provider)
- [ ] Configurer billing limits
- [ ] Générer API keys avec rotation automatique
- [ ] Stocker keys dans secrets manager (Vault, AWS Secrets Manager, etc.)
- [ ] Mettre en place rate limiting dans votre code

#### 3. Infrastructure de données

**Pour le RAG et ML, vous aurez besoin de** :

| Composant | Solution Niveau 2 | Solution Niveau 3 | Coût |
|-----------|-------------------|-------------------|------|
| **Vector DB** | Pinecone Starter | Weaviate Cloud / pgvector (self-hosted) | 70-200€/mois |
| **Data warehouse** | BigQuery / Snowflake (pay-as-you-go) | Databricks / Redshift | 200-1K€/mois |
| **Data pipeline** | Cloud Functions / Lambda | Airflow (Cloud Composer, MWAA) | 100-500€/mois |
| **Feature store** | (optionnel) | Feast / Tecton | 0-300€/mois |

**Priorisation** :
- **Obligatoire pour RAG** : Vector DB
- **Optionnel Niveau 2** : Data warehouse (si grandes quantités de données)
- **Niveau 3 uniquement** : Feature store, orchestration avancée

## 4. Prioriser les cas d'usage IA de l'équipe

### Méthodologie de priorisation légère

**Simplification par rapport à l'approche enterprise** : Matrice de scoring simplifiée + priorisation collaborative.

#### 1. Évaluer la faisabilité de chaque cas d'usage

**Pour chaque cas d'usage identifié dans [Phase Strategy](01-strategy.md)** :

| Critère de faisabilité | Évaluation (1-5) | Poids | Note pondérée |
|------------------------|------------------|-------|---------------|
| **Maturité d'équipe** | Niveau requis ≤ niveau actuel ? | 30% | |
| **Disponibilité données** | Données accessibles et de qualité ? | 25% | |
| **Infrastructure** | Infrastructure suffisante ? | 20% | |
| **Complexité technique** | Maîtrisable par l'équipe ? | 15% | |
| **Risque** | Risque bas (interne, non-critique) ? | 10% | |

**Score de faisabilité** : Somme pondérée (max 5.0).

**Règle de décision** :
- Score ≥ 4.0 : Faisable maintenant
- Score 3.0-3.9 : Faisable avec préparation (formation, data prep)
- Score < 3.0 : Reporter à plus tard

#### 2. Scorer la valeur stratégique

**Matrice de scoring simplifiée** :

| Critère | Poids | Description | Score (1-5) |
|---------|-------|-------------|-------------|
| **Impact métier** | 40% | ROI attendu, amélioration KPI clés | |
| **Alignement stratégique** | 25% | Cohérence avec vision de la Phase Strategy | |
| **Effort estimé** | 20% | Temps/ressources nécessaires (inverse : 5 = faible effort) | |
| **Apprentissage** | 15% | Valeur d'apprentissage pour l'équipe | |

**Score de valeur** : Somme pondérée (max 5.0).

#### 3. Matrice de priorisation

**Plotting : Faisabilité (X) vs Valeur (Y)**

```
       Valeur
         5 │        [D]        [A] ← Priorité 1
         4 │   [E]        [B] ← Priorité 2
         3 │        [F]
         2 │   [G]        [C]
         1 │        [H]
           └─────────────────────
             1    2    3    4    5
                  Faisabilité
```

**Légende** :
- **Zone A (top-right)** : Quick wins - Lancez en priorité
- **Zone B** : Valeur élevée mais effort requis - Planifiez la préparation
- **Zone C** : Facilité mais faible valeur - Low priority
- **Zone D** : Haute valeur, faible faisabilité - Vision long terme

#### 4. Créer une roadmap d'équipe (6 mois)

**Template de roadmap** :

```markdown
## Q1 2026 (Mois 1-3)

### Sprint 1-2 : [Cas d'usage priorité 1]
**Objectif** : [Résultat mesurable]
**Équipe** : [3 personnes : Alice (lead), Bob, Carol]
**Ressources** : OpenAI API, Pinecone, 500€ budget
**Livrables** :
  - Semaine 2 : PoC fonctionnel
  - Semaine 4 : MVP en staging
  - Semaine 6 : Production (50 users internes)
**Critères de succès** :
  - [Métrique 1] : Amélioration de X%
  - [Métrique 2] : Satisfaction ≥ 4/5

### Sprint 3-4 : [Cas d'usage priorité 2]
(Même structure)

## Q2 2026 (Mois 4-6)

### Sprint 5-6 : [Cas d'usage priorité 3]
(Même structure)
```

**Règles de planification** :
- Maximum 2 projets IA en parallèle (pour une équipe de 5-7)
- Buffer de 20% entre les sprints
- Rétrospective après chaque livrable

## 5. Créer des preuves de concept (PoC) d'équipe

### Méthodologie PoC en 1-2 sprints

**Différence avec l'expérimentation individuelle** : PoC d'équipe = validation technique + métier sur un projet réel (mais interne).

#### Phase 1 : Sélection du PoC (1 semaine avant sprint)

**Critères de sélection** :

| Critère | Valeur cible | Pourquoi |
|---------|--------------|----------|
| **Scope limité** | Livrable en 2-4 semaines | Éviter l'over-engineering |
| **Valeur métier claire** | ROI mesurable | Justifier l'investissement |
| **Risque manageable** | Interne, non-critique | Accepter l'échec sans impact clients |
| **Apprentissage élevé** | Nouveaux patterns techniques | Construire les compétences |
| **Données disponibles** | ≥ 80% des données prêtes | Éviter les blocages data |

**Format de brief PoC** :

```markdown
# PoC : [Nom du projet]

## Contexte métier
[Problème à résoudre, utilisateurs cibles, impact attendu]

## Objectif technique
[Ce que vous allez construire en 2-4 semaines]

## Scope
**In scope** :
  - [Feature 1]
  - [Feature 2]

**Out of scope (pour MVP)** :
  - [Feature complexe reporter]
  - [Optimisation prématurée]

## Équipe et rôles
- **Product Owner** : [Nom] (définit les critères de succès)
- **Tech Lead** : [Nom] (architecture, décisions techniques)
- **Développeurs** : [Noms] (implémentation)
- **Data** : [Nom] (préparation données si nécessaire)

## Stack technique
- **Modèle IA** : [Ex: GPT-4o via OpenAI API]
- **Infrastructure** : [Ex: AWS Lambda + S3 + Pinecone]
- **Frontend** : [Ex: Streamlit pour demo]
- **Backend** : [Ex: FastAPI]

## Critères de succès
- [ ] **Fonctionnel** : [Ex: Répond correctement à 80% des questions]
- [ ] **Performance** : [Ex: Latence < 3s pour 90% des requêtes]
- [ ] **Coût** : [Ex: < 100€ pour le PoC]
- [ ] **Apprentissage** : [Ex: Équipe comprend l'architecture RAG]

## Budget et timeline
- **Durée** : 2 sprints (4 semaines)
- **Budget cloud** : 200-500€
- **Effort** : 2-3 personnes à temps partiel (50% de leur temps)
```

#### Phase 2 : Implémentation du PoC (2-4 semaines)

**Sprint Kanban typique pour PoC IA** :

**Semaine 1 : Setup + Data prep**
- [ ] Setup infrastructure (cloud accounts, APIs, repos)
- [ ] Préparation des données (nettoyage, chunking si RAG)
- [ ] Spike technique sur l'approche IA (tester 2-3 modèles)
- [ ] Première version du prompt ou pipeline

**Semaine 2 : Développement core**
- [ ] Implémentation du pipeline IA complet
- [ ] Intégration avec les sources de données
- [ ] Interface utilisateur basique (CLI ou Streamlit)
- [ ] Tests manuels sur 10-20 cas d'usage

**Semaine 3 : Itération + qualité**
- [ ] Amélioration de la qualité des outputs (tuning prompts, chunking, etc.)
- [ ] Tests sur 50-100 cas d'usage
- [ ] Gestion des edge cases
- [ ] Monitoring basique (logs, latence, coûts)

**Semaine 4 : Demo + documentation**
- [ ] Préparation de la démo
- [ ] Documentation technique (architecture, code)
- [ ] Rétrospective d'équipe
- [ ] Décision : Go/No-go pour la production

**Outils de développement** :

| Besoin | Outil recommandé | Niveau |
|--------|------------------|--------|
| **Prototypage rapide** | Streamlit, Gradio | Niveau 2 |
| **Backend API** | FastAPI, Flask | Niveau 2-3 |
| **Orchestration prompts** | LangChain, LlamaIndex | Niveau 2-3 |
| **Vector DB** | Pinecone, Chroma | Niveau 2-3 |
| **Observability** | LangSmith, custom logging | Niveau 3 |
| **Testing** | Pytest, custom eval framework | Niveau 3 |

#### Phase 3 : Évaluation du PoC (fin de semaine 4)

**Framework d'évaluation** :

**1. Évaluation technique**

| Dimension | Métrique | Cible | Réalisé | Gap |
|-----------|----------|-------|---------|-----|
| **Qualité** | Accuracy / Score qualité | ≥ 80% | | |
| **Performance** | Latence P90 | < 3s | | |
| **Robustesse** | Taux d'erreur | < 5% | | |
| **Coût** | Coût par requête | < 0.10€ | | |
| **Scalabilité** | Throughput max | ≥ 10 req/s | | |

**2. Évaluation métier**

| Dimension | Métrique | Cible | Réalisé | Gap |
|-----------|----------|-------|---------|-----|
| **Valeur utilisateur** | Satisfaction (1-5) | ≥ 4.0 | | |
| **Gain de temps** | Réduction temps tâche | ≥ 40% | | |
| **Adoption** | % utilisateurs actifs | ≥ 70% | | |
| **ROI** | Gain annuel estimé | ≥ 20K€ | | |

**3. Learnings techniques**

Documentez les réponses à ces questions :

- Quel modèle / approche a le mieux fonctionné ? Pourquoi ?
- Quels ont été les principaux challenges techniques ?
- Quelles hypothèses initiales étaient fausses ?
- Quelles compétences manquaient à l'équipe ?
- Quelles décisions techniques referiez-vous différemment ?

**Output attendu** : Rapport de PoC (2-3 pages) + démo enregistrée + code dans Git.

#### Phase 4 : Décision Go/No-Go

**Matrice de décision** :

| Scénario | Critères | Action |
|----------|----------|--------|
| **Go to Production** | Qualité ≥ 80%, ROI positif, équipe confiante | → Phase [Ready](03-ready.md) : Préparer la production |
| **Pivot** | Qualité 60-80%, learnings clairs, hypothèse alternative | → Nouveau PoC (2 sprints) avec approche différente |
| **Pause** | Qualité < 60%, blockers non résolus | → Former l'équipe, acquérir données manquantes, revisiter dans 3 mois |
| **Kill** | Pas de ROI, complexité trop élevée, alternative meilleure | → Documenter les learnings, archiver le code |

**Règle d'or** : 70% des PoC doivent aller en production ou pivoter. Si vous "killez" > 30% de vos PoC, votre priorisation est trop optimiste.

#### Estimation des timelines d'implémentation

**Après le PoC, estimez le temps de mise en production** :

| Composant | PoC | MVP Production | Production complète |
|-----------|-----|----------------|---------------------|
| **Features** | 1-2 features core | +2-3 features essentielles | +5-10 features complètes |
| **Qualité** | 70-80% | 85-90% | 95%+ |
| **Scalabilité** | 10-100 users | 100-1K users | 1K-10K+ users |
| **Monitoring** | Logs basiques | Dashboards, alertes | Observability complète |
| **Sécurité** | Dev/staging only | Secrets, IAM, encryption | Audit, compliance, pentests |
| **Documentation** | README | User docs, API docs | Runbooks, DR plans |
| **Durée** | 2-4 semaines | +4-8 semaines | +8-16 semaines |

**Facteurs de complexité** :

Multipliez la durée estimée par ces facteurs :
- x1.2 : Si première application IA de l'équipe (courbe d'apprentissage)
- x1.3 : Si intégration complexe avec systèmes legacy
- x1.5 : Si données non structurées ou de mauvaise qualité
- x1.2 : Si exigences de compliance strictes (RGPD, SOC2, etc.)

**Exemple** : PoC RAG réussi en 4 semaines. MVP production estimé à 6 semaines. Facteurs : première app IA (x1.2), données OK, pas de compliance stricte.
**Durée réaliste** : 6 × 1.2 = **7-8 semaines pour MVP**.

## 6. Implémenter l'IA responsable en équipe

### Frameworks de gouvernance légers

**Pour une équipe Niveau 2-3, vous n'avez pas besoin d'un AI Governance Office**, mais vous devez établir des pratiques responsables dès le début.

#### 1. Impact Assessment Template (pour chaque nouveau projet)

**Remplissez ce template avant chaque PoC** :

```markdown
# AI Impact Assessment : [Nom du projet]

## 1. Description du système IA
- **Type d'IA** : [GenAI / ML classique / IA analytique]
- **Modèle utilisé** : [Ex: GPT-4o, modèle custom]
- **Données d'entrée** : [Type, volume, sensibilité]
- **Output** : [Texte, prédictions, recommandations]

## 2. Utilisateurs et impacts
- **Utilisateurs** : [Qui utilise ce système ?]
- **Décisions impactées** : [Le système aide/remplace quelles décisions ?]
- **Impact sur les personnes** : [Conséquences pour les utilisateurs finaux]

## 3. Risques identifiés

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| **Hallucinations** | Haute | Moyen | Validation humaine sur outputs critiques |
| **Biais** | Moyenne | Moyen | Tests sur populations diverses |
| **Fuite de données** | Basse | Élevé | PII filtering, opt-out training |
| **Dépendance** | Moyenne | Faible | Fallback manuel si IA indisponible |

## 4. Données sensibles
- [ ] **PII** : Le système traite-t-il des données personnelles ?
  - Si oui : Conformité RGPD (anonymisation, consentement, droit à l'oubli)
- [ ] **Propriété intellectuelle** : Données propriétaires ?
  - Si oui : Opt-out du training des modèles externes
- [ ] **Données confidentielles** : Secrets d'entreprise ?
  - Si oui : Utiliser des modèles self-hosted ou avec garanties contractuelles

## 5. Transparence
- [ ] Les utilisateurs savent-ils qu'ils interagissent avec une IA ?
- [ ] Peuvent-ils contester/corriger les décisions de l'IA ?
- [ ] Existe-t-il une documentation expliquant le fonctionnement ?

## 6. Validation et approbation
- **Reviewer** : [Nom du tech lead]
- **Approbateur** : [Nom du product owner ou manager]
- **Date** : [Date de validation]
```

**Règle** : Pas de PoC sans Impact Assessment validé.

#### 2. Responsible AI Toolkits

**Intégrez ces outils dans votre workflow** :

| Outil | Usage | Niveau |
|-------|-------|--------|
| **Fairlearn** (Microsoft) | Détection de biais dans modèles ML | Niveau 3 |
| **LangSmith** (LangChain) | Monitoring de prompts GenAI, détection d'hallucinations | Niveau 2-3 |
| **Guardrails AI** | Validation structurée des outputs LLM | Niveau 2-3 |
| **Microsoft Presidio** | Détection et anonymisation de PII | Niveau 2-3 |
| **Model Cards Toolkit** | Documentation standardisée des modèles | Niveau 2-3 |

**Quick win Niveau 2** : Utilisez Guardrails AI pour valider les outputs de vos LLM (format, absence de PII, toxicité).

#### 3. Checklist IA responsable pour équipe

**À implémenter avant la production** :

**Sécurité des données** :
- [ ] PII filtering automatique (Presidio ou équivalent)
- [ ] Opt-out du training pour tous les providers externes (OpenAI, Anthropic, etc.)
- [ ] Données sensibles stockées chiffrées (at rest + in transit)
- [ ] Accès aux données loggé (audit trail)

**Qualité et robustesse** :
- [ ] Tests automatisés sur 50-100 cas d'usage
- [ ] Détection d'hallucinations sur outputs critiques
- [ ] Fallback manuel si confiance de l'IA < seuil
- [ ] Monitoring de la qualité en production (dashboards)

**Transparence** :
- [ ] Les utilisateurs sont informés de l'usage de l'IA (disclaimer)
- [ ] Documentation expliquant le fonctionnement (pour non-techniciens)
- [ ] Mécanisme de feedback utilisateur (thumbs up/down minimum)

**Éthique** :
- [ ] Tests de biais sur populations diverses (si applicable)
- [ ] Revue des cas d'usage par une personne externe à l'équipe
- [ ] Plan d'action si biais détecté en production

**Voir aussi** :
- [Phase Secure](05-secure.md) pour la sécurité technique
- [Phase Govern](04-govern.md) pour la gouvernance organisationnelle
- [Phase Manage](06-manage.md) pour le monitoring opérationnel

## Checklist Plan (Équipe)

**Votre roadmap d'adoption IA en 6 mois** :

### Mois 1 : Évaluation et formation
- [ ] Cartographier les compétences de l'équipe (skill matrix)
- [ ] Auditer les assets de données disponibles
- [ ] Évaluer l'infrastructure technique actuelle
- [ ] Lancer le programme de formation (1-2 semaines)
- [ ] Créer les comptes cloud et API nécessaires

### Mois 2 : Priorisation et préparation
- [ ] Scorer tous les cas d'usage (faisabilité + valeur)
- [ ] Créer la matrice de priorisation (Faisabilité vs Valeur)
- [ ] Construire la roadmap 6 mois (2-3 projets max)
- [ ] Sélectionner le PoC priorité 1
- [ ] Rédiger le brief de PoC et l'Impact Assessment

### Mois 3 : Premier PoC
- [ ] Lancer le PoC #1 (2-4 semaines)
- [ ] Setup infrastructure et données
- [ ] Développer le MVP du PoC
- [ ] Itérer sur la qualité
- [ ] Démo + rétrospective + décision Go/No-Go

### Mois 4 : Production du premier projet OU pivot
- [ ] Si Go : Déployer en production (voir [Phase Ready](03-ready.md))
- [ ] Si Pivot : Lancer PoC #1 bis avec nouvelle approche
- [ ] Monitorer les résultats
- [ ] Documenter les learnings

### Mois 5 : Deuxième PoC
- [ ] Lancer le PoC #2
- [ ] Répéter le processus du PoC #1
- [ ] Partager les learnings du projet #1 avec l'équipe

### Mois 6 : Scaling et gouvernance
- [ ] 2 projets en production (objectif)
- [ ] Mettre en place les frameworks de gouvernance légers
- [ ] Planifier les certifications d'équipe (Mois 6-9)
- [ ] Rétrospective : Qu'avons-nous appris ? Quelle est notre nouvelle maturité ?

## Prochaine étape

→ [Phase 3 : Ready](03-ready.md) - Préparer l'environnement de production pour vos applications IA

**Note** : La phase Ready pour les équipes se concentre sur la mise en place d'une infrastructure robuste, la configuration des environnements de déploiement, et l'établissement de pipelines CI/CD pour l'IA.
