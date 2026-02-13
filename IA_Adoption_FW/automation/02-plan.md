# Phase 2 : Plan - Planifier l'adoption IA

## Vue d'ensemble

Transformer stratégie en étapes actionnables : compétences, ressources, timeline.

## 1. Assess Team AI Skills (Level 3-4)

### Prérequis de maturité

**STOP - Validez avant d'adopter Automation** :
- ✅ Équipe Niveau 2+ (voir [SKILLS.md](../SKILLS.md))
- ✅ 6-12 mois expérience Delivery Framework
- ✅ 1+ projet IA en production

**Évaluation équipe** : Consultez [SKILLS.md](../SKILLS.md) pour :
- Définition Niveaux 3-4 (target Automation)
- Skills Matrix (objectif : Niveau 3-4)
- Validation passage Delivery → Automation

**Critères** :
1. Skills Matrix équipe (objectif : Niveau 3-4)
2. Tous membres ≥ Niveau 2
3. 50%+ équipe Niveau 3
4. 1+ membre Niveau 4 (Tech Lead)

**Évaluation additionnelle** :
- Assets données (sources, qualité, accessibilité)
- Infrastructure tech (compute, storage, réseau, sécurité)

## 2. Acquire AI Skills

### Formation Niveau 3 → 4

**Parcours complet** : Consultez [TRAINING.md](../TRAINING.md) section 5 pour :

**Concepts** :
- ML Avancé & Fine-Tuning LLM (LoRA, QLoRA, RLHF)
- Infrastructure IA (multi-region, GPU optimization)
- MLOps Complet (CI/CD/CT, A/B testing, canary)
- IA Responsable (fairness, audits, compliance)
- Architecture & Scale (patterns, performance)

**Outils** :
- Découverte : Kubernetes, Terraform, MLflow, Weights & Biases
- Avancée : GPU clusters (A100/H100), DeepSpeed, Kubeflow, Prometheus/Grafana

**Validation** : Fine-tuning + production multi-region + ROI positif

**Certifications recommandées** :
- AWS/GCP/Azure ML Advanced
- Kubernetes Application Developer (CKAD)

**Recrutement** (si nécessaire) : ML Engineers, Data Scientists, MLOps Engineers, AI Ethics Specialists

**Partenariats** : Consultants IA, intégrateurs système, partenaires cloud

## 3. Accéder ressources IA

| Type | Accès | Coûts |
|------|-------|-------|
| **SaaS AI** | Subscription/Licensing | Licenses utilisateurs |
| **PaaS AI** | Compte cloud | Usage (tokens, compute, storage) |
| **IaaS AI** | Compte cloud | Infrastructure (VM, GPU) |

**Services clés** :
- **AWS** : SageMaker, Bedrock, Rekognition
- **GCP** : Vertex AI, Generative AI Studio
- **Azure** : AI Foundry, OpenAI Service

## 4. Prioriser cas d'usage

**Critères** :
- Impact métier (ROI, valeur)
- Faisabilité technique (maturité, données)
- Risque (confidentialité, compliance)
- Timeline (quick wins vs long-term)

**Matrice** : Impact × Faisabilité → Prioriser High/High en premier

## 5. PoC

**Durée** : 1-3 mois
**Objectif** : Valider faisabilité technique + business value
**Scope** : Dataset limité, environnement isolé, métriques claires

## Checklist Plan

- [ ] Évaluer maturité (compétences, données, infra)
- [ ] Plan développement compétences
- [ ] Accès ressources cloud
- [ ] Prioriser cas d'usage (matrice impact/faisabilité)
- [ ] Lancer PoC (1-3 mois)

## Prochaine étape

→ [Phase 3 : Ready](03-ready.md) - Préparer environnement IA
