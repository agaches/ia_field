# AI Training Paths

> Training guide to progress from Level 1 to Level 4

## 1. Overview

**Philosophy**: Progressive 1→2→3→4 with practical project validation.

**Structure per path**:
- **Concepts**: Theory, fundamentals (what you need to understand)
- **Tools**: Practice, discovery and usage (what you need to know how to use)

**Validation**: Each path ends with a practical project to validate skills.

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

## 3. Path 1→2 (Basic → Intermediate)

**Goal**: SaaS → API + team usage

### Concepts

**GenAI Fundamentals**
- LLM, tokens, context, limitations
- GenAI vs classical ML
- Hallucinations and verification

**Prompt Engineering**
- Effective prompt structure (S.C.P.E.)
- Few-shot learning
- Chain-of-thought (CoT)

**Business Practice**
- Business prompt templates
- Daily workflow integration
- Use cases by role

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

### Validation

**Project**: Automate 3 daily tasks with AI
- 3 complex prompts (few-shot, CoT)
- 1 simple API call
- Use case documentation

**Quiz**: GenAI fundamentals (80% pass)

### Resources

- Coursera: Google AI Essentials
- learnprompting.org
- Anthropic Learn, Microsoft Learn
- Communities: r/ChatGPT, Claude AI Discord

**Certifications (optional)**:
- Google AI Essentials
- Microsoft AI Skills Challenge

---

## 4. Path 2→3 (Intermediate → Advanced)

**Goal**: API → RAG/custom ML + MLOps basics

### Concepts

**AI/ML Fundamentals**
- LLM architectures (GPT, Claude, Llama)
- ML pipelines
- GenAI vs classical ML

**Advanced Prompting**
- ReAct (Reasoning + Acting)
- Tree-of-Thought
- Prompt evaluation

**RAG & Vector DBs**
- Embeddings and similarity
- Chunking strategies
- Retrieval optimization

**MLOps Basics**
- Versioning (Git, DVC)
- CI/CD for ML
- Basic monitoring

### Tools

**Discovery**
- LangChain / LlamaIndex
- Pinecone / Weaviate (Vector DBs)
- AutoML (SageMaker, Vertex AI)

**Advanced**
- OpenAI/Anthropic APIs (advanced)
- RAG frameworks
- Prompt evaluation (LangSmith)

### Validation

**RAG Project**: Functional application
- Complete RAG app (Q&A on internal docs)
- Latency <2s (p95)
- Automated tests
- Technical documentation

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

## 5. Path 3→4 (Advanced → Expert)

**Goal**: RAG/ML → LLM fine-tuning + Production infrastructure

### Concepts

**Advanced ML & LLM Fine-Tuning**
- LoRA, QLoRA, PEFT
- RLHF (Reinforcement Learning from Human Feedback)
- Distributed training (DeepSpeed, FSDP)

**AI Infrastructure**
- Multi-region architecture
- GPU optimization
- Autoscaling strategies

**Complete MLOps**
- CI/CD/CT (Continuous Training)
- A/B testing, canary deployments
- Production observability

**Responsible AI**
- Fairness, bias mitigation
- Audits and compliance (NIST AI RMF)
- Red-teaming

**Architecture & Scale**
- AI architecture patterns
- Performance optimization
- Technical leadership

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

### Validation

**Production Project**:
- LLM fine-tuning (LoRA/QLoRA) on business data
- Multi-region K8s infrastructure
- Complete CI/CD/CT
- Monitoring + Alerting
- Responsible AI audit
- Documented ROI

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

## 7. Peer Learning & Knowledge Sharing

**Tech Talks** (weekly, 30min)
- Member presents AI tool/concept
- Team Q&A

**AI Code Review** (per PR)
- Review prompts, API calls, models
- Share best practices

**Lunch & Learn** (bi-monthly, 1h)
- Informal AI tech discussion
- Tech watch

**Hackathon** (quarterly, 1 day)
- New tech experimentation
- Quick POCs

**Knowledge Base** (internal wiki)
- Prompts library
- Reusable templates
- Learnings and FAQ

---

## 8. Recommended Resources

### Training Platforms

- **Coursera**: Google AI Essentials, Specializations
- **Udacity**: AI/ML Nanodegrees
- **Fast.ai**: Practical Deep Learning
- **DeepLearning.AI**: Andrew Ng courses
- **AWS Skill Builder** (if AWS)
- **GCP Skills Boost** (if GCP)
- **Microsoft Learn** (if Azure)

### Certifications by Cloud Provider

**AWS**:
- ML Specialty (Level 2-3)
- ML Advanced (Level 3-4)

**GCP**:
- ML Engineer (Level 2-3)
- Professional ML Engineer (Level 3-4)

**Azure**:
- AI Engineer Associate (Level 2-3)
- AI Engineer Expert (Level 3-4)

**Others**:
- Kubernetes CKAD (Level 3-4)
- TensorFlow Developer (Level 2-3)

### Books

- "Hands-On Machine Learning" (Aurélien Géron)
- "Designing Data-Intensive Applications" (Martin Kleppmann)
- "Building Machine Learning Pipelines" (O'Reilly)

### Communities

- Reddit: r/MachineLearning, r/LocalLLaMA
- Discord: Claude AI, OpenAI Developer
- GitHub: HuggingFace, LangChain
- Papers: arXiv.org (ML section)

---

## Next Steps

1. **Assess your level**: [SKILLS.md](SKILLS.md)
2. **Choose your path**: Based on your current level
3. **Start training**: Concepts + Tools
4. **Validate with project**: Practical project
5. **Update Skills Matrix**: Track your progress

**Questions?** Consult your Tech Lead or AI CoE.
