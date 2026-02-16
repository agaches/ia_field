# AI Adoption Framework

> **Cloud-agnostic, practical AI adoption framework**
> Based on Cloud Adoption Framework principles, adapted for AI needs

---

## Purpose

Structured AI adoption following the **"Person → Project → Product"** model:
- **Person** (Employee): Individual AI skills and productivity
- **Project** (Delivery): Team AI integration and processes
- **Product** (Automation): Production AI systems and operations

**Progressive maturity**: Cannot skip levels. Each builds on previous experience.

---

## 3 Frameworks

| Framework | Target | Maturity | Timeline | Budget | Key Focus |
|-----------|--------|----------|----------|--------|-----------|
| **[Employee](employee/)** | Individuals | Levels 1-2 | 2-4 weeks | $20-50/mo | Personal productivity with AI tools |
| **[Delivery](delivery/)** | Teams | Levels 2-3 | 4-8 weeks | Few k$/mo | Team processes (code review, testing) |
| **[Automation](automation/)** | Organizations | Levels 3-4 | 3-6 months | Tens-hundreds k$/mo | Production AI systems (APIs, chatbots) |

### Employee Framework - Personal AI Productivity

**For**: Individuals (tech and non-tech) starting their AI journey
**Goal**: Boost personal productivity with AI assistants
**Prerequisites**: None (start here if new to AI)

**3 Phases**:
1. **Prepare** (2-4 hours): Identify use cases, select 2-3 tools, classify data (🟢🟡🔴)
2. **Build** (4-6 hours): Setup accounts, configure security (MFA, privacy), establish backup
3. **Run** (ongoing): Daily AI hygiene, validate outputs, track ROI (≥3x target)

**Success criteria**: ≥2h/week saved, ≥3x/week usage, 0 security incidents

[→ Start Employee Framework](employee/)

---

### Delivery Framework - Team AI Integration

**For**: Development teams ready to integrate AI into collective processes
**Goal**: Improve team velocity and quality with AI augmentation
**Prerequisites**: ≥50% team uses AI daily, AI champion identified, management support

**3 Phases**:
1. **Prepare** (1-2 weeks): Assess team readiness, select top 3 processes, baseline metrics
2. **Build** (2-3 weeks): Deploy team tools, establish policies, configure security
3. **Run** (ongoing): Execute experiments, track velocity, optimize, scale

**Success criteria**: ≥3 processes AI-augmented, +15% velocity, 0 security incidents

[→ Start Delivery Framework](delivery/)

---

### Automation Framework - Production AI Systems

**For**: Organizations deploying business-critical AI in production
**Goal**: Reliable, compliant, scalable AI systems serving customers
**Prerequisites**: Team maturity (Delivery L2-3), technical skills (RAG, MLOps), executive sponsor

**3 Phases**:
1. **Prepare** (4-6 weeks): Validate business case, design architecture, assess readiness
2. **Build** (6-8 weeks): AI landing zone, NIST AI RMF governance, security controls
3. **Run** (ongoing): Production operations, ≥99.9% SLA, model lifecycle, audits

**Success criteria**: ≥1 production system, ≥99.9% SLA, 0 critical incidents, compliance validated

[→ Start Automation Framework](automation/)

---

## 3-Phase Structure

All frameworks follow **Prepare → Build → Run**:

| Phase | Employee | Delivery | Automation |
|-------|----------|----------|------------|
| **Prepare** | Use cases + Tools + Data rules | Team readiness + Processes + Metrics | Business case + Architecture + Compliance |
| **Build** | Setup + Security + Backup | Infrastructure + Policies + Training | Landing zone + Governance + Security |
| **Run** | Daily ops + ROI tracking | Experiments + Velocity + Scale | SLA monitoring + MLOps + Audits |

---

## Which Framework to Use?

**Start with Employee if**:
- ✅ You're new to AI or want to improve personal skills
- ✅ Want quick wins with low risk and low investment
- ✅ No team coordination needed yet

**Progress to Delivery when**:
- ✅ ≥50% team uses AI daily (Employee Levels 1-2)
- ✅ AI champion identified to lead team adoption
- ✅ Ready to invest in team tools and processes
- ✅ Management support and budget secured

**Progress to Automation when**:
- ✅ Team mature with 6+ months Delivery experience (Levels 2-3)
- ✅ All team members ≥Level 2, 50%+ at Level 3, ≥1 at Level 4
- ✅ Need production AI (customer-facing, business-critical)
- ✅ Executive sponsor (CTO/VP) committed
- ✅ Budget secured (tens-hundreds k$/month)

**Critical**: Do not skip frameworks. Automation without Delivery/Employee maturity = high failure risk.

---

## Getting Started

1. **Assess your level**: [SKILLS.md](SKILLS.md) (7 domains, 4 levels)
2. **Choose framework**: Levels 1-2 → [Employee](employee/) | Levels 2-3 → [Delivery](delivery/) | Levels 3-4 → [Automation](automation/)
3. **Follow Prepare → Build → Run** phases in your chosen framework

---

## Templates & Tools

29 practical templates across all frameworks: [→ Browse all templates](templates/)

Employee (3) | Delivery (5) | Automation (18) | Shared (3)

---

## Responsible AI Principles

All frameworks enforce these principles, with increasing rigor from Employee → Automation:

| Principle | Employee | Delivery | Automation |
|-----------|----------|----------|------------|
| **Fairness** | Verify outputs for stereotypes | Test tools for bias | Regular fairness audits |
| **Reliability** | Verify before using | Quality gates | ≥99.9% SLA, DR/BC |
| **Privacy** | Never share PII/secrets | Team data policies | Defense-in-depth, DLP |
| **Inclusiveness** | Accessible tool choices | Buddy system training | Multi-language, diverse users |
| **Transparency** | Understand AI outputs | Document AI processes | Model cards, XAI |
| **Accountability** | You own AI-assisted work | AI Champion + policies | AI CoE, audit trails |

---

## Additional Resources

- **[STRATEGY.md](STRATEGY.md)** — "Person → Project → Product" model deep dive
- **[TRAINING.md](TRAINING.md)** — Learning paths (Level 1→2→3→4)
- **[GLOSSARY.md](GLOSSARY.md)** — Cloud equivalences (AWS/GCP/Azure) and AI acronyms

---

## Frequently Asked Questions

**Q: Can I skip levels?**
A: No. Minimum 6-12 months: Employee (1 month) → Delivery (3 months) → Automation (3-6 months). Skipping = high failure risk.

**Q: Which cloud provider do I need?**
A: None specific. Framework is cloud-agnostic. See [GLOSSARY.md](GLOSSARY.md) for AWS/GCP/Azure equivalences.

**Q: What if my team has mixed maturity levels?**
A: Start at lowest common level. Pair Level 2+ with Level 1 members (buddy system).

**Q: Is this only for developers?**
A: Employee framework is for anyone. Delivery/Automation require technical skills.

---

Inspired by [Microsoft Cloud Adoption Framework](https://learn.microsoft.com/azure/cloud-adoption-framework/), adapted for AI adoption. Contributions welcome — open an issue or submit a PR.
