# Organization AI Readiness Assessment

> **Purpose**: Validate organizational capacity for production AI deployment
> **Used in**: Automation Phase 1 (Prepare) - Assess organizational readiness
> **Update frequency**: Once during planning, revisit quarterly

---

## Assessment Framework

Evaluate readiness across 5 dimensions:

1. **Team Composition** - Right skills and roles
2. **Executive Sponsorship** - C-level commitment
3. **Organizational Maturity** - Prior AI/ML experience
4. **Budget & Resources** - Adequate investment
5. **Risk Tolerance** - Acceptance of AI risks

**Scoring**: Each dimension rated 1-5 (1=Not Ready, 5=Fully Ready)
**Threshold**: Overall score ≥18/25 to proceed

---

## 1. Team Composition Assessment

**Required roles and skills**:

| Role | Skills Required | Level | Minimum Count | Current | Gap |
|------|-----------------|-------|---------------|---------|-----|
| **ML Engineer** | RAG, fine-tuning, MLOps | 3-4 | 2 | 2 | ✅ 0 |
| **Data Engineer** | ETL, pipelines, vector DBs | 3 | 1 | 1 | ✅ 0 |
| **DevOps/SRE** | K8s, monitoring, DR/BC | 3 | 1 | 0 | ❌ 1 |
| **Architect** | System design, AI patterns | 4 | 1 | 1 | ✅ 0 |
| **Product Owner** | AI use cases, metrics | 2-3 | 1 | 1 | ✅ 0 |
| **Security Engineer** | AI security, compliance | 3 | 1 | 0 | ❌ 1 |

**Assessment**:
- ✅ Core team present (ML, Data, Architect, PO)
- ❌ Gaps: DevOps/SRE, Security Engineer

**Action**: Hire or train 2 positions before proceeding

---

### Team Maturity Validation

**Prerequisites checklist**:
- [ ] All team members ≥Level 2 (AI fundamentals)
- [ ] ≥50% team at Level 3 (advanced AI/ML)
- [ ] ≥1 team member at Level 4 (expert, architecture)
- [ ] Team has 6+ months Delivery framework experience
- [ ] Team has deployed production systems before

**Current status**: 4/5 met → ⚠️ Need 1 more Level 3 engineer

**Recommendation**: Upskill 1 Level 2 engineer to Level 3 (3-6 months training)

---

## 2. Executive Sponsorship Assessment

**Sponsor commitment checklist**:

| Criteria | Required | Current | Status |
|----------|----------|---------|--------|
| **Executive Level** | CTO/VP or higher | VP Engineering | ✅ |
| **Engaged** | Active, not delegated | Weekly check-ins | ✅ |
| **Budget Authority** | Approved tens-hundreds k$/mo | $150k/mo approved | ✅ |
| **Organizational Priority** | Top-3 company priority | Priority #2 | ✅ |
| **Resource Commitment** | Team protected, no distractions | Dedicated team | ✅ |
| **Risk Acceptance** | Understands AI risks | Briefed on risks | ✅ |
| **Long-term Vision** | 12-24 month commitment | 18-month commitment | ✅ |

**Score**: 7/7 → ✅ **Strong sponsorship**

**Evidence**:
- VP Engineering committed to $150k/month for 18 months
- Weekly 1:1 with team lead
- AI initiative is company OKR #2 for 2026

---

## 3. Organizational Maturity Assessment

**Prior experience**:

| Experience Area | Level (1-5) | Evidence |
|----------------|-------------|----------|
| **Production ML systems** | 4 | Fraud detection system live for 2 years |
| **AI/ML team history** | 3 | Data science team 3 years old |
| **MLOps maturity** | 2 | Basic CI/CD, no model monitoring |
| **Delivery framework adoption** | 4 | 6 months using Delivery framework |
| **Cloud infrastructure** | 5 | AWS for 5 years, well-architected |

**Average maturity**: 3.6/5 → ✅ **Good foundation**

**Strengths**:
- Proven ML system in production (fraud detection)
- Strong cloud foundation (AWS)
- Team using Delivery framework (Level 2-3)

**Weaknesses**:
- MLOps immature (no drift detection, basic monitoring)
- Need to build production AI operations capability

---

## 4. Budget & Resources Assessment

**Realistic budget for production AI** (6-12 months):

| Cost Category | Monthly Estimate | Annual | Status |
|---------------|------------------|--------|--------|
| **LLM API costs** | $20k | $240k | ✅ Approved |
| **Infrastructure** | $10k | $120k | ✅ Approved |
| **Tools & SaaS** | $5k | $60k | ✅ Approved |
| **Team (4 FTEs fully loaded)** | $100k | $1.2M | ✅ Approved |
| **Security & Compliance** | $5k | $60k | ✅ Approved |
| **Contingency (20%)** | $28k | $336k | ⚠️ Not approved |
| **Total** | **$168k/mo** | **$2M/year** | **$150k approved** ⚠️ |

**Budget gap**: $18k/month ($216k/year)

**Recommendation**:
- Negotiate additional $20k/month contingency
- OR reduce scope (phase rollout to reduce API costs)

---

## 5. Risk Tolerance Assessment

**Organizational risk appetite**:

| Risk Category | Tolerance (1-5) | Notes |
|---------------|-----------------|-------|
| **Technical failure** | 4 | Accepting of learning through failure |
| **Reputational risk** | 3 | Moderate tolerance (B2B, not consumer) |
| **Financial investment** | 4 | Willing to invest for strategic advantage |
| **Regulatory compliance** | 5 | Zero tolerance (financial sector) |
| **Data privacy breach** | 5 | Zero tolerance (GDPR critical) |

**Average risk tolerance**: 4.2/5 → ✅ **Appropriate for AI**

**Risk posture**:
- High tolerance for technical/business risk (good for innovation)
- Zero tolerance for compliance/privacy (appropriate for sector)

**Alignment with AI needs**: ✅ Well-aligned

---

## Overall Readiness Score

| Dimension | Score (1-5) | Weight | Weighted Score |
|-----------|-------------|--------|----------------|
| Team Composition | 3 (gaps exist) | 2x | 6 |
| Executive Sponsorship | 5 (excellent) | 2x | 10 |
| Organizational Maturity | 4 (good) | 1x | 4 |
| Budget & Resources | 4 (minor gap) | 1x | 4 |
| Risk Tolerance | 4 (appropriate) | 1x | 4 |
| **Total** | | | **28/40** |

**Readiness level**: **70%** → ⚠️ **Almost Ready**

**Decision**: **Proceed with mitigations**

**Required actions before full deployment**:
1. Fill 2 role gaps (DevOps/SRE, Security Engineer) - 3 months
2. Upskill 1 engineer to Level 3 - 3 months
3. Secure additional $20k/month contingency budget - 1 month
4. Implement basic MLOps (drift detection, monitoring) - 2 months

**Timeline**: 3 months to address gaps → **Target production**: Q3 2026

---

## Red Flags - Do Not Proceed If:

- ❌ Executive sponsor not engaged (delegated, inconsistent)
- ❌ Team <50% at Level 3 (insufficient expertise)
- ❌ No Level 4 architect (no one can design system)
- ❌ Budget <$100k/month (insufficient for production AI)
- ❌ Zero ML production experience (too risky for first project)
- ❌ Compliance requirements unclear (regulatory risk)

---

## Blank Template

```markdown
## Team Composition

| Role | Level | Min Count | Current | Gap |
|------|-------|-----------|---------|-----|
| ML Engineer | 3-4 | 2 | | |
| Data Engineer | 3 | 1 | | |
| DevOps/SRE | 3 | 1 | | |
| Architect | 4 | 1 | | |

**Gaps**: [List]

---

## Executive Sponsorship

- [ ] CTO/VP committed
- [ ] Active engagement
- [ ] Budget approved
- [ ] Top-3 priority

**Score**: __/7

---

## Overall Readiness

| Dimension | Score |
|-----------|-------|
| Team | __/5 |
| Sponsorship | __/5 |
| Maturity | __/5 |
| Budget | __/5 |
| Risk Tolerance | __/5 |
| **Total** | __/25 |

**Decision**: Proceed / Address Gaps / Not Ready
```

---

## Related Templates

- [Production AI Use Case Matrix](production-ai-use-case-matrix.md) - Validate business case
- [Technology Stack Decision Matrix](technology-stack-decision-matrix.md) - Choose tech stack
- [Compliance Requirements Checklist](compliance-requirements-checklist.md) - Regulatory assessment
