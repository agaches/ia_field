# AI Skills Grid

> Single reference to assess and develop your AI skills

## 1. Overview of 4 Maturity Levels

```
┌─────────────────────────────────────────────────────────────────────┐
│                        MATURITY LEVELS                               │
└─────────────────────────────────────────────────────────────────────┘

 Level 1                     Level 2                     Level 3                     Level 4
 BASIC                       INTERMEDIATE                ADVANCED                    EXPERT

 • SaaS only                 • SaaS + API usage          • RAG, custom ML            • LLM training
 • Prompt basics             • Prompt engineering        • Fine-tuning               • Complex infrastructure
 • Zero code                 • Light integration         • MLOps basics              • Full MLOps
 • Discovery                 • Basic data pipelines      • Production-ready          • Enterprise scale

 ├─────────────────────────────┤                         ├───────────────────────────────────────┤
 │     EMPLOYEE FRAMEWORK       │                         │        DELIVERY FRAMEWORK              │
 └─────────────────────────────┘                         └───────────────────────────────────────┘
                                                          ├───────────────────────────────────────────────┤
                                                          │        AUTOMATION FRAMEWORK                    │
                                                          └───────────────────────────────────────────────┘
```

**Framework mapping**:
- Level 1-2 → [Employee](employee/)
- Level 2-3 → [Delivery](delivery/)
- Level 3-4 → [Automation](automation/)

---

## 2. Definition of 4 Levels

| Level | Skills | Technologies | Use Cases | Framework |
|-------|--------|--------------|-----------|-----------|
| **1 - Basic** | Prompt basics, SaaS usage | ChatGPT, Claude, Copilot | Personal productivity | Employee |
| **2 - Intermediate** | Prompt engineering, APIs | SaaS + API (OpenAI, Anthropic) | Automated workflows, scripts | Employee → Delivery |
| **3 - Advanced** | RAG, custom ML, MLOps basics | PaaS (SageMaker, Vertex AI), Vector DBs | AI applications, RAG production | Delivery → Automation |
| **4 - Expert** | LLM fine-tuning, GPU infrastructure | K8s, Terraform, GPU clusters | Critical production, enterprise scale | Automation |

---

## 3. The 6 Skill Axes

Each level breaks down into 6 axes:

1. **Prompt Engineering & GenAI**
   - Level 1-2: Simple prompts → Few-shot, CoT
   - Level 3-4: ReAct, Tree-of-Thought → Prompt optimization

2. **ML & Data Science**
   - Level 1-2: None → Basics (regression, classification)
   - Level 3-4: Custom ML, feature engineering → LLM fine-tuning, RLHF

3. **Infrastructure & DevOps**
   - Level 1-2: None → Git, basic CI
   - Level 3-4: Cloud (AWS/GCP/Azure), Docker → K8s, Terraform, GPU clusters

4. **MLOps & LLMOps**
   - Level 1-2: None → Basic versioning
   - Level 3-4: ML CI/CD, monitoring → Production-grade (A/B testing, canary)

5. **Data Governance & Security**
   - Level 1-2: GDPR awareness → PII, basic encryption
   - Level 3-4: DLP, audits → Full compliance (NIST AI RMF)

6. **Domain Expertise**
   - Level 1-2: Basic domain knowledge → Solid
   - Level 3-4: Domain expert → AI strategy for domain

---

## 4. Skills Matrix

### Star Rating ⭐

- **⭐** (Basic): Awareness, guided usage
- **⭐⭐** (Intermediate): Daily autonomous usage
- **⭐⭐⭐** (Advanced/Expert): Architecture, design, mentoring

### Template

| Axis | Stars | Notes |
|------|-------|-------|
| 1. Prompt Engineering & GenAI | ⭐⭐ | Few-shot, CoT mastered |
| 2. ML & Data Science | ⭐ | Basics only |
| 3. Infrastructure & DevOps | ⭐⭐ | Git, basic CI/CD |
| 4. MLOps & LLMOps | ⭐ | Versioning only |
| 5. Data Governance & Security | ⭐⭐ | GDPR, PII |
| 6. Domain Expertise | ⭐⭐⭐ | Domain expert |

**Overall level**: Calculate average → Score 0.4-0.6 = Level 2

### Minimum Prerequisites per Level

**Level 2**:
- Prompt Engineering ≥ ⭐⭐

**Level 3**:
- Prompt Engineering ≥ ⭐⭐
- ML/Data ≥ ⭐⭐
- Infrastructure ≥ ⭐⭐

**Level 4**:
- All axes ≥ ⭐⭐
- Infrastructure ≥ ⭐⭐⭐
- MLOps ≥ ⭐⭐⭐

---

## 5. Guided Self-Assessment

**5 quick steps (<10min)**:

1. **Fill Skills Matrix** (section 4) - 5min
2. **Calculate average score** - 1min
3. **Check minimum prerequisites** (section 4) - 2min
4. **Identify overall level** (section 2) - 1min
5. **Identify priority gaps** - 1min

**Result**: You know your level and what to improve.

---

## 6. Framework Transition Validation

### Employee → Delivery

**Individual criteria**:
- ✅ Level 2 validated (Skills Matrix ≥ ⭐⭐ on 3+ axes)
- ✅ 3-6 months daily SaaS tool usage
- ✅ Complex prompts mastered (few-shot, CoT)

**Team criteria**:
- ✅ 50%+ team at Level 2
- ✅ 1+ AI champion (ready to become AI Tech Lead)
- ✅ Team use case identified

**Red flags**:
- ❌ <30% team uses AI daily
- ❌ No AI champion in team
- ❌ Management not aligned

---

### Delivery → Automation

**Individual criteria**:
- ✅ Level 3 validated (Skills Matrix ≥ ⭐⭐⭐ on 2+ axes)
- ✅ 1+ AI project in production (PoC → Prod)
- ✅ MLOps basics mastered

**Team criteria**:
- ✅ All members ≥ Level 2
- ✅ 50%+ team at Level 3
- ✅ 1+ member at Level 4 (Tech Lead)
- ✅ 6-12 months Delivery experience
- ✅ Operational MLOps infrastructure

**Organizational criteria**:
- ✅ AI CoE or dedicated team
- ✅ Executive sponsor (CTO/VP)
- ✅ Responsible AI policy defined

**Red flags**:
- ❌ No AI project in production
- ❌ Team <5 people or <50% Level 3
- ❌ No MLOps infrastructure
- ❌ No executive sponsor

---

## Transition Checklist

**Before moving to next framework**:

### Employee → Delivery
- [ ] 50%+ team at Level 2
- [ ] 3-6 months individual experience
- [ ] 1+ AI champion identified
- [ ] Team use case identified
- [ ] Management aligned

### Delivery → Automation
- [ ] All members ≥ Level 2, 50%+ Level 3
- [ ] 1+ member Level 4 (or ready to become)
- [ ] 6-12 months Delivery experience
- [ ] 1+ AI project in production
- [ ] Operational MLOps infrastructure
- [ ] AI CoE or formalized governance
- [ ] Executive sponsor (CTO/VP)
- [ ] Responsible AI policy defined

**When in doubt**: Stay on current framework 3-6 months. Better to consolidate than rush.
