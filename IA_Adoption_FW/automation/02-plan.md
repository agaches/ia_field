# Phase 2: Plan - Plan AI Adoption

## Overview

Transform strategy into actionable steps: skills, resources, timeline.

## 1. Assess Team AI Skills (Level 3-4)

### Maturity Prerequisites

**STOP - Validate before adopting Automation**:
- ✅ Team Level 2+ (see [SKILLS.md](../SKILLS.md))
- ✅ 6-12 months Delivery Framework experience
- ✅ 1+ AI project in production

**Team evaluation**: Consult [SKILLS.md](../SKILLS.md) for:
- Definition of Levels 3-4 (Automation target)
- Skills Matrix (goal: Level 3-4)
- Delivery → Automation transition validation

**Criteria**:
1. Team Skills Matrix (goal: Level 3-4)
2. All members ≥ Level 2
3. 50%+ team at Level 3
4. 1+ member at Level 4 (Tech Lead)

**Additional assessment**:
- Data assets (sources, quality, accessibility)
- Tech infrastructure (compute, storage, network, security)

## 2. Acquire AI Skills

### Level 3 → 4 Training

**Complete path**: Consult [TRAINING.md](../TRAINING.md) section 5 for:

**Concepts**:
- Advanced ML & LLM Fine-Tuning (LoRA, QLoRA, RLHF)
- AI Infrastructure (multi-region, GPU optimization)
- Complete MLOps (CI/CD/CT, A/B testing, canary)
- Responsible AI (fairness, audits, compliance)
- Architecture & Scale (patterns, performance)

**Tools**:
- Discovery: Kubernetes, Terraform, MLflow, Weights & Biases
- Advanced: GPU clusters (A100/H100), DeepSpeed, Kubeflow, Prometheus/Grafana

**Validation**: Fine-tuning + multi-region production + positive ROI

**Recommended certifications**:
- AWS/GCP/Azure ML Advanced
- Kubernetes Application Developer (CKAD)

**Recruitment** (if needed): ML Engineers, Data Scientists, MLOps Engineers, AI Ethics Specialists

**Partnerships**: AI consultants, system integrators, cloud partners

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
