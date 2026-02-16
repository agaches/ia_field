# Phase 1: Prepare

> **Goal**: Business case validation, architecture design, organizational readiness
> **Time**: 4-6 weeks
> **Output**: Approved business case + Technical architecture + Readiness validated

---

## 1. Identify Production AI Use Cases

### Business Use Case Evaluation

📋 **Tool**: [Production AI Use Case Matrix](../templates/automation/production-ai-use-case-matrix.md)
Evaluate potential use cases on 4 dimensions:

| Use Case | Business Impact | Technical Feasibility | Regulatory Risk | ROI Score | Priority |
|----------|-----------------|----------------------|-----------------|-----------|----------|
| Customer chatbot | High (CX, retention) | High (RAG proven) | Medium (GDPR) | **85** | ⭐ #1 |
| Document processing | Medium (efficiency) | High (OCR + LLM) | Low | **70** | ⭐ #2 |
| Fraud detection | High (revenue protection) | Medium (ML model) | High (compliance) | **65** | ⭐ #3 |
| Content generation API | Medium (enabler) | High (LLM API) | Medium (moderation) | **60** | ⬜ |

**Selection criteria**:
- **Business Impact**: Revenue, cost savings, customer satisfaction (1-5)
- **Technical Feasibility**: Team skills, data availability, proven patterns (1-5)
- **Regulatory Risk**: Compliance complexity, audit requirements (1=Low, 5=High, inverse score)
- **ROI Score**: (Impact × Feasibility × (6-Risk)) - Prioritize ≥60

**Red flags** (do not proceed):
- ❌ Use case not validated with actual users/customers
- ❌ No clear success metrics or ROI projection
- ❌ Data not available or poor quality
- ❌ Team lacks required Level 3-4 skills
- ❌ Regulatory requirements unclear or prohibitive

---

## 2. Define Technology Strategy

### AI Consumption Models

📋 **Tool**: [Technology Stack Decision Matrix](../templates/automation/technology-stack-decision-matrix.md)
| Model | When to Use | Examples | Pros | Cons |
|-------|-------------|----------|------|------|
| **SaaS** | Standard AI features, rapid deployment | OpenAI API, Azure OpenAI, Claude API | Fast, managed, scalable | Less control, vendor lock-in, data residency |
| **PaaS** | Custom AI (RAG, fine-tuning, agents) | AWS Bedrock, GCP Vertex AI, Azure ML | Flexible, managed infra, multi-model | More complex, higher cost |
| **IaaS/Self-hosted** | Full control, compliance, proprietary models | GPU VMs, Kubernetes + vLLM/Ollama | Full control, data stays in-house | High complexity, ops burden, expertise required |

**Decision factors**:
- **Data sensitivity**: High → PaaS (VPC) or IaaS
- **Compliance**: Strict → IaaS (on-prem or private cloud)
- **Customization**: High → PaaS (fine-tuning) or IaaS (custom models)
- **Team expertise**: Limited → SaaS, Strong → PaaS/IaaS
- **Budget**: Tight → SaaS, Flexible → PaaS/IaaS

**Hybrid approach** (common):
- SaaS for general AI capabilities (OpenAI, Claude)
- PaaS for custom RAG and fine-tuned models
- IaaS for proprietary models or high-compliance scenarios

---

## 3. Design AI Architecture

📋 **Tool**: [Architecture Decision Record (ADR) Template](../templates/automation/architecture-decision-record.md)

### Key Architecture Decisions

Document each major decision using ADRs:

**Example ADR topics**:
1. **Model selection**: Which LLM(s) to use? (GPT-4, Claude, Llama, Mistral)
2. **RAG architecture**: Vector DB choice (Pinecone, Weaviate, pgvector), embedding model
3. **Orchestration**: LangChain, LlamaIndex, custom framework
4. **Serving infrastructure**: Kubernetes, serverless, managed services
5. **Monitoring**: Observability stack (Datadog, Grafana, custom)
6. **Data pipeline**: ETL tools, data versioning (DVC, MLflow)

**Architecture patterns**:
- **RAG (Retrieval-Augmented Generation)**: External knowledge base + LLM
- **Fine-tuning**: Custom model on domain-specific data
- **Multi-agent systems**: Specialized agents with orchestration
- **Hybrid AI/Rules**: AI for decisions, rules for guardrails

---

### Reference Architecture: Production Chatbot (RAG)

```
┌─────────────┐
│   Users     │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│   API Gateway (Auth, Rate Limit)    │
└──────────────┬──────────────────────┘
               │
               ▼
┌──────────────────────────────────────┐
│   Orchestration Layer (LangChain)    │
│   ├── Prompt templates                │
│   ├── Conversation memory             │
│   └── Tool/function calling           │
└───────┬────────────────┬─────────────┘
        │                │
        ▼                ▼
┌───────────────┐  ┌─────────────────┐
│  Vector DB    │  │   LLM API       │
│  (Retrieval)  │  │   (Generation)  │
└───────────────┘  └─────────────────┘
        │
        ▼
┌───────────────┐
│  Data Store   │
│  (Documents)  │
└───────────────┘

Supporting infrastructure:
- Monitoring: Metrics, logs, traces
- Security: WAF, DLP, guardrails
- MLOps: Model registry, versioning
- Backup: DR, data replication
```

**Critical components**:
- **API Gateway**: Authentication (OAuth, API keys), rate limiting, DDoS protection
- **Orchestration**: Prompt management, memory, agent logic
- **Vector DB**: Embedding storage and similarity search
- **LLM API**: Model serving (managed or self-hosted)
- **Guardrails**: Input/output validation, content moderation
- **Monitoring**: Latency, errors, cost, quality metrics

---

## 4. Assess Organizational Readiness

### Team Composition Validation

📋 **Tool**: [Organization AI Readiness Assessment](../templates/automation/organization-readiness-assessment.md)
**Required team skills** (Levels 3-4):

| Role | Skills Required | Level | Count |
|------|-----------------|-------|-------|
| **ML Engineer** | RAG, fine-tuning, MLOps | 3-4 | ≥2 |
| **Data Engineer** | ETL, pipelines, vector DBs | 3 | ≥1 |
| **DevOps/SRE** | K8s, monitoring, DR/BC | 3 | ≥1 |
| **Architect** | System design, AI patterns | 4 | ≥1 |
| **Product Owner** | AI use cases, metrics | 2-3 | ≥1 |
| **Security Engineer** | AI security, compliance | 3 | ≥1 |

**Team maturity checklist**:
- [ ] All team members ≥Level 2 (AI fundamentals)
- [ ] ≥50% team at Level 3 (advanced AI/ML)
- [ ] ≥1 team member at Level 4 (expert, can lead architecture)
- [ ] Team has 6+ months Delivery framework experience
- [ ] Team has deployed and maintained production systems before

**Gaps?** Address through hiring, training, or consulting before proceeding.

---

### Executive Sponsorship

**Critical success factor**: Production AI requires C-level backing.

**Executive sponsor checklist**:
- [ ] **CTO/VP** committed and engaged (not delegated)
- [ ] **Budget approved**: Tens-hundreds k$/month for 6+ months
- [ ] **Organizational priority**: AI initiative has top-3 priority
- [ ] **Resource commitment**: Team protected from other projects
- [ ] **Risk tolerance**: Executive understands and accepts AI risks
- [ ] **Long-term vision**: 12-24 month commitment, not a "quick win"

**Without executive sponsorship**: Stay in Delivery framework, build proof-of-value first.

---

## 5. Define Success Metrics

### Business Metrics

| Metric Type | Examples | Target | Measurement |
|-------------|----------|--------|-------------|
| **Revenue** | Conversion rate, upsell rate | +10-20% | Analytics platform |
| **Cost** | Support tickets, processing time | -30-50% | Operational data |
| **Customer** | NPS, CSAT, retention rate | +15% NPS | Surveys, CRM |
| **Efficiency** | Throughput, cycle time | +50% throughput | System metrics |

---

### Technical Metrics (SLAs)

| Metric | Target (Production) | Measurement |
|--------|---------------------|-------------|
| **Availability** | ≥99.9% (< 8.76h downtime/year) | Uptime monitoring |
| **Latency** | P95 < 2s, P99 < 5s | APM tools |
| **Error rate** | <0.1% (1 error per 1000 requests) | Logs, alerts |
| **Throughput** | Handles peak load +50% buffer | Load testing |

---

### AI-Specific Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Relevance** (RAG) | ≥80% relevant responses | Human eval |
| **Hallucination rate** | <5% | Grounded truth eval |
| **Bias/Fairness** | No significant bias | Fairness testing tools |
| **User satisfaction** | ≥4/5 rating | In-app surveys |
| **Human escalation** | <10% of conversations | System logs |

---

## 6. Estimate Budget

### Cost Model (Example: RAG Chatbot)

| Cost Category | Monthly Estimate | Notes |
|---------------|------------------|-------|
| **LLM API** | $15,000 | 500k calls/mo, $0.03/call (GPT-4 Turbo) |
| **Vector DB** | $500 | Managed Pinecone, 1M vectors |
| **Infrastructure** | $3,000 | K8s cluster, load balancers, etc. |
| **Monitoring/Observability** | $1,000 | Datadog or similar |
| **Data storage** | $500 | S3, backups |
| **Team** | $80,000 | 4 FTEs fully loaded cost |
| **Security/Compliance** | $2,000 | DLP, audits, tooling |
| **Contingency** (20%) | $20,400 | Unexpected costs |
| **Total** | **$122,400/mo** | **~$1.5M/year** |

**ROI calculation**:
- **Investment**: $1.5M/year
- **Return**: 30% support cost reduction = $2M/year savings
- **ROI**: ($2M - $1.5M) / $1.5M = **33% ROI** ✅

**Decision threshold (Go/No-Go)**: Projected ROI ≥20% to justify initial investment.

**ROI threshold progression**: The 20% threshold applies to initial approval (Phase 1). Once in production, the target rises to ≥100% ROI (2x return) to validate sustained operations and continued investment (see [Phase 3: Run](03-run.md)).

---

## 7. Identify Regulatory Requirements

📋 **Tool**: [Compliance Requirements Checklist](../templates/automation/compliance-requirements-checklist.md)

### General Regulations

**EU AI Act** (if operating in EU):
- [ ] Risk classification (high-risk systems require strict compliance)
- [ ] Risk management framework (NIST AI RMF recommended)
- [ ] Data governance and lineage documentation
- [ ] Technical documentation (model cards, architecture)
- [ ] Transparency requirements (user disclosure)
- [ ] Human oversight for high-risk decisions

**GDPR/Privacy Laws**:
- [ ] Data minimization and anonymization
- [ ] Right to explanation for AI decisions
- [ ] Data retention and deletion policies
- [ ] Breach notification procedures
- [ ] Data processing agreements (DPAs)

---

### Sector-Specific Regulations

**Healthcare** (HIPAA, HITECH):
- [ ] PHI protection (encryption at rest/transit)
- [ ] Access controls and audit trails
- [ ] Business Associate Agreements (BAAs)
- [ ] Regular risk assessments

**Finance** (SOX, PCI-DSS):
- [ ] Model explainability and documentation
- [ ] Regulatory reporting capabilities
- [ ] Fraud detection and prevention
- [ ] PCI compliance for payment data

**Insurance**:
- [ ] Fairness testing (no discrimination)
- [ ] Transparency in pricing/underwriting models
- [ ] Regulatory approval for AI models

**Critical**: Research specific requirements for your jurisdiction and industry. Consult legal/compliance experts.

---

## Phase 1 Checklist

Complete before moving to Phase 2:

### Use Case Validation ✅
- [ ] ≥1 production use case selected (ROI ≥20%)
- [ ] Business metrics defined and measurable
- [ ] Success criteria clear and agreed
- [ ] Executive sponsor committed

### Technical Planning ✅
- [ ] Technology stack decided (SaaS/PaaS/IaaS)
- [ ] Architecture designed and documented (ADRs)
- [ ] SLAs defined (availability, latency, throughput)
- [ ] Budget estimated and approved

### Organizational Readiness ✅
- [ ] Team composition validated (Levels 3-4)
- [ ] All required roles filled or planned
- [ ] Executive sponsorship secured
- [ ] Regulatory requirements identified

### Risk Assessment ✅
- [ ] Technical risks documented
- [ ] Regulatory compliance plan drafted
- [ ] Security requirements identified
- [ ] Mitigation strategies defined

**Estimated time**: 4-6 weeks total

---

**Previous**: [Automation README](README.md) | **Next**: [Phase 2: Build](02-build.md)
