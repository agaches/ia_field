# AI Governance Policy Template

> **Purpose**: Comprehensive AI governance policy for production AI systems
> **Used in**: Automation Phase 2 (Build) - Establish policies and guidelines
> **Update frequency**: Review annually, update when regulations change or major incidents occur

---

## What is an AI Governance Policy?

An AI Governance Policy defines the rules, processes, and responsibilities for developing, deploying, and managing AI systems within an organization. It ensures AI is used responsibly, ethically, securely, and in compliance with regulations.

**Key components**:
- Acceptable use guidelines (what AI can/cannot be used for)
- Model approval and deployment process
- Data governance (privacy, security, quality)
- Incident response procedures
- Roles and responsibilities

**Why you need this**:
- Reduce legal and reputational risk
- Ensure consistent AI practices across teams
- Meet compliance requirements (GDPR, SOC 2, industry regulations)
- Build trust with customers and stakeholders

---

## AI Governance Policy Template

```markdown
# AI Governance Policy

**Version**: [1.0]
**Effective Date**: [YYYY-MM-DD]
**Owner**: [CTO / CISO / Chief AI Officer]
**Approved by**: [Executive Leadership / Board]
**Next Review**: [YYYY-MM-DD]

---

## 1. Purpose and Scope

### 1.1 Purpose
This policy establishes governance for AI systems at [Organization Name] to ensure responsible, ethical, secure, and compliant use of artificial intelligence technologies.

### 1.2 Scope
This policy applies to:
- All AI systems developed internally or acquired from vendors
- All employees, contractors, and third parties working with AI systems
- All stages of the AI lifecycle: design, development, testing, deployment, monitoring, retirement

**Definitions**:
- **AI System**: Any software system that uses machine learning, deep learning, natural language processing, or other AI techniques to make predictions, recommendations, or decisions.
- **Production AI**: AI systems serving live users or making business-critical decisions.
- **High-Risk AI**: AI systems with significant impact on individuals, safety, legal rights, or business operations.

---

## 2. Acceptable Use

### 2.1 Permitted Uses
AI systems may be used for:
- [Example: Automating repetitive tasks to improve efficiency]
- [Example: Enhancing customer experiences through personalization]
- [Example: Improving decision-making with data-driven insights]
- [Example: Augmenting human capabilities, not replacing human judgment in high-stakes decisions]

### 2.2 Prohibited Uses
AI systems must NOT be used for:
- **Illegal activities**: Violating laws, regulations, or contractual obligations
- **Discrimination**: Making decisions that unfairly discriminate based on protected attributes (race, gender, age, etc.)
- **Deception**: Impersonating humans without disclosure (except where authorized, e.g., clear "AI assistant" labels)
- **Privacy violations**: Processing personal data without consent or legal basis
- **Harm**: Creating or deploying AI systems that pose unacceptable safety risks
- **Manipulation**: Using AI to manipulate, coerce, or exploit vulnerable individuals
- [Organization-specific prohibitions]

### 2.3 High-Stakes Decisions
For high-stakes decisions (hiring, credit, healthcare, legal), AI systems must:
- Include human review and override capability (human-in-the-loop)
- Provide explanations for decisions (explainable AI)
- Be subject to additional approval and monitoring (see Section 3)

---

## 3. Model Approval and Deployment

### 3.1 Approval Process
All production AI systems require approval through the following stages:

**Stage 1: Design Review**
- [ ] Use case documented and justified
- [ ] Risk assessment completed (see Section 5)
- [ ] Data sources and quality verified
- [ ] Technical feasibility confirmed
- **Approver**: [Product Manager + ML Lead]

**Stage 2: Ethics and Compliance Review**
- [ ] Fairness and bias assessment
- [ ] Privacy impact assessment (if PII involved)
- [ ] Compliance requirements verified (GDPR, SOC 2, etc.)
- [ ] Legal review completed (if high-risk)
- **Approver**: [Legal Counsel + CISO]

**Stage 3: Security Review**
- [ ] Security testing completed (adversarial robustness, prompt injection)
- [ ] Access controls configured
- [ ] Data encryption verified (at rest and in transit)
- [ ] Secrets management implemented
- **Approver**: [CISO / Security Team]

**Stage 4: Production Deployment**
- [ ] Model validation completed (performance, fairness)
- [ ] Monitoring and alerting configured
- [ ] Incident response plan documented
- [ ] Documentation complete (model card, runbooks)
- [ ] Phased rollout plan approved (canary, A/B test)
- **Approver**: [CTO / VP Engineering]

**Fast-track for low-risk systems**: Internal tools with no user impact may skip Stage 2 (document rationale).

### 3.2 Model Registry
- All production models must be registered in the central model registry
- Required metadata: version, owner, training data, performance metrics, approval date
- Models without registry entry are not permitted in production

### 3.3 Deployment Controls
- **Phased rollout**: Required for high-risk or new AI systems (5% → 50% → 100%)
- **A/B testing**: Recommended for customer-facing AI (compare to baseline or human performance)
- **Circuit breakers**: Auto-disable AI if performance degrades below threshold
- **Rollback plan**: Documented procedure to revert to previous version or disable AI

---

## 4. Data Governance

### 4.1 Data Quality
- Training data must meet minimum quality standards (accuracy, completeness, representativeness)
- Data quality assessment documented before model training
- Data versioning required (track which data trained which model)

### 4.2 Data Privacy
- **PII processing**: Requires legal basis (consent, contract, legitimate interest, or legal obligation)
- **Data minimization**: Collect only data necessary for AI system purpose
- **Anonymization**: PII must be anonymized or pseudonymized where possible
- **Data retention**: Comply with retention policies (default: delete after purpose fulfilled)
- **Data residency**: Comply with regional requirements (GDPR: EU data stays in EU)

### 4.3 Data Security
- Encryption at rest (AES-256) and in transit (TLS 1.3)
- Access controls (role-based, least privilege)
- Audit logs for data access (who accessed what data, when)
- Regular security audits (quarterly minimum)

### 4.4 Data Bias
- Training data must be assessed for bias (demographic, selection, measurement)
- Bias mitigation techniques applied where needed (resampling, reweighting, fairness constraints)
- Document known biases and limitations in model card

---

## 5. Risk Management

### 5.1 Risk Assessment
All AI systems must undergo risk assessment before deployment:

**Risk categories**:
- **Impact**: Low / Medium / High / Critical (impact on users, business, safety)
- **Likelihood**: Rare / Unlikely / Possible / Likely / Almost Certain
- **Risk level**: Impact × Likelihood

**Risk domains**:
- Bias and fairness
- Transparency and explainability
- Privacy and data protection
- Security and adversarial robustness
- Safety and reliability
- Accountability

**Risk matrix**:

| Impact / Likelihood | Rare | Unlikely | Possible | Likely | Almost Certain |
|---------------------|------|----------|----------|--------|----------------|
| **Critical**        | High | High     | Critical | Critical | Critical     |
| **High**            | Medium | High   | High     | Critical | Critical     |
| **Medium**          | Low  | Medium   | Medium   | High     | High         |
| **Low**             | Low  | Low      | Medium   | Medium   | High         |

**Actions by risk level**:
- **Low**: Standard approval process
- **Medium**: Additional monitoring and review
- **High**: Requires executive approval, enhanced controls, quarterly reviews
- **Critical**: Requires board approval, independent audit, continuous monitoring

### 5.2 Risk Register
- Maintain central risk register for all AI systems
- Review quarterly (minimum)
- Update when new risks identified or incidents occur

---

## 6. Incident Response

### 6.1 AI Incident Definition
An AI incident is any event where an AI system:
- Causes harm to users or stakeholders
- Violates policies or regulations
- Exhibits unacceptable performance (accuracy drops, bias detected, security breach)
- Generates significant negative publicity

### 6.2 Incident Severity

**Severity 1 (Critical)**:
- Safety risk to humans
- Data breach or privacy violation
- Legal or regulatory violation
- Severe reputational damage

**Severity 2 (High)**:
- Significant bias or fairness issue
- Major performance degradation (>20% drop in key metrics)
- Large-scale incorrect predictions affecting many users

**Severity 3 (Medium)**:
- Moderate performance degradation (10-20% drop)
- Isolated incorrect predictions

**Severity 4 (Low)**:
- Minor issues with limited impact

### 6.3 Incident Response Procedure

**Detect**: Monitoring alerts or user reports → Incident logged in system
**Assess**: On-call engineer assesses severity → Escalate per severity
**Respond**:
- Severity 1: Disable AI immediately, notify CISO/CTO within 1 hour
- Severity 2: Implement mitigation within 4 hours, notify VP Engineering
- Severity 3: Investigate within 24 hours
- Severity 4: Fix in next sprint

**Resolve**: Implement fix, test, redeploy
**Review**: Post-incident review within 48 hours (Severity 1-2) or 1 week (Severity 3)
**Learn**: Update policies, procedures, or models based on lessons learned

See [AI Incident Runbooks](ai-incident-runbooks.md) for detailed procedures.

---

## 7. Monitoring and Auditing

### 7.1 Continuous Monitoring
All production AI systems must have:
- **Performance monitoring**: Accuracy, latency, error rates (real-time dashboards)
- **Fairness monitoring**: Track performance by subgroup, detect bias drift
- **Data drift detection**: Alert when input distributions change
- **Concept drift detection**: Alert when model predictions become less accurate
- **Anomaly detection**: Flag unusual inputs or outputs

### 7.2 Periodic Audits
- **Quarterly reviews**: Model performance, fairness, compliance (all systems)
- **Annual audits**: Comprehensive review including security, risk assessment (high-risk systems)
- **Independent audits**: External auditors for critical systems (annually)

### 7.3 Model Performance Thresholds
Define minimum acceptable performance for each AI system:
- If metrics fall below threshold, trigger alert and investigation
- If sustained degradation, disable AI and revert to fallback (human process or previous model)

---

## 8. Transparency and Explainability

### 8.1 User Disclosure
- Users must be informed when interacting with AI systems (e.g., "This is an AI assistant")
- Exceptions: Low-stakes, internal tools only

### 8.2 Explainability Requirements
- **High-stakes decisions**: Must provide explanations (e.g., "You were declined because X")
- **Customer-facing AI**: Should provide explanations where feasible
- **Internal tools**: Explanations recommended but not required

### 8.3 Documentation
All production AI systems require:
- **Model card**: Model details, performance, limitations, ethical considerations (see [NIST AI RMF](nist-ai-rmf-implementation.md))
- **Data card**: Training data sources, quality, biases
- **System architecture**: Diagrams and technical documentation
- **Runbooks**: Operational procedures (deployment, monitoring, incident response)

---

## 9. Roles and Responsibilities

### 9.1 AI Governance Committee
- **Composition**: CTO, CISO, Legal Counsel, Ethics Lead, ML Lead
- **Responsibilities**: Approve policies, review high-risk AI systems, oversee risk management
- **Meetings**: Quarterly (minimum), ad-hoc for critical decisions

### 9.2 AI System Owner
- Responsible for AI system throughout lifecycle
- Ensures compliance with this policy
- Owns risk assessment and incident response

### 9.3 ML Engineers / Data Scientists
- Develop AI systems following policy guidelines
- Conduct fairness and bias testing
- Document models (model cards, technical docs)

### 9.4 Security Team
- Conduct security reviews and audits
- Respond to security incidents involving AI
- Maintain security controls (access, encryption, monitoring)

### 9.5 Legal and Compliance
- Review high-risk AI systems for legal compliance
- Advise on privacy, data protection, and regulatory requirements
- Investigate legal incidents

### 9.6 Executive Sponsor
- Provides strategic direction for AI initiatives
- Approves high-risk and critical AI systems
- Allocates resources for responsible AI

---

## 10. Training and Awareness

### 10.1 Required Training
- **All employees**: AI awareness training (1 hour, annually)
- **AI practitioners**: Responsible AI training (4 hours, annually)
- **Leadership**: AI ethics and governance (2 hours, annually)

### 10.2 Training Content
- This policy and procedures
- Responsible AI principles (fairness, transparency, privacy, security, safety, accountability)
- Bias detection and mitigation
- Privacy and data protection (GDPR, etc.)
- Incident reporting

---

## 11. Third-Party AI Systems

### 11.1 Vendor Assessment
Third-party AI systems (e.g., SaaS AI tools, purchased models) must be assessed:
- [ ] Vendor security and privacy policies reviewed
- [ ] Data processing agreements signed (if PII involved)
- [ ] Model performance and bias testing (if feasible)
- [ ] Compliance with regulations verified (GDPR, etc.)
- [ ] Vendor certifications validated (SOC 2, ISO 27001, etc.)

### 11.2 Acceptable Vendors
Maintain list of approved AI vendors (updated quarterly)

### 11.3 Vendor Monitoring
- Periodic reviews of vendor AI systems (annually)
- Incident reporting required from vendors

---

## 12. Policy Compliance

### 12.1 Enforcement
- Violations of this policy may result in disciplinary action
- Intentional misuse of AI systems may result in termination
- Repeated violations may result in loss of access to AI systems

### 12.2 Reporting Violations
- Employees must report policy violations to [Ethics Hotline / Manager / Legal]
- Anonymous reporting available
- No retaliation for good-faith reports

### 12.3 Exceptions
- Exceptions to this policy require written approval from [CTO + CISO + Legal]
- Document rationale and compensating controls

---

## 13. Policy Review and Updates

### 13.1 Review Schedule
- Annual review (minimum)
- Update when regulations change, major incidents occur, or technology evolves

### 13.2 Version Control
- All policy versions maintained in [document management system]
- Changes communicated to all employees

---

## Appendix: AI Risk Assessment Template

Use this template for all AI systems before deployment:

**AI System**: [Name]
**Owner**: [Person/Team]
**Date**: [YYYY-MM-DD]

**1. System Description**:
[What does it do? Who uses it? What decisions does it make?]

**2. Impact Level**: [Low / Medium / High / Critical]
[Justify based on potential harm, scale of impact, reversibility]

**3. Risk Domains**:
- **Bias/Fairness**: [Assessment]
- **Transparency**: [Assessment]
- **Privacy**: [Assessment]
- **Security**: [Assessment]
- **Safety**: [Assessment]
- **Accountability**: [Assessment]

**4. Risk Level**: [Low / Medium / High / Critical]
[Impact × Likelihood from risk matrix]

**5. Mitigation Strategies**:
[How will risks be addressed?]

**6. Approval Required**:
[Based on risk level: Standard / Executive / Board]
```

---

## Example AI Governance Policy (Condensed)

**Company**: TechCorp Inc.
**Version**: 1.0
**Effective**: 2026-01-01
**Owner**: CTO (Alice)

### Acceptable Use
- **Permitted**: Customer support automation, product recommendations, data analysis
- **Prohibited**: Hiring decisions without human review, medical diagnoses, impersonating humans without disclosure

### Approval Process
- All production AI requires: Design review → Ethics review → Security review → CTO approval
- High-risk AI (hiring, credit): + Legal review + Executive approval

### Data Governance
- PII anonymized where possible
- Data retention: 90 days (unless legal requirement)
- EU customer data stays in EU (GDPR)

### Monitoring
- Real-time dashboards (accuracy, latency, fairness)
- Quarterly reviews (all systems)
- Annual audits (high-risk systems)

### Incident Response
- Severity 1: Disable AI, notify CISO within 1 hour
- Post-incident review within 48 hours

### Roles
- **AI Governance Committee**: CTO, CISO, Legal, ML Lead (quarterly meetings)
- **AI Owners**: Assigned per system, responsible for compliance

### Training
- All employees: 1-hour AI awareness (annually)
- AI practitioners: 4-hour responsible AI (annually)

---

## Blank Policy Template

Copy and customize:

```markdown
# AI Governance Policy

**Version**: 1.0
**Effective Date**: [YYYY-MM-DD]
**Owner**: [Role]
**Next Review**: [YYYY-MM-DD]

## 1. Purpose and Scope
[Define purpose, scope, definitions]

## 2. Acceptable Use
[Permitted and prohibited uses]

## 3. Approval Process
[Stages, approvers, requirements]

## 4. Data Governance
[Quality, privacy, security, bias]

## 5. Risk Management
[Risk assessment, register, mitigation]

## 6. Incident Response
[Definition, severity, procedure]

## 7. Monitoring
[Continuous monitoring, audits]

## 8. Transparency
[Disclosure, explainability, documentation]

## 9. Roles
[Governance committee, owners, practitioners]

## 10. Training
[Required training by role]

## 11. Third-Party AI
[Vendor assessment, monitoring]

## 12. Compliance
[Enforcement, reporting violations, exceptions]

## 13. Review
[Review schedule, version control]
```

---

## Related Templates

- [NIST AI RMF Implementation](nist-ai-rmf-implementation.md) - Risk management framework
- [Compliance Requirements Checklist](compliance-requirements-checklist.md) - Multi-jurisdiction compliance (incl. EU AI Act)
- [AI Incident Runbooks](ai-incident-runbooks.md) - Incident response procedures
- [Compliance Requirements Checklist](compliance-requirements-checklist.md) - Legal compliance
- [Model Retraining Playbook](model-retraining-playbook.md) - Model lifecycle management
