# Phase 1: Strategy - AI Strategy

## Overview

Structured planning: Use cases, Tech strategy, Data governance, Responsible AI.

## 1. Identify AI Use Cases

### Methodology

**Steps**:
1. Automation opportunities (repetitive processes, data-heavy tasks, frequent errors)
2. Customer feedback (surveys, support, NPS)
3. Internal assessment (departments, workflows, inefficiencies)
4. Industry research (benchmarks, best practices)
5. Define objectives + success metrics

**Example**:

| Use Case | Specific Objective | Metric |
|-------------|---------------------|----------|
| E-commerce chatbot | Improve customer satisfaction | Retention rate |
| Document processing | Reduce costs | Completion rate |
| Inventory management | Reduce costs | Stock duration |

## 2. Technology Strategy

### Consumption Models

| Model | When to Use | Approach |
|--------|---------------|----------|
| **SaaS** | Productivity, standard | Managed AI services, copilots |
| **PaaS** | RAG, AI agents, fine-tuning | Managed ML platforms |
| **IaaS** | Proprietary models, compliance, performance | GPU VMs, Kubernetes, self-hosted |

**Interoperability**: Standard protocols (MCP, REST APIs, JSON/Parquet)

> See [GLOSSARY.md](../GLOSSARY.md) for cloud/on-premise service equivalents

## 3. Data Strategy

**Governance**:
- Data classification (sensitivity)
- Access controls
- DLP (Data Loss Prevention) tools

**Lifecycle**:
- Collection (DB, APIs, IoT)
- ETL/ELT pipelines (orchestration, transformation)
- Retention (compliance + performance)

**Responsible Practices**:
- Source/usage traceability
- Quality and bias detection
- Compliance

> See [GLOSSARY.md](../GLOSSARY.md) for DLP and data pipeline tool options

## 4. Responsible AI

**Governance**:
- AI Center of Excellence
- Monitor tech/regulatory changes

**Principles** (aligned with [NIST AI RMF](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)):
1. Fairness
2. Reliability and safety
3. Privacy
4. Inclusivity
5. Transparency
6. Accountability

**Tools**: Fairlearn, AI Fairness 360, What-If Tool, SHAP, LIME

**Compliance**: EU AI Act, GDPR, CCPA/CPRA, sector-specific regulations

## Strategy Checklist

- [ ] Identify AI use cases (objectives + metrics)
- [ ] Define tech strategy (SaaS/PaaS/IaaS)
- [ ] Data strategy (governance, lifecycle)
- [ ] Responsible AI (center of excellence, compliance)

## Next Step

→ [Phase 2: Plan](02-plan.md) - Plan AI adoption
