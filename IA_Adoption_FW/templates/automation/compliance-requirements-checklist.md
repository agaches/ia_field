# Compliance Requirements Checklist

> **Purpose**: Identify all regulatory and compliance requirements for production AI
> **Used in**: Automation Phase 1 (Prepare) - Identify regulatory requirements
> **Update frequency**: Quarterly, or when regulations change

---

## General AI Regulations

### EU AI Act (if operating in EU)

**Risk classification** (determine your category):

| Risk Level | Description | Requirements | Examples |
|------------|-------------|--------------|----------|
| **Unacceptable** | Prohibited AI systems | ❌ Cannot deploy | Social scoring, subliminal manipulation |
| **High-risk** | Strict compliance required | 📋 Full compliance | Biometric ID, credit scoring, hiring |
| **Limited risk** | Transparency obligations | 📝 User disclosure | Chatbots, deepfakes |
| **Minimal risk** | No specific requirements | ✅ Voluntary best practices | Spam filters, recommendations |

**High-risk AI checklist** (if applicable):
- [ ] Risk management system (NIST AI RMF)
- [ ] Data governance (quality, lineage, bias prevention)
- [ ] Technical documentation (model cards, architecture)
- [ ] Record-keeping (logging all AI decisions)
- [ ] Transparency requirements (users know it's AI)
- [ ] Human oversight (human-in-the-loop for critical decisions)
- [ ] Accuracy and robustness testing
- [ ] Cybersecurity measures
- [ ] Conformity assessment (third-party audit)

**Timeline**: EU AI Act fully applicable **August 2026**

---

### GDPR / Privacy Laws

**Applicable if**: Processing personal data of EU residents

**Checklist**:
- [ ] **Data minimization**: Collect only necessary data
- [ ] **Purpose limitation**: Use data only for stated purpose
- [ ] **Right to explanation**: AI decisions must be explainable
- [ ] **Right to be forgotten**: Delete user data on request
- [ ] **Data portability**: Export user data on request
- [ ] **Consent management**: Explicit consent for AI processing
- [ ] **Breach notification**: Notify within 72 hours
- [ ] **Data Protection Impact Assessment (DPIA)**: Required for high-risk AI
- [ ] **Data Processing Agreements (DPAs)**: With AI vendors
- [ ] **Cross-border data transfer**: Adequate protections (SCCs, DPF)

**Penalties**: Up to €20M or 4% of global revenue (whichever is higher)

---

## Sector-Specific Compliance

### Healthcare (HIPAA/HITECH - US)

**Applicable if**: Processing Protected Health Information (PHI)

**Checklist**:
- [ ] **Business Associate Agreements (BAAs)**: With AI vendors
- [ ] **Encryption**: PHI encrypted at rest and in transit (AES-256)
- [ ] **Access controls**: Role-based access (RBAC), least privilege
- [ ] **Audit logs**: All PHI access logged and retained
- [ ] **Risk assessments**: Annual security risk assessment
- [ ] **Breach notification**: Notify within 60 days
- [ ] **Patient rights**: Access, amendment, accounting of disclosures
- [ ] **Minimum necessary**: Only use PHI required for task

**Penalties**: Up to $1.9M per violation category per year

---

### Finance (SOX, PCI-DSS, Banking Regulations)

**SOX (Sarbanes-Oxley)** - if publicly traded:
- [ ] **Model governance**: Documented approval and change management
- [ ] **Financial controls**: AI decisions affecting financial reporting audited
- [ ] **Audit trails**: All changes to models/data logged
- [ ] **Segregation of duties**: Separate development and production access

**PCI-DSS** - if processing payment data:
- [ ] **Cardholder data**: Never stored in AI training data
- [ ] **Tokenization**: Use tokens, not real card numbers
- [ ] **Network segmentation**: AI systems isolated from payment processing
- [ ] **Quarterly scans**: Vulnerability scanning and penetration testing

**Banking (Basel III, MiFID II, etc.)**:
- [ ] **Model risk management**: Basel Committee principles
- [ ] **Explainability**: AI decisions in lending/trading must be explainable
- [ ] **Stress testing**: AI models tested under adverse scenarios
- [ ] **Regulatory reporting**: AI models reported to regulators

---

### Insurance

**Applicable regulations**: Varies by jurisdiction (e.g., US states, EU Solvency II)

**Checklist**:
- [ ] **Fairness testing**: No discrimination on protected attributes
- [ ] **Actuarial soundness**: AI models reviewed by actuary
- [ ] **Transparency**: Policyholders informed if AI used in underwriting/pricing
- [ ] **Human review**: High-stakes decisions (claims denial) require human review
- [ ] **Rate filing**: AI-based rates filed with insurance regulator
- [ ] **Data security**: Customer data protected per state laws

**Common requirements**:
- Demographic parity testing (age, gender, race)
- Adverse action notices (if AI denies coverage/increases premium)

---

## Jurisdiction-Specific

### United States

**Federal**:
- [ ] **FTC Act**: No unfair/deceptive practices (AI must not mislead)
- [ ] **Fair Credit Reporting Act (FCRA)**: If AI affects credit decisions
- [ ] **Equal Credit Opportunity Act (ECOA)**: No credit discrimination
- [ ] **Civil Rights Act**: Employment AI must not discriminate

**State laws** (examples):
- [ ] **California (CCPA/CPRA)**: Consumer privacy rights (similar to GDPR)
- [ ] **Colorado AI Act (2024)**: High-risk AI systems require impact assessments
- [ ] **New York City (Local Law 144)**: Automated employment decision tools audit

---

### United Kingdom

- [ ] **UK GDPR**: Similar to EU GDPR
- [ ] **Data Protection Act 2018**: Additional UK data protection rules
- [ ] **Equality Act 2010**: AI must not discriminate on protected characteristics

---

### China

- [ ] **Personal Information Protection Law (PIPL)**: Data privacy (GDPR-like)
- [ ] **Algorithmic Recommendation Regulations**: Algorithm transparency
- [ ] **Deep Synthesis Regulations**: Deepfake disclosure requirements
- [ ] **Cybersecurity Law**: Data localization and security reviews

---

## Compliance Assessment Template

### Use Case: [Your AI System]

**Data processed**:
- [ ] Personal data (names, emails, etc.)
- [ ] Sensitive data (health, financial, biometric)
- [ ] Payment data (credit cards)
- [ ] Minors' data

**Geography**:
- [ ] EU (GDPR, EU AI Act)
- [ ] US - States: [List]
- [ ] UK
- [ ] China
- [ ] Other: [List]

**Sector**:
- [ ] Healthcare
- [ ] Finance
- [ ] Insurance
- [ ] Employment
- [ ] Consumer
- [ ] Other: [Specify]

---

### Applicable Regulations

| Regulation | Applicable? | Requirements | Owner | Status |
|------------|-------------|--------------|-------|--------|
| **EU AI Act** | Yes/No | [List key requirements] | Legal | Not Started |
| **GDPR** | Yes/No | [List key requirements] | DPO | Not Started |
| **HIPAA** | Yes/No | [List key requirements] | Compliance | N/A |
| **PCI-DSS** | Yes/No | [List key requirements] | Security | N/A |
| **[Other]** | Yes/No | [List key requirements] | [Owner] | [Status] |

---

### Compliance Roadmap

| Requirement | Deadline | Owner | Status | Blockers |
|-------------|----------|-------|--------|----------|
| DPIA (GDPR) | 2026-04-01 | Legal | In Progress | Waiting on risk assessment |
| BAA with OpenAI | 2026-03-15 | Procurement | Not Started | Contract negotiation |
| Fairness audit | 2026-05-01 | ML Team | Not Started | Need bias testing tools |
| Conformity assessment (EU AI Act) | 2026-07-01 | External Auditor | Not Started | Need to select auditor |

---

## Red Flags - Do Not Proceed If:

- ❌ Applicable regulations unclear (consult legal counsel)
- ❌ High-risk AI under EU AI Act but no compliance plan
- ❌ Processing PHI/PII without required safeguards
- ❌ No legal/compliance team engaged
- ❌ Regulatory approval required but not obtained

**When in doubt**: Consult legal/compliance experts. Regulatory penalties can be existential.

---

## Related Templates

- [Organization Readiness Assessment](organization-readiness-assessment.md) - Team and budget
- [AI Governance Policy](ai-governance-policy.md) - Implement governance
- [EU AI Act Compliance](eu-ai-act-compliance.md) - Detailed EU AI Act checklist
