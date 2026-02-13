# Phase 6 : Manage - Gestion opérationnelle IA

## Vue d'ensemble

La gestion opérationnelle IA couvre le cycle de vie complet : déploiement, monitoring, optimisation et continuité. Cette phase intègre MLOps/LLMOps, gestion des coûts (FinOps), qualité des données et résilience pour assurer des opérations IA fiables et scalables.

## 1. Gérer les opérations (MLOps / LLMOps)

### Pipeline MLOps complet

```
┌─────────────────────────────────────────────────────────────────────┐
│                         DEVELOPMENT PHASE                            │
└─────────────────────────────────────────────────────────────────────┘
          ↓
[Data Preparation] → Clean, transform, validate datasets
          ↓
[Feature Engineering] → Extract, select features
          ↓
[Model Development] → Train, tune hyperparameters
          ↓
[Model Evaluation] → Validate metrics, fairness, bias
          ↓
┌─────────────────────────────────────────────────────────────────────┐
│                          DEPLOYMENT PHASE                            │
└─────────────────────────────────────────────────────────────────────┘
          ↓
[Model Registry] → Version, tag, approve model
          ↓
[CI/CD Pipeline] → Automated testing, deployment
          ↓
[Staging Deploy] → Test environment validation
          ↓
[Production Deploy] → Gradual rollout (canary/blue-green)
          ↓
┌─────────────────────────────────────────────────────────────────────┐
│                         MONITORING PHASE                             │
└─────────────────────────────────────────────────────────────────────┘
          ↓
[Performance Monitoring] → Accuracy, latency, throughput
          ↓
[Data Drift Detection] → Input distribution changes
          ↓
[Model Drift Detection] → Output quality degradation
          ↓
[Alerting & Incident Response] → Automated alerts, escalation
          ↓
┌─────────────────────────────────────────────────────────────────────┐
│                      MAINTENANCE PHASE                               │
└─────────────────────────────────────────────────────────────────────┘
          ↓
[Retraining Trigger] → Scheduled or drift-based
          ↓
[Model Update] → New version deployment
          ↓
[Feedback Loop] → Continuous improvement
```

### Différences LLMOps vs MLOps

| Aspect | MLOps (ML traditionnel) | LLMOps (GenAI / LLM) |
|--------|-------------------------|----------------------|
| **Training** | Training from scratch fréquent | Fine-tuning rare, pre-trained majoritaire |
| **Data** | Datasets structurés, labellisés | Prompts, context, unstructured text |
| **Versioning** | Model weights + hyperparams | Model + prompts + RAG config |
| **Monitoring** | Accuracy, precision, recall | Hallucinations, toxicity, latency, token usage |
| **Cost drivers** | Compute training | Inference tokens (API calls) |
| **Deployment** | Model artifacts (MB-GB) | API endpoints ou model hosting (GB-TB) |
| **Testing** | Test datasets, unit tests | Prompt testing, response validation |
| **Iteration** | Retrain périodique | Prompt engineering, RAG tuning |

### Outils MLOps/LLMOps

**Plateformes intégrées** :
- **Cloud-native** : Voir [GLOSSARY.md](GLOSSARY.md) pour ML Platforms (SageMaker, Vertex AI, Azure ML)
- **Open-source** : MLflow, Kubeflow, Metaflow

**Composants spécialisés** :
- **Experiment tracking** : MLflow, Weights & Biases, Neptune.ai
- **Model registry** : Services cloud-native, MLflow Registry
- **Feature stores** : Feast, Tecton, services cloud
- **Monitoring** : Arize, WhyLabs, Evidently AI
- **Prompt management (LLMOps)** : LangSmith, PromptLayer, Helicone

## 2. Gérer les déploiements

### Stratégies de déploiement pour modèles IA

| Stratégie | Description | Avantages | Inconvénients | Use case |
|-----------|-------------|-----------|---------------|----------|
| **Blue/Green** | Deux environnements (bleu=actuel, vert=nouveau), switch instantané | Rollback rapide, zéro downtime | Coût 2x infrastructure | Déploiements majeurs |
| **Canary** | Rollout graduel : 5% → 25% → 50% → 100% | Risque limité, validation progressive | Complexe, monitoring requis | Production haute criticité |
| **A/B Testing** | 2+ modèles en parallèle, compare métriques business | Validation data-driven | Durée longue, trafic split | Optimisation performance |
| **Shadow** | Nouveau modèle en parallèle, sans impact utilisateur | Zéro risque production | Double coût inference | Validation pré-production |
| **Rolling Update** | Remplacement progressif instances | Pas de downtime | Lent, versions mixtes temporaires | Updates mineurs |

### CI/CD pour IA

**Pipeline CI/CD type** :

| Étape | Objectif | Outils | Critères de succès |
|-------|----------|--------|-------------------|
| **Code commit** | Trigger pipeline | Git (GitHub, GitLab, Bitbucket) | - |
| **Linting & formatting** | Qualité code | Pylint, Black, Flake8 | Pas d'erreurs |
| **Unit tests** | Fonctions individuelles | pytest, unittest | 100% pass |
| **Integration tests** | Pipeline complet | pytest, custom scripts | 100% pass |
| **Model training** | Entraînement automatisé | ML platform, containers | Métriques > seuils |
| **Model validation** | Performance + fairness | Custom validation scripts | Accuracy, bias checks pass |
| **Security scan** | Vulnérabilités code/dépendances | Snyk, Dependabot, Bandit | Pas de vulns critiques |
| **Model registration** | Versioning | Model registry | Version tagged |
| **Staging deploy** | Déploiement test | IaC (Terraform, CloudFormation) | Deployment success |
| **Smoke tests** | Validation basique staging | API tests, integration | Endpoints responsive |
| **Production deploy** | Déploiement production | Canary/blue-green | Gradual rollout success |
| **Post-deploy monitoring** | Validation continue | Monitoring dashboards | Métriques stables |

### Rollback et versioning

**Stratégie de versioning** :
- **Semantic versioning** : v1.2.3 (major.minor.patch)
- **Tagging** : Production, staging, experimental
- **Metadata** : Training date, dataset version, hyperparams, metrics
- **Lineage** : Data provenance, code commit, dependencies

**Procédure de rollback** :
1. Détection problème (monitoring alerte)
2. Validation besoin rollback (pas de fix rapide possible)
3. Identifier version stable précédente (registry)
4. Rollback automatisé (redéploiement version N-1)
5. Validation post-rollback (smoke tests)
6. Incident post-mortem (root cause, prévention)

**SLA de rollback** :
- Rollback automatisé : < 5 minutes
- Rollback manuel : < 30 minutes

## 3. Gérer les modèles

### Model Registry et versioning

**Éléments à versionner** :
- **Model artifacts** : Weights, architecture
- **Code** : Training scripts, preprocessing
- **Configuration** : Hyperparams, feature config
- **Datasets** : Training data version/hash
- **Metrics** : Performance, fairness, bias scores
- **Lineage** : Data sources, transformations appliquées

**Metadata minimales par modèle** :
```yaml
model_id: customer-churn-v2.3.1
version: 2.3.1
stage: production
created_at: 2024-03-15T10:30:00Z
framework: tensorflow 2.14
metrics:
  accuracy: 0.89
  precision: 0.87
  recall: 0.91
  fairness_score: 0.94
dataset_version: training-2024-Q1-v3
trained_by: ml-engineer@company.com
approved_by: ai-ethics-committee
deployment_date: 2024-03-20T14:00:00Z
```

### Monitoring performance des modèles

**Métriques clés par type de modèle** :

**ML Classification** :
- Accuracy, Precision, Recall, F1-Score
- AUC-ROC
- Confusion matrix

**ML Regression** :
- MAE (Mean Absolute Error)
- RMSE (Root Mean Squared Error)
- R² score

**GenAI / LLM** :
- Latency (P50, P95, P99)
- Token usage (input/output)
- Hallucination rate
- Toxicity score
- User satisfaction (thumbs up/down)

**Métriques opérationnelles (tous types)** :
- Requests per second (RPS)
- Error rate (%)
- Availability (uptime %)
- Cost per inference

### Drift Detection

**Types de drift** :

| Type | Description | Impact | Détection | Action |
|------|-------------|--------|-----------|--------|
| **Data Drift** | Distribution inputs change | Prédictions moins fiables | Statistical tests (KS, PSI) | Retraining avec nouvelles données |
| **Concept Drift** | Relation input/output change | Accuracy dégradée | Performance monitoring | Retraining + feature engineering |
| **Prediction Drift** | Distribution outputs change | Business impact | Output distribution analysis | Investigation root cause |

**Seuils d'alerte recommandés** :
- **Data drift** : PSI > 0.1 (warning), > 0.2 (action)
- **Accuracy drop** : > 5% (warning), > 10% (action)
- **Latency increase** : > 20% (warning), > 50% (action)

**Fréquence de vérification** :
- Real-time models : Quotidienne
- Batch models : Hebdomadaire
- Low-risk models : Mensuelle

### Dashboard de monitoring modèles

**KPIs à afficher en temps réel** :
1. **Performance** : Accuracy, latency, throughput
2. **Drift** : Data drift score, concept drift detection
3. **Disponibilité** : Uptime, error rate
4. **Coûts** : Cost per inference, daily spend
5. **Usage** : Requests/hour, active users
6. **Alerts** : Open incidents, recent warnings

## 4. Gérer les coûts (FinOps pour IA)

### Framework FinOps IA

**Principes FinOps appliqués à l'IA** :
1. **Visibility** : Comprendre où vont les coûts IA
2. **Optimization** : Réduire coûts sans sacrifier performance
3. **Accountability** : Responsabilité par équipe/projet
4. **Forecasting** : Prédire croissance des coûts

### Principaux drivers de coûts IA

| Composant | Coût relatif | Facteurs clés | Optimisation possible |
|-----------|--------------|---------------|----------------------|
| **Compute (training)** | $$$ | GPU/TPU hours, taille modèle | Spot instances, efficient architectures |
| **Inference (API)** | $$$$ | Tokens, requests/sec, latency SLA | Caching, batch inference, smaller models |
| **Storage** | $ | Datasets size, retention | Tiering (hot/cold), compression |
| **Data transfer** | $$ | Cross-region, egress | Co-location, CDN |
| **Model fine-tuning** | $$$ | GPU hours, frequency | Transfer learning, LoRA |

### Stratégies d'optimisation des coûts

| Stratégie | Description | Économie estimée | Complexité |
|-----------|-------------|------------------|------------|
| **Spot/Preemptible instances** | Utiliser compute à prix réduit pour training | 60-80% | Faible |
| **Auto-scaling** | Scale compute selon demande | 30-50% | Moyenne |
| **Model caching** | Cache réponses fréquentes (LLM) | 20-40% | Faible |
| **Batch inference** | Grouper prédictions vs real-time | 40-60% | Moyenne |
| **Model compression** | Quantization, pruning, distillation | 30-70% | Élevée |
| **Right-sizing** | Adapter instance size aux besoins | 20-40% | Faible |
| **Reserved capacity** | Engagement long-terme pour discount | 30-50% | Faible |
| **Storage tiering** | Hot/cold/archive selon accès | 50-80% | Faible |
| **Serverless inference** | Pay-per-use vs always-on | Variable | Moyenne |
| **Smaller models** | Utiliser modèles moins chers quand possible | 50-90% | Moyenne |

### Exemple de cost breakdown

**Application GenAI avec RAG (mensuel)** :
```
Total : $15,000/mois

Inference (LLM API)     : $8,000  (53%) → Tokens input/output
Vector DB               : $2,500  (17%) → Storage + queries
Compute (embeddings)    : $2,000  (13%) → Batch processing
Storage (datasets)      : $1,000  ( 7%) → S3/Blob storage
Networking              : $800    ( 5%) → Data transfer
Monitoring & logs       : $700    ( 5%) → Observability
```

**Actions d'optimisation identifiées** :
1. Caching réponses fréquentes → -30% inference cost
2. Batch embeddings processing → -40% compute cost
3. Storage lifecycle policy → -60% storage cost
4. **Économie totale estimée** : $3,200/mois (21%)

### Budgets et alertes

**Configuration recommandée** :
- **Budget mensuel** : Défini par projet/équipe
- **Alertes** :
  - 50% budget atteint → Notification
  - 80% budget atteint → Revue obligatoire
  - 100% budget atteint → Blocage optionnel
- **Forecasting** : Projection à 3 mois basée sur trends

Voir [GLOSSARY.md](GLOSSARY.md) pour services de cost management par cloud.

## 5. Gérer les données

### Pipeline de données pour IA

```
┌─────────────────────────────────────────────────────────┐
│                    DATA INGESTION                        │
│  Sources: Databases, APIs, IoT, Files, Streaming        │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│                DATA VALIDATION & QUALITY                 │
│  - Schema validation                                     │
│  - Completeness checks                                   │
│  - Anomaly detection                                     │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│              DATA TRANSFORMATION (ETL/ELT)               │
│  - Cleaning, normalization                              │
│  - Feature engineering                                   │
│  - Aggregations                                          │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│                   DATA STORAGE                           │
│  - Raw data (data lake)                                 │
│  - Processed data (feature store)                        │
│  - Versioned datasets                                    │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│                 DATA GOVERNANCE                          │
│  - Lineage tracking                                      │
│  - Access controls                                       │
│  - Audit logging                                         │
└─────────────────────────────────────────────────────────┘
```

Voir [Phase Strategy](01-strategy.md) pour détails sur stratégie de données.

### Data Quality pour IA

**Dimensions de qualité** :

| Dimension | Description | Validation | Impact si dégradé |
|-----------|-------------|------------|------------------|
| **Completeness** | Données complètes, pas de valeurs manquantes | % null values | Biais, accuracy réduite |
| **Accuracy** | Données correctes vs réalité | Cross-validation, samples | Prédictions incorrectes |
| **Consistency** | Cohérence entre sources | Duplicate detection, referential integrity | Confusion modèle |
| **Timeliness** | Données à jour | Freshness checks, staleness detection | Drift, relevance réduite |
| **Validity** | Respect des formats/contraintes | Schema validation, range checks | Erreurs training/inference |
| **Uniqueness** | Pas de doublons | Duplicate detection | Biais, overfitting |

**Tests automatisés recommandés** :
- Schema validation (structure)
- Range checks (valeurs attendues)
- Distribution tests (detect shift)
- Referential integrity
- Custom business rules

### Data Lineage et Audit

**Traçabilité complète** :
```
Source Data → Transformations → Features → Model Training → Predictions
     ↓              ↓               ↓            ↓              ↓
  [Logged]      [Logged]        [Logged]     [Logged]       [Logged]
```

**Informations à tracker** :
- Source datasets (provenance)
- Transformations appliquées (code version)
- Features utilisées (feature store version)
- Modèle entraîné (model registry version)
- Prédictions générées (inference logs)

**Bénéfices** :
- Debugging (identifier source d'erreurs)
- Compliance (GDPR data provenance)
- Reproducibility (recréer résultats)
- Trust (expliquabilité)

## 6. Assurer la continuité

### Backup des modèles et données

**Stratégie de backup 3-2-1** :
- **3** copies des données
- **2** types de media différents
- **1** copie off-site

**Assets critiques à backup** :
- **Modèles** : Artifacts, configs, metadata
- **Datasets** : Training data, validation sets
- **Code** : Training scripts, inference code
- **Infrastructure** : IaC (Terraform, CloudFormation)
- **Configurations** : Pipelines, monitoring, alertes

**Fréquence de backup** :
- Modèles production : Chaque version (immédiat)
- Datasets critiques : Quotidien
- Datasets non-critiques : Hebdomadaire
- Code : Chaque commit (Git)

### Disaster Recovery

**Scénarios de risque** :

| Scénario | Probabilité | Impact | RTO | RPO | Stratégie |
|----------|-------------|--------|-----|-----|-----------|
| **Panne région cloud** | Faible | Élevé | 4h | 1h | Multi-région active-passive |
| **Corruption modèle** | Moyen | Élevé | 30min | 0 | Model registry + rollback |
| **Data loss** | Faible | Critique | 2h | 24h | Backups géo-répliqués |
| **Compromission sécurité** | Faible | Critique | 1h | 0 | Isolation, rebuild from scratch |
| **Erreur humaine (delete)** | Moyen | Moyen | 1h | 24h | Soft delete, retention policies |

**RTO** : Recovery Time Objective (temps maximum acceptable de downtime)
**RPO** : Recovery Point Objective (perte de données maximum acceptable)

### Plan de continuité IA

**Checklist de préparation** :
- [ ] Documentation complète architecture et procédures
- [ ] Backups automatisés et testés (recovery test trimestriel)
- [ ] Multi-région configurée pour workloads critiques
- [ ] Runbooks pour incidents courants
- [ ] Équipe on-call avec escalation path
- [ ] Communication plan (stakeholders, users)
- [ ] Contrats SLA avec fournisseurs cloud

**Test de DR (semestriel)** :
1. Simuler panne région principale
2. Activer failover vers région secondaire
3. Valider fonctionnement complet
4. Mesurer RTO/RPO effectifs
5. Documenter learnings, améliorer plan

## Checklist Manage

### 🚀 Startup
- [ ] Établir pipeline MLOps basique (train → deploy → monitor)
- [ ] Configurer model registry et versioning
- [ ] Mettre en place monitoring performance et coûts
- [ ] Définir stratégie backup modèles

### 🏢 Enterprise
- [ ] Implémenter pipeline MLOps/LLMOps complet avec CI/CD
- [ ] Déployer stratégies de déploiement avancées (canary, blue/green)
- [ ] Configurer drift detection automatisée avec alertes
- [ ] Établir framework FinOps avec budgets et optimisation continue
- [ ] Mettre en place data quality monitoring et lineage tracking
- [ ] Définir et tester plan de disaster recovery (RTO/RPO)
- [ ] Déployer architecture multi-région pour haute disponibilité

## Conclusion

Ce framework d'adoption IA cloud-agnostic fournit une structure complète pour adopter l'IA de manière responsable, sécurisée et scalable. Les 6 phases couvrent :

1. **Strategy** : Définir votre vision et cas d'usage
2. **Plan** : Développer les capacités nécessaires
3. **Ready** : Préparer l'infrastructure
4. **Govern** : Établir la gouvernance et conformité
5. **Secure** : Protéger contre les menaces spécifiques IA
6. **Manage** : Opérer et optimiser en continu

### Prochaines étapes pratiques

**Pour démarrer** :
1. Évaluer votre niveau de maturité IA actuel (voir [grille Phase 2](02-plan.md))
2. Sélectionner la checklist adaptée (Startup ou Enterprise)
3. Prioriser les items critiques pour votre contexte
4. Commencer par la Phase Strategy pour définir votre vision

**Pour approfondir** :
- Consulter [GLOSSARY.md](GLOSSARY.md) pour équivalences cloud et concepts
- Référencer les frameworks externes (NIST AI RMF, MITRE ATLAS, OWASP)
- Adapter les templates et matrices à vos besoins spécifiques
- Itérer et améliorer en continu basé sur les learnings

**Ressources externes clés** :
- [NIST AI RMF](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)
- [MITRE ATLAS](https://atlas.mitre.org/)
- [OWASP Generative AI](https://genai.owasp.org/)
- Documentation fournisseurs cloud (AWS, GCP, Azure)
