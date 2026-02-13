# 02 - Plan (Delivery)

> Transform strategy into action - Skill assessment, training, access, prioritization, PoCs

**Focus**: Levels 2-3 (intermediate-advanced), SaaS + PaaS, 1-2 sprint PoCs

## 1. Assess Team AI Skills

### Quick Assessment

**Team evaluation**: Consult [SKILLS.md](../SKILLS.md) for:
- Definition of Levels 2-3 (Delivery target)
- Skills Matrix with ⭐ rating (6 skill axes)
- Employee → Delivery transition validation

**Process**:
1. Each member fills Skills Matrix (SKILLS.md section 4)
2. Aggregate into team table
3. Identify collective gaps

**Team Skills Matrix example**:

| Member | Prompt Eng | ML/Data | Infra | MLOps | Data Gov | Domain | Level |
|--------|------------|---------|-------|-------|----------|--------|-------|
| Alice | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ | 2-3 |
| Bob | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ | ⭐⭐ | 2 |
| **Team** | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ | ⭐⭐ | **2** (target: 3) |

→ **Gap**: Weak MLOps (⭐), training needed

### Assessment Steps (continued)

**2. Data Inventory**

Sources, quality (completeness, accuracy, freshness), accessibility, compliance (PII, GDPR).

**3. Infrastructure Check**

| Component | Level 2 | Level 3 |
|-----------|---------|---------|
| Compute | Serverless | VM + GPU optional |
| Storage | Object storage | + Data warehouse |
| Security | IAM, secrets | + Encryption, audit |
| CI/CD | GitHub Actions | + Auto deployment |

## 2. Acquire AI Skills

### Level 2 → 3 Training

**Complete path**: Consult [TRAINING.md](../TRAINING.md) section 4 for:

**Concepts**:
- AI/ML Fundamentals (architectures, pipelines)
- Advanced Prompting (ReAct, Tree-of-Thought)
- RAG & Vector DBs (embeddings, chunking, retrieval)
- MLOps Basics (versioning, CI/CD, monitoring)

**Tools**:
- Discovery: LangChain, LlamaIndex, Pinecone, Weaviate
- Advanced: APIs (OpenAI/Anthropic), AutoML (SageMaker, Vertex AI)

**Validation**: Complete RAG project (functional app, tests, documentation)

**Recommended certifications** (target: 50% team certified):
- AWS ML Specialty
- Google ML Engineer
- Azure AI Engineer

### Peer Learning

See [TRAINING.md](../TRAINING.md) section 7:
- **Tech Talks** (weekly, 30min)
- **AI Code Review** (per PR)
- **Lunch & Learn** (bi-monthly, 1h)
- **Hackathon** (quarterly, 1 day): Experiment new tech
- **Knowledge Base**: Internal wiki with prompts library, templates, learnings, FAQ

## 3. Access AI Resources

### Hybrid Stack (SaaS + PaaS)

| Category | Solution | Use Case | Cost (5-7 team) |
|----------|----------|----------|------------------|
| **SaaS GenAI** | ChatGPT Team / Claude Pro | Brainstorming, rapid prototyping | 150-250€/month |
| **PaaS GenAI** | OpenAI/Anthropic API | Production apps | 500-2K€/month |
| **PaaS ML** | AWS SageMaker / GCP Vertex | Training, deployment | 200-1K€/month |
| **Vector DB** | Pinecone / Weaviate Cloud | RAG, semantic search | 70-200€/month |
| **Monitoring** | LangSmith / W&B | Prompt tracking, ML experiments | 0-200€/month |
| **Code assist** | GitHub Copilot Business | Dev productivity | 200€/month |

**Total**: 1-4K€/month dev, 3-10K€/month production

### Access Checklist

**Cloud Provider** (choose 1): AWS (Bedrock, SageMaker), GCP (Vertex AI), Azure (OpenAI)
- Setup: org account, IAM, billing alerts, secrets management, audit logs (1-2 days)

**GenAI APIs**: OpenAI, Anthropic, Google, Mistral
- Start 500-1K€/month, adjust based on usage
- Setup: org accounts, billing limits, API keys rotation, secrets manager, rate limiting

**Data Infrastructure** (for RAG/ML):
- Vector DB: Pinecone (Level 2) / Weaviate (Level 3)
- Data warehouse: BigQuery/Snowflake (optional Level 2, recommended Level 3)
- Data pipeline: Cloud Functions (Level 2) / Airflow (Level 3)

## 4. Prioritize Use Cases

### Light Prioritization Method

**Evaluate Feasibility** (score 1-5):
- Team maturity (30% weight)
- Data availability (25%)
- Infrastructure (20%)
- Technical complexity (15%)
- Risk (10%)

Score ≥ 4.0: Feasible now | 3.0-3.9: Needs prep | < 3.0: Defer

**Score Strategic Value** (score 1-5):
- Business impact (40%)
- Strategic alignment (25%)
- Effort (20%, inverse: 5=low effort)
- Learning (15%)

**Prioritization Matrix**:
```
Value (Y) vs Feasibility (X)
High Value + High Feasibility = Priority 1 (Quick wins)
High Value + Medium Feasibility = Priority 2 (Prepare first)
```

**6-month Roadmap**:
- Q1: Sprint 1-2 (Priority 1), Sprint 3-4 (Priority 2)
- Q2: Sprint 5-6 (Priority 3)
- Max 2 parallel AI projects (team 5-7)
- 20% buffer between sprints

## 5. Create Team PoCs (1-2 sprints)

### PoC Methodology

**Selection Criteria**: Limited scope (2-4 weeks), clear business value, manageable risk (internal, non-critical), high learning, 80%+ data ready

**PoC Brief Template**:
```markdown
# PoC: [Name]
**Context**: [Problem, users, impact]
**Technical Objective**: [What we build in 2-4 weeks]
**Scope**: In: [Features] | Out: [Defer to later]
**Team**: PO, Tech Lead, Devs, Data (if needed)
**Stack**: Model, Infrastructure, Frontend, Backend
**Success Criteria**: Functional (80% accuracy), Performance (<3s latency), Cost (<100€), Learning (team understands RAG)
**Budget & Timeline**: 2 sprints, 200-500€, 2-3 people part-time
```

### Implementation (2-4 weeks)

**Week 1**: Setup (infra, accounts), data prep, spike (test 2-3 models), first prompt/pipeline
**Week 2**: Core dev (full pipeline, data integration, basic UI), manual tests (10-20 cases)
**Week 3**: Iteration (improve quality, tune prompts), tests (50-100 cases), handle edge cases, basic monitoring
**Week 4**: Demo prep, documentation, retrospective, Go/No-go decision

**Tools**: Streamlit/Gradio (prototyping), FastAPI/Flask (backend), LangChain/LlamaIndex (orchestration), Pinecone/Chroma (vector DB)

### Evaluation & Decision

**Technical Evaluation**: Quality (≥80% accuracy), Performance (P90 <3s), Robustness (<5% error), Cost (<0.10€/req), Scalability (≥10 req/s)

**Business Evaluation**: User satisfaction (≥4.0/5), Time savings (≥40%), Adoption (≥70% active), ROI (≥20K€/year)

**Learnings**: Best model/approach? Main challenges? False assumptions? Missing skills? Redo differently?

**Go/No-Go**:
- **Go to Production**: Quality ≥80%, positive ROI, team confident → Phase [Ready](03-ready.md)
- **Pivot**: Quality 60-80%, clear learnings → New 2-sprint PoC
- **Pause**: Quality <60%, blockers → Train, acquire data, revisit in 3 months
- **Kill**: No ROI, too complex → Document learnings, archive

**Rule**: 70% PoCs should go to production or pivot. If killing >30%, prioritization too optimistic.

### Timeline Estimation (PoC → Production)

| Component | PoC | MVP Production | Full Production |
|-----------|-----|----------------|-----------------|
| Features | 1-2 core | +2-3 essential | +5-10 complete |
| Quality | 70-80% | 85-90% | 95%+ |
| Scale | 10-100 users | 100-1K users | 1K-10K+ users |
| Monitoring | Basic logs | Dashboards, alerts | Full observability |
| Security | Dev/staging | Secrets, IAM, encryption | Audit, compliance, pentests |
| Duration | 2-4 weeks | +4-8 weeks | +8-16 weeks |

**Complexity factors**: x1.2 (first AI app), x1.3 (legacy integration), x1.5 (poor data quality), x1.2 (strict compliance)

## 6. Responsible AI Implementation

### Lightweight Frameworks

**AI Impact Assessment** (per PoC, 1 page):
- System description (type, model, data, output)
- Users & impact (who uses, decisions impacted, consequences)
- Risks (hallucinations, bias, data leaks, overreliance) + mitigations
- Sensitive data (PII, IP, confidential) + GDPR compliance
- Transparency (users know it's AI, contestation mechanism, documentation)
- Approval (reviewer, approver, date)

**Rule**: No PoC without validated Impact Assessment

**Responsible AI Toolkits**:
- Guardrails AI (Level 2-3): LLM output validation
- LangSmith (Level 2-3): Prompt monitoring, hallucination detection
- Microsoft Presidio (Level 2-3): PII detection/anonymization
- Fairlearn (Level 3): ML bias detection

**Pre-Production Checklist**:
- [ ] PII filtering automated
- [ ] Opt-out training for external providers
- [ ] Data encrypted (rest + transit)
- [ ] Access logged (audit trail)
- [ ] Tests (50-100 cases)
- [ ] Hallucination detection (critical outputs)
- [ ] Manual fallback (low confidence)
- [ ] Quality monitoring (dashboards)
- [ ] Users informed (AI disclaimer)
- [ ] Documentation (non-technical)
- [ ] User feedback mechanism
- [ ] Bias tests (if applicable)

## Plan Checklist

**Month 1**: Assess & Train
- [ ] Skills matrix
- [ ] Data inventory
- [ ] Infrastructure audit
- [ ] Training program (1-2 weeks)
- [ ] Cloud accounts and APIs

**Month 2**: Prioritize & Prepare
- [ ] Score use cases (feasibility + value)
- [ ] Prioritization matrix
- [ ] 6-month roadmap (2-3 projects max)
- [ ] Select PoC #1
- [ ] PoC brief + Impact Assessment

**Month 3**: First PoC
- [ ] Launch PoC #1 (2-4 weeks)
- [ ] Setup infra and data
- [ ] Develop MVP
- [ ] Iterate quality
- [ ] Demo + retro + Go/No-go

**Month 4**: Production or Pivot
- [ ] If Go: Deploy (see [Ready](03-ready.md))
- [ ] If Pivot: PoC #1bis new approach
- [ ] Monitor results
- [ ] Document learnings

**Month 5**: Second PoC
- [ ] Launch PoC #2
- [ ] Repeat PoC #1 process
- [ ] Share project #1 learnings

**Month 6**: Scale & Governance
- [ ] 2 projects in production (goal)
- [ ] Lightweight governance frameworks
- [ ] Plan certifications (M6-9)
- [ ] Retrospective: learnings, new maturity level

## Next Step

→ [Phase 3: Ready](03-ready.md) - Prepare production environment
