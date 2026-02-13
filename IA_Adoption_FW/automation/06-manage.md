# Phase 6 : Manage - MLOps/LLMOps Complet

## Vue d'ensemble

Gestion complète : opérations, déploiements, modèles, coûts, données, continuité.

## 1. Gérer opérations

### Monitoring

**Métriques infrastructure** :
- Latence (p50, p95, p99)
- Throughput (requests/sec)
- Disponibilité (uptime %)
- Utilisation ressources (CPU, GPU, mémoire)

**Métriques ML** :
- Performance modèle (accuracy, F1, etc.)
- Drift (data drift, concept drift)
- Biais/équité
- Coût par inférence

**Outils** : Prometheus + Grafana, CloudWatch/Stackdriver/Azure Monitor, ML-specific (Weights & Biases, MLflow)

### Alerting

**Seuils critiques** :
- Latence >500ms (p95)
- Erreur rate >1%
- Drift détecté (>10% déviation)
- Coûts dépassent budget (+20%)

**Escalation** : Alertes → On-call → Incident response

## 2. Gérer déploiements

### CI/CD ML

**Pipeline** :
1. Code commit → Tests unitaires
2. Model training → Validation performance
3. Staging deployment → Tests intégration
4. Production deployment → Canary/Blue-green
5. Monitoring post-deploy

**Outils** : GitHub Actions/GitLab CI, Jenkins, Kubeflow Pipelines, SageMaker Pipelines

### Stratégies déploiement

| Stratégie | Usage | Risque |
|-----------|-------|--------|
| **Canary** | Déploiement progressif (5% → 50% → 100%) | Faible |
| **Blue-Green** | Bascule instantanée avec rollback rapide | Moyen |
| **A/B Testing** | Comparaison versions simultanées | Faible |

## 3. Gérer modèles

### Model Registry

**Versioning** :
- Modèles (v1, v2, v3...)
- Datasets d'entraînement
- Hyperparamètres
- Métriques performance

**Outils** : MLflow Model Registry, SageMaker Model Registry, Vertex AI Model Registry

### Drift Detection

**Types** :
- **Data drift** : Distribution données change
- **Concept drift** : Relation input/output change

**Actions** :
- Alertes automatiques
- Retraining déclenché
- Validation nouveau modèle

**Outils** : Evidently AI, NannyML, custom solutions

### Retraining

**Triggers** :
- Drift détecté
- Performance dégradée (<seuil)
- Schedule (hebdo/mensuel)
- Nouvelles données disponibles

**Process** : Automated pipeline → Validation → Approval gate → Deployment

## 4. Gérer coûts

### Optimisation

**Compute** :
- Auto-scaling (scale to zero si possible)
- Spot/Preemptible instances
- Batch inference vs real-time

**Modèles** :
- Model compression (quantization, pruning)
- Caching résultats fréquents
- Modèles plus petits si acceptable

**Données** :
- Tiering storage (hot/cold/archive)
- Compression
- Rétention policies

### Tracking

**Métriques** :
- Coût par inférence
- Coût par utilisateur
- Coût par cas d'usage
- Trend mensuel

**Budgets & Alertes** : Quotas, alertes si dépassement (+10%, +25%, +50%)

## 5. Gérer données

### Data Pipeline

**ETL/ELT** :
- Ingestion (batch/streaming)
- Transformation (cleaning, feature engineering)
- Validation qualité
- Storage

**Outils** : Airflow, dbt, Spark, cloud services (Glue, Dataflow, Data Factory)

### Data Quality

**Checks automatiques** :
- Complétude (% null)
- Exactitude (validation business rules)
- Consistance (types, formats)
- Freshness (latence données)

**Actions** : Alertes, blocage pipeline si qualité <seuil

### Data Lineage

**Traçabilité** :
- Source données → Transformations → Modèle → Prédictions
- Impact analysis (si source change, quel modèle affecté ?)

**Outils** : OpenMetadata, DataHub, AWS Glue Data Catalog

## 6. Continuité

### Disaster Recovery

**Backup** :
- Modèles (toutes versions)
- Données (hot + archives)
- Configurations (IaC)

**RTO/RPO** :
- RTO : <4h (restauration service)
- RPO : <1h (perte données max)

**Tests** : DR drills trimestriels

### Business Continuity

**Failover** :
- Multi-région (production critique)
- Load balancing cross-region
- Auto-failover si région down

**Degraded Mode** :
- Modèle simplifié si primaire down
- Caching résultats
- Human fallback

## Checklist Manage

- [ ] Monitoring complet (infra + ML + coûts)
- [ ] CI/CD ML pipeline
- [ ] Model Registry + versioning
- [ ] Drift detection + retraining automatique
- [ ] Optimisation coûts
- [ ] Data pipeline + quality checks
- [ ] DR + BC (RTO/RPO définis)

## Conclusion

MLOps/LLMOps complet = Opérations production robustes, scalables, cost-effective.

**Focus** : Automatisation maximum, monitoring proactif, amélioration continue.
