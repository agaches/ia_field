# AI Training Paths

> Training guide to progress from Level 1 to Level 4

## 1. Overview

**Philosophy**: Progressive 1→2→3→4 with practical project validation.

**Framework Alignment**:
- **Path 1→2** = [Employee Framework](employee/) (Personal productivity)
- **Path 2→3** = [Delivery Framework](delivery/) (Team processes)
- **Path 3→4** = [Automation Framework](automation/) (Production systems)

**Structure per path**:
- **Concepts**: Theory, fundamentals (what you need to understand)
- **Tools**: Practice, discovery and usage (what you need to know how to use)
- **Validation**: Practical project to validate skills before moving to next level

**Quick Start**:
1. Assess your current level: [SKILLS.md](SKILLS.md)
2. Identify target framework: Employee (personal) → Delivery (team) → Automation (production)
3. Follow the corresponding training path below
4. Complete validation project to prove competency

### Training Paths Comparison

| Aspect | Path 1→2 (Employee) | Path 2→3 (Delivery) | Path 3→4 (Automation) |
|--------|---------------------|---------------------|------------------------|
| **Framework** | [Employee](employee/) | [Delivery](delivery/) | [Automation](automation/) |
| **Focus** | Personal productivity | Team processes | Production systems |
| **Level** | Basic → Intermediate | Intermediate → Advanced | Advanced → Expert |
| **Risk** | Low (personal data) | Medium (team velocity) | High-Critical (business SLA) |
| **Budget** | $20-50/month | Few k$/month | Tens-hundreds k$/month |
| **Time** | 2-4 weeks | 2-3 months | 6-12 months |
| **Prerequisites** | None | 50%+ team at L2 | Team L2-3 + Exec sponsor |
| **Key Skills** | Prompting, SaaS tools, API basics | RAG, MLOps basics, team integration | Fine-tuning, K8s, NIST AI RMF |
| **Validation** | 3 use cases automated | RAG app deployed | Production system (99.9% SLA) |

---

## 2. Tool Training Format

### Standard Structure (2h)

**1. Introductory Overview** (15min)
- Distinguish tools (e.g., Gemini App vs Workspace vs NotebookLM)
- Basic method (e.g., S.C.P.E. - Situation, Context, Purpose, Format)
- Ethics and security (GDPR, confidentiality)

**2. Live Scenarios** (80-90% of time)
- Concrete business use cases
- Hands-on, learning by doing
- Multiple tools in action

**3. Next Steps** (10min)
- Internal resources
- Q&A sessions
- Upcoming trainings

### Example: Gemini Discovery (2h)

**1. Overview** (15min)
- Distinguish: Gemini App (public brain), Gemini Workspace (integrated assistant), NotebookLM (data expert)
- S.C.P.E. method (Situation, Context, Purpose, Format)
- GDPR and confidentiality

**2. Gemini App** (25min)
- Scenario: "Prepare team meeting"
- Web research + PDF analysis + Support generation

**3. Gemini Workspace** (50min)
- Side panel: Drive ↔ Gmail navigation
- Gmail: Thread synthesis + Polite response
- Sheets: Project tracking structure in 3 seconds
- Slides: Abstract concept image generation

**4. NotebookLM** (20min)
- Import 5 meeting notes + annual strategy
- Generate FAQ for newcomers
- Audio overview (podcast) for managers
- Fact verification (clickable citations)

**5. Next Steps** (10min)
- Internal AI resources
- Q&A sessions

### Adaptation by Level

- **Level 1→2**: SaaS tools (ChatGPT, Claude, Copilot) - Simple scenarios
- **Level 2→3**: PaaS tools (APIs, LangChain, Vector DBs) - Technical scenarios
- **Level 3→4**: IaaS tools (K8s, Terraform, MLOps) - Production scenarios

---

## 3. Path 1→2 (Basic → Intermediate) — Employee Framework

**Framework**: [Employee](employee/) (Personal AI productivity)
**Goal**: Master SaaS AI tools + API basics for individual work
**Risk**: Low (personal data only)
**Budget**: $20-50/month
**Time**: 2-4 weeks (10-20h training + validation project)

### Concepts

**GenAI Fundamentals**
- LLM, tokens, context, limitations
- GenAI vs classical ML
- Hallucinations and verification

**Prompt Engineering**
- Effective prompt structure (S.C.P.E.)
- Few-shot learning
- Chain-of-thought (CoT)

**Security & Privacy**
- Data classification (🟢🟡🔴) — See [Data Classification Guide](templates/shared/data-classification-guide.md)
- MFA, opt-out model training
- GDPR compliance basics

**Business Practice**
- Business prompt templates
- Daily workflow integration
- Use cases by role

**Framework Integration**: Study [Employee/01-Prepare](employee/01-prepare.md) for tool selection, [Employee/02-Build](employee/02-build.md) for security setup, and [Employee/03-Run](employee/03-run.md) for daily operations.

### Tools

**Discovery**
- ChatGPT (Plus or Team)
- Claude (Pro)
- GitHub Copilot
- M365 Copilot (if applicable)

**Advanced**
- API basics (OpenAI, Anthropic)
- Token and cost management
- Simple integrations

### Validation Project

**Goal**: Demonstrate personal AI productivity mastery

**Requirements**:
1. **Tool Selection**: Choose 2-3 AI tools using [Tool Selection Matrix](templates/employee/tool-selection-matrix.md)
2. **Use Cases**: Automate 3 daily tasks (use [Use Case Identification Matrix](templates/employee/use-case-identification-matrix.md))
   - 1 content creation task (email, doc, report)
   - 1 analysis task (data, research, decision support)
   - 1 automation task (workflow, integration)
3. **Technical Skills**:
   - 3 complex prompts (few-shot, CoT, ReAct)
   - 1 simple API call (OpenAI/Anthropic)
   - Data classification applied (no 🔴 data in prompts)
4. **Documentation**:
   - Prompt library (10+ reusable prompts)
   - Security checklist completed
   - ROI tracking: Track 1 month with [Cost ROI Tracking](templates/employee/cost-roi-tracking.md)

**Success Criteria**:
- ✅ 5h/week time saved (measured over 4 weeks)
- ✅ GenAI fundamentals quiz (80% pass)
- ✅ Zero security incidents (no 🔴 data exposure)
- ✅ Manager validation of use cases

**Expected Outcome**: Ready for Level 2, can participate in team AI initiatives (Delivery framework).

### Resources

- Coursera: Google AI Essentials
- learnprompting.org
- Anthropic Learn, Microsoft Learn
- Communities: r/ChatGPT, Claude AI Discord

**Certifications (optional)**:
- Google AI Essentials
- Microsoft AI Skills Challenge

---

## 4. Path 2→3 (Intermediate → Advanced) — Delivery Framework

**Framework**: [Delivery](delivery/) (Team AI processes)
**Goal**: Build team AI capabilities with RAG, APIs, and MLOps basics
**Prerequisites**: 50%+ team at Level 2, has AI champion
**Risk**: Medium (team velocity, internal data)
**Budget**: Few k$/month
**Time**: 2-3 months (40-60h training + team validation project)

### Concepts

**AI/ML Fundamentals**
- LLM architectures (GPT, Claude, Llama)
- ML pipelines and lifecycle
- GenAI vs classical ML (when to use which)

**Advanced Prompting**
- ReAct (Reasoning + Acting)
- Tree-of-Thought
- Prompt evaluation and optimization

**RAG & Vector DBs**
- Embeddings and semantic search
- Chunking strategies (size, overlap)
- Retrieval optimization (hybrid search, reranking)

**MLOps Basics**
- Versioning (Git, DVC, model registries)
- CI/CD for ML (testing, deployment)
- Basic monitoring (latency, accuracy drift)

**Team Practices**
- AI integration patterns (code review, testing, docs)
- Cost optimization and tracking
- Team policies and guardrails

**Framework Integration**: Study [Delivery/01-Prepare](delivery/01-prepare.md) for team readiness, [Delivery/02-Build](delivery/02-build.md) for governance setup, and [Delivery/03-Run](delivery/03-run.md) for team operations.

### Tools

**Discovery**
- LangChain / LlamaIndex
- Pinecone / Weaviate (Vector DBs)
- AutoML (SageMaker, Vertex AI)

**Advanced**
- OpenAI/Anthropic APIs (advanced)
- RAG frameworks
- Prompt evaluation (LangSmith)

### Validation Project

**Goal**: Demonstrate team AI integration capabilities

**Requirements**:
1. **Team Readiness**: Complete [AI Integration Readiness](templates/delivery/ai-integration-readiness.md) assessment
2. **RAG Application**: Build functional Q&A system on internal documentation
   - Embeddings + vector DB (Pinecone, Weaviate, or Qdrant)
   - Latency <2s (p95)
   - Answer accuracy >80% on test set
   - Proper error handling and fallbacks
3. **Team Integration**: Implement 2+ team AI patterns
   - Code review assistance (e.g., PR summarization)
   - Testing support (test generation, coverage analysis)
   - Documentation automation (API docs, changelogs)
4. **Technical Excellence**:
   - Automated tests (unit + integration, >80% coverage)
   - CI/CD pipeline with quality gates
   - Cost monitoring (<$500/month)
   - Technical documentation (architecture, runbooks)
5. **Team Practices**: Document in [Team Policy Template](templates/delivery/team-policy-template.md)
   - Experimentation process (use [Collective Experimentation Canvas](templates/delivery/collective-experimentation-canvas.md))
   - AI usage guidelines and guardrails
   - Knowledge sharing rituals (demos, retros)

**Success Criteria**:
- ✅ RAG app deployed and used by team (>10 queries/day)
- ✅ Team velocity maintained or improved (track with [Velocity Tracking Matrix](templates/delivery/velocity-tracking-matrix.md))
- ✅ Zero critical incidents (data leaks, cost overruns)
- ✅ Tech Lead + Senior Dev code review passed
- ✅ 30min technical presentation to peers

**Expected Outcome**: Ready for Level 3, can lead production AI initiatives (Automation framework).

### Resources

- Udacity: AI/ML courses
- AWS Skill Builder, GCP Skills Boost
- Fast.ai
- DeepLearning.AI

**Certifications**:
- AWS ML Specialty
- Google ML Engineer
- Azure AI Engineer

---

## 5. Path 3→4 (Advanced → Expert) — Automation Framework

**Framework**: [Automation](automation/) (Production AI systems)
**Goal**: Build and operate production-grade AI systems at scale
**Prerequisites**: Team maturity (Delivery L2-3), Technical skills (RAG, MLOps), Executive sponsor
**Risk**: High-Critical (SLA, customer data, business impact)
**Budget**: Tens-hundreds k$/month
**Time**: 6-12 months (100-200h training + production system deployment)

### Concepts

**Advanced ML & LLM Fine-Tuning**
- LoRA, QLoRA, PEFT (Parameter-Efficient Fine-Tuning)
- RLHF (Reinforcement Learning from Human Feedback)
- Distributed training (DeepSpeed, FSDP)
- Model quantization and optimization

**AI Infrastructure**
- Multi-region architecture (99.9%+ SLA)
- GPU optimization (A100/H100 clusters)
- Autoscaling strategies (cost vs latency)
- Landing zone design (networking, IAM, monitoring)

**Complete MLOps/LLMOps**
- CI/CD/CT (Continuous Training)
- A/B testing, canary deployments, blue/green
- Production observability (latency, drift, costs)
- Model versioning and rollback strategies

**AI Governance & Compliance**
- NIST AI RMF (Govern, Map, Measure, Manage) — See [NIST AI RMF Implementation](templates/automation/nist-ai-rmf-implementation.md)
- EU AI Act compliance (if applicable)
- Fairness, bias mitigation, explainability
- Red-teaming and adversarial testing

**Responsible AI**
- Model card documentation
- Bias and fairness audits
- Incident response and postmortems
- Continuous risk assessment

**Architecture & Scale**
- AI architecture patterns (agentic, RAG, fine-tuned)
- Performance optimization (caching, batching, parallelization)
- Cost optimization (reserved instances, spot, model distillation)
- Technical leadership and mentoring

**Framework Integration**: Study [Automation/01-Prepare](automation/01-prepare.md) for architecture decisions, [Automation/02-Build](automation/02-build.md) for governance, and [Automation/03-Run](automation/03-run.md) for operations.

### Tools

**Discovery**
- Kubernetes (K8s)
- Terraform
- MLflow, Weights & Biases

**Advanced**
- GPU clusters (A100/H100)
- DeepSpeed, FSDP
- Kubeflow
- Prometheus, Grafana

### Validation Project

**Goal**: Demonstrate production AI system expertise

**Requirements**:
1. **Architecture & Planning**:
   - Complete [Readiness Assessment](templates/automation/organization-readiness-assessment.md)
   - Document architecture with [ADR Template](templates/automation/architecture-decision-record.md)
   - Select use case using [Use Case Evaluation](templates/automation/production-ai-use-case-matrix.md)
2. **AI System Implementation**:
   - LLM fine-tuning (LoRA/QLoRA) on business data OR
   - Production RAG system with advanced retrieval (hybrid search, reranking) OR
   - Agentic system with multi-step reasoning
3. **Infrastructure** (choose based on organization):
   - Multi-region K8s cluster (99.9%+ SLA) OR
   - Serverless deployment with auto-scaling
   - GPU optimization (if applicable)
   - Landing zone setup (see [Landing Zone Checklist](templates/automation/ai-landing-zone-checklist.md))
4. **MLOps/LLMOps Pipeline**:
   - Complete CI/CD/CT (build, test, deploy, retrain)
   - A/B testing and canary deployments
   - Model versioning and rollback capability
   - Automated model retraining triggers
5. **Governance & Compliance**:
   - NIST AI RMF governance implemented (see [NIST AI RMF Implementation](templates/automation/nist-ai-rmf-implementation.md))
   - EU AI Act compliance (if applicable, see [EU AI Act Compliance](templates/automation/eu-ai-act-compliance.md))
   - Responsible AI audit completed (fairness, bias, explainability)
   - Security controls (OWASP LLM Top 10 mitigated)
6. **Operations & Observability**:
   - Production monitoring (see [System Health Dashboard](templates/automation/production-health-dashboard.md))
   - Model performance tracking (see [Model Performance Dashboard](templates/automation/model-performance-dashboard.md))
   - Cost monitoring and optimization (see [Cost Dashboard](templates/automation/production-cost-dashboard.md))
   - Incident response runbooks (see [Incident Runbooks](templates/automation/ai-incident-runbooks.md))
   - DR/BC plan tested (see [Disaster Recovery Plan](templates/automation/disaster-recovery-plan.md))
7. **Documentation & Knowledge Transfer**:
   - Complete technical documentation (architecture, runbooks, ADRs)
   - Quarterly review template populated (see [Quarterly System Review](templates/automation/quarterly-system-review.md))
   - Model cards and explainability docs
   - Team training materials

**Success Criteria**:
- ✅ System deployed to production with real users (>100 daily active users)
- ✅ SLA met for 30 consecutive days (99.9% uptime, <2s p95 latency)
- ✅ Zero critical incidents (data breach, model failure, compliance violation)
- ✅ Cost within budget (±10% variance)
- ✅ Responsible AI audit passed (no critical findings)
- ✅ Architecture review passed (CTO/VP + AI CoE)
- ✅ Live demo under load (100+ concurrent users)
- ✅ Documented ROI (business value > costs)
- ✅ Team knowledge transfer completed (runbooks, on-call rotation)

**Expected Outcome**: Ready for Level 4 Expert, can architect and lead organization-wide AI transformation.

### Resources

- Fast.ai Advanced
- Stanford CS courses
- Papers (arXiv)
- NIST AI RMF documentation

**Certifications**:
- AWS/GCP/Azure ML Advanced
- Kubernetes Application Developer (CKAD)

---

## 6. Training Governance

### LIGHT - Employee (Level 1-2)

**Responsibilities**:
- Individual: Self-assessment, autonomous training
- Manager: Budget validation, time allocation

**Validation**:
- Online quiz (80% pass)
- 3 complex prompts
- Update Skills Matrix

### MEDIUM - Delivery (Level 2-3)

**Responsibilities**:
- Individual: Training commitment
- Tech Lead: Planning, code review, mentoring
- HR/L&D: Budget, certifications

**Validation**:
- Complete RAG project
- Code review (Tech Lead + Senior Dev)
- Technical presentation (30min)
- Update Skills Matrix

### FULL - Automation (Level 3-4)

**Responsibilities**:
- Individual: Training + leadership
- Tech Lead: Architecture reviews, mentoring
- AI CoE: Governance, audits
- CTO/VP: Sponsorship, strategic decisions

**Validation**:
- Complex production project
- Code review + Architecture review
- Responsible AI audit
- Live demo under load
- Documented ROI
- Update Skills Matrix

---

**Getting started**: Assess your level with [SKILLS.md](SKILLS.md), then follow the corresponding path above.
