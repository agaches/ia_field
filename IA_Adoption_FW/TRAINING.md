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

## 2. Path 1→2 (Basic → Intermediate) — Employee Framework

**Goal**: Master SaaS AI tools + API basics for individual work
**Time**: 2-4 weeks (10-20h training + validation project)

**Concepts**: GenAI fundamentals (LLM, tokens, hallucinations), prompt engineering (S.C.P.E., few-shot, CoT), security & privacy (data classification 🟢🟡🔴, GDPR basics)

**Tools**: ChatGPT, Claude, GitHub Copilot, M365 Copilot, OpenAI/Anthropic API basics

**Validation**: Automate 3 daily tasks, create 10+ reusable prompts, 1 simple API call, track ROI for 1 month. **Success**: 5h/week saved, zero 🔴 data exposure, manager validation.

---

## 3. Path 2→3 (Intermediate → Advanced) — Delivery Framework

**Goal**: Build team AI capabilities with RAG, APIs, and MLOps basics
**Prerequisites**: 50%+ team at Level 2, has AI champion
**Time**: 2-3 months (40-60h training + team validation project)

**Concepts**: LLM architectures, advanced prompting (ReAct, Tree-of-Thought), RAG & vector DBs (embeddings, chunking, hybrid search), MLOps basics (versioning, CI/CD for ML), team practices (code review, testing, docs)

**Tools**: LangChain/LlamaIndex, Pinecone/Weaviate, AutoML (SageMaker, Vertex AI), LangSmith

**Validation**: Build RAG Q&A system on internal docs (latency <2s, accuracy >80%), implement 2+ team AI patterns, CI/CD pipeline with quality gates. **Success**: Team velocity maintained, zero critical incidents, Tech Lead code review passed, 30min presentation to peers.

---

## 4. Path 3→4 (Advanced → Expert) — Automation Framework

**Goal**: Build and operate production-grade AI systems at scale
**Prerequisites**: Team maturity (Delivery L2-3), Technical skills (RAG, MLOps), Executive sponsor
**Time**: 6-12 months (100-200h training + production system deployment)

**Concepts**: Fine-tuning (LoRA, QLoRA, RLHF), AI infrastructure (multi-region, GPU optimization, autoscaling), complete MLOps/LLMOps (CI/CD/CT, A/B testing, canary), AI governance (NIST AI RMF, EU AI Act), responsible AI (fairness, bias, explainability)

**Tools**: Kubernetes, Terraform, MLflow/W&B, GPU clusters (A100/H100), DeepSpeed/FSDP, Kubeflow, Prometheus/Grafana

**Validation**: Deploy production AI system (fine-tuned LLM, production RAG, or agentic system), multi-region infrastructure (99.9%+ SLA), complete MLOps pipeline (CI/CD/CT + A/B testing), NIST AI RMF governance, responsible AI audit. **Success**: >100 DAU, 30-day SLA met, zero critical incidents, cost within ±10%, architecture review passed (CTO/VP + AI CoE).

---

## 5. Training Governance

| Level | Governance | Validation | Approvers |
|-------|-----------|------------|-----------|
| **1→2 (Employee)** | LIGHT — Self-assessment, manager validates budget | Quiz (80%), 3 complex prompts, Skills Matrix update | Individual + Manager |
| **2→3 (Delivery)** | MEDIUM — Tech Lead plans, HR/L&D manages budget | RAG project, code review, 30min presentation, Skills Matrix update | Tech Lead + Senior Dev |
| **3→4 (Automation)** | FULL — AI CoE governs, CTO sponsors | Production project, architecture review, responsible AI audit, live demo, documented ROI | CTO/VP + AI CoE |

---

**Getting started**: Assess your level with [SKILLS.md](SKILLS.md), then follow the corresponding path above.
