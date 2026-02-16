# Automation Framework - Production AI Systems

> **Target**: Organizations, architects, and SREs
> **Maturity**: Levels 3-4 (Advanced → Expert)
> **Timeline**: 3-6 months to production
> **Budget**: Tens-hundreds k$/month

## Purpose

Deploy business-critical AI systems in production with enterprise-grade governance, security, and operations.

**Use cases**:
- Public AI APIs serving customers
- Production chatbots and assistants
- Automated business workflows (document processing, prediction systems)
- ML/AI recommendation engines at scale

## Prerequisites

**Critical**: All prerequisites must be met. Do not skip to Automation prematurely.

- ✅ **Individual maturity**: Team members proficient with AI (Employee Levels 1-2)
- ✅ **Team maturity**: Proven delivery processes with AI integration (Delivery Levels 2-3)
- ✅ **Technical skills**: RAG, fine-tuning, MLOps, orchestration (Levels 3-4)
- ✅ **Team composition**: All members ≥Level 2, 50%+ at Level 3, ≥1 at Level 4
- ✅ **Executive sponsor**: CTO/VP backing and budget authority
- ✅ **Organizational readiness**: AI CoE or dedicated team, governance capacity

**Not ready yet?** Start with [Employee Framework](../employee/) → [Delivery Framework](../delivery/) → Automation (6-12 months minimum).

## 3-Phase Journey

| Phase | Focus | Time | Deliverable |
|-------|-------|------|-------------|
| **[1. Prepare](01-prepare.md)** | Use Cases + Architecture + Readiness | 4-6 weeks | Business case + Technical design |
| **[2. Build](02-build.md)** | Landing Zone + Governance + Security | 6-8 weeks | Production-ready infrastructure |
| **[3. Run](03-run.md)** | Operations + Monitoring + Lifecycle | Ongoing | Reliable production AI systems |

## Success Criteria (6 months)

- [ ] ≥1 production AI system deployed
- [ ] SLA compliance ≥99.9% uptime
- [ ] Zero critical security incidents
- [ ] NIST AI RMF governance implemented
- [ ] Regulatory compliance validated
- [ ] MLOps/LLMOps operations mature

## Risk Profile

| Risk Category | Level | Key Controls |
|---------------|-------|--------------|
| **Technical** | 🔴 High | Architecture review, load testing, DR/BC |
| **Security** | 🔴 Critical | Defense-in-depth, OWASP LLM Top 10, DLP |
| **Compliance** | 🔴 Critical | EU AI Act, GDPR, sector regulations |
| **Operational** | 🟠 High | 24/7 monitoring, incident response, SLA |
| **Financial** | 🟠 High | Cost monitoring, ROI tracking, optimization |
| **Reputational** | 🔴 Critical | Bias testing, human oversight, transparency |

## Automation Patterns by Domain

**Customer-Facing AI**:
- Chatbots and virtual assistants (RAG, fine-tuning)
- Content generation APIs (guardrails, moderation)
- Recommendation engines (personalization, A/B testing)

**Internal Automation**:
- Document processing (OCR, classification, extraction)
- Code generation and review (security scanning, quality gates)
- Data analysis and reporting (BI integration, anomaly detection)

**Business-Critical ML**:
- Prediction systems (fraud detection, churn prediction)
- Optimization engines (pricing, inventory, scheduling)
- Computer vision (quality control, surveillance)

## When to Use This Framework

**Use Automation if**:
- ✅ Deploying AI systems that directly impact customers or revenue
- ✅ Require SLAs, high availability, and disaster recovery
- ✅ Need regulatory compliance (EU AI Act, GDPR, sector-specific)
- ✅ Team has advanced AI/ML skills (Levels 3-4)
- ✅ Executive sponsorship and budget secured

**Stay with Delivery if**:
- Team still building AI maturity (not all at Level 2+)
- Use cases are internal productivity tools (not customer-facing)
- No regulatory/compliance requirements yet
- Budget constraints (<tens k$/month)

## Next Steps

After 6-12 months of successful production AI operations, consider:
- **AI Center of Excellence (CoE)**: Scale governance across organization
- **Multi-model orchestration**: Deploy multiple AI systems efficiently
- **Advanced MLOps**: Model monitoring, A/B testing, canary deployments
- **AI-driven product innovation**: AI as core product differentiator

---

**Need help?** Check [SKILLS.md](../SKILLS.md) for Level 3-4 assessment | [TRAINING.md](../TRAINING.md) for advanced learning paths
