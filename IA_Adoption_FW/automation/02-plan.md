# Phase 2: Plan - Plan AI Adoption

## Assess AI skills

### Maturity prerequisites

**STOP - Validate before adopting Automation**:
- ✅ Team Level 2+ (see [SKILLS.md](../SKILLS.md))
- ✅ 6-12 months Delivery Framework experience
- ✅ 1+ AI project in production

### Team evaluation

**Criteria**:
1. Team Skills Matrix (goal: Level 3-4)
2. All members ≥ Level 2
3. 50%+ team at Level 3
4. 1+ member at Level 4 (Tech Lead)

**Additional assessment**:
- Data assets (sources, quality, accessibility)
- Tech infrastructure (compute, storage, network, security)

> Consult [SKILLS.md](../SKILLS.md) for Levels 3-4 definition and Automation transition validation

## Acquire AI skills

### Level 3 → 4 training path

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

> See [TRAINING.md](../TRAINING.md) section 5 for complete training path

### Options

**Certifications**: AWS/GCP/Azure ML Advanced, Kubernetes Application Developer (CKAD)

**Recruitment**: ML Engineers, Data Scientists, MLOps Engineers, AI Ethics Specialists

**Partnerships**: AI consultants, system integrators, cloud partners

## Access AI resources

| Type | Access | Costs |
|------|-------|-------|
| **SaaS AI** | Subscription/Licensing | User licenses |
| **PaaS AI** | Cloud/platform account | Usage (tokens, compute, storage) |
| **IaaS AI** | Infrastructure (cloud/on-premise) | Infrastructure (VM, GPU) |

> See [GLOSSARY.md](../GLOSSARY.md) for platform-specific AI services and self-hosted alternatives

## Prioritize AI use cases

**Criteria**:
- Business impact (ROI, value)
- Technical feasibility (maturity, data)
- Risk (privacy, compliance)
- Timeline (quick wins vs long-term)

**Matrix**: Impact × Feasibility → Prioritize High/High first

## Create AI proof of concepts

**Duration**: 1-3 months
**Objective**: Validate technical feasibility + business value
**Scope**: Limited dataset, isolated environment, clear metrics

## Implement responsible AI

Establish responsible AI practices from Phase 1 strategy during PoC:
- Apply fairness and bias monitoring
- Implement human oversight requirements
- Document data usage and model decisions
- Validate compliance with regulations

> Reference [Phase 1: Responsible AI strategy](01-strategy.md#develop-a-responsible-ai-strategy)

## Next Step

→ [Phase 3: Ready](03-ready.md) - Prepare AI environment
