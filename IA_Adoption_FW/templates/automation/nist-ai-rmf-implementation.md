# NIST AI Risk Management Framework Implementation

> **Purpose**: Implement NIST AI Risk Management Framework for governance
> **Used in**: Automation Phase 2 (Build) - Establish AI governance
> **Update frequency**: Initial implementation, review annually, update with NIST updates

---

## What is NIST AI RMF?

The NIST AI Risk Management Framework (AI RMF 1.0) provides a structured approach to managing AI risks throughout the system lifecycle. It consists of 4 core functions: **Govern, Map, Measure, Manage**.

**Why use NIST AI RMF**:
- Framework for trustworthy and responsible AI
- Addresses risks: bias, transparency, security, privacy, safety
- Voluntary consensus-based standard (not regulatory)
- Compatible with other frameworks (ISO, SOC 2, EU AI Act)

**When to implement**:
- Production AI systems (Automation framework)
- High-risk AI applications (hiring, credit, healthcare, legal)
- Regulated industries or government contracts
- Organizations committed to responsible AI

---

## NIST AI RMF Four Functions

### 1. GOVERN
Cultivate organizational culture and processes for responsible AI.

### 2. MAP
Understand context, categorize AI system, identify impacts and risks.

### 3. MEASURE
Assess, analyze, and track AI risks and impacts.

### 4. MANAGE
Allocate resources, implement responses, monitor effectiveness.

---

## Implementation Checklist

### GOVERN: Organizational AI Governance

**Governance structure**:
- [ ] AI governance committee established (cross-functional: legal, ethics, security, engineering)
- [ ] Clear roles and responsibilities defined (AI owner, risk owner, approvers)
- [ ] Executive sponsor assigned
- [ ] Escalation path documented

**Policies and procedures**:
- [ ] AI acceptable use policy published (see [AI Governance Policy template](ai-governance-policy.md))
- [ ] Model approval workflow defined (dev → staging → prod)
- [ ] Risk assessment process documented
- [ ] Incident response plan for AI failures (see [AI Incident Runbooks](ai-incident-runbooks.md))

**Culture and training**:
- [ ] Responsible AI training for all AI practitioners
- [ ] Ethics training for leadership
- [ ] Awareness program for broader organization

**Accountability**:
- [ ] AI system inventory maintained (register of all AI systems)
- [ ] Ownership assigned per AI system
- [ ] Audit trail for key decisions (model selection, data sources, deployment)

**Risk management integration**:
- [ ] AI risks integrated into enterprise risk management (ERM)
- [ ] Regular risk reviews scheduled (quarterly minimum)
- [ ] Risk register maintained

---

### MAP: Context and Risk Categorization

**System context**:
- [ ] AI system purpose documented (problem being solved)
- [ ] Intended use cases defined
- [ ] Out-of-scope uses explicitly listed
- [ ] User populations identified (who will interact with the system)
- [ ] Deployment environment documented (production settings)

**Data mapping**:
- [ ] Training data sources documented
- [ ] Data quality assessed
- [ ] Data biases identified
- [ ] Data lineage tracked
- [ ] PII/sensitive data catalogued

**Risk categorization**:
- [ ] Impact level assessed (Low / Medium / High / Critical)
- [ ] Risk domains evaluated:
  - [ ] Bias and fairness
  - [ ] Transparency and explainability
  - [ ] Privacy and data protection
  - [ ] Security and adversarial robustness
  - [ ] Safety and reliability
  - [ ] Accountability

**Stakeholder analysis**:
- [ ] Affected stakeholders identified (end users, impacted groups, operators)
- [ ] Stakeholder concerns documented
- [ ] Feedback mechanisms established

---

### MEASURE: Risk Assessment and Metrics

**Performance metrics**:
- [ ] Model accuracy metrics defined (accuracy, precision, recall, F1)
- [ ] Performance tracked by subgroup (to detect bias)
- [ ] Baseline performance established
- [ ] Acceptable performance thresholds defined

**Fairness metrics**:
- [ ] Fairness metrics selected (demographic parity, equalized odds, etc.)
- [ ] Protected attributes identified (race, gender, age, etc.)
- [ ] Bias testing conducted on training data
- [ ] Bias testing conducted on model predictions
- [ ] Fairness thresholds defined (e.g., max 5% disparity)

**Explainability**:
- [ ] Explainability requirements defined (global vs local)
- [ ] Explainability methods implemented (SHAP, LIME, attention weights)
- [ ] Explanations tested with users
- [ ] Documentation of model decision logic

**Privacy**:
- [ ] Privacy impact assessment (PIA) completed
- [ ] Differential privacy evaluated (if applicable)
- [ ] Data minimization implemented
- [ ] Anonymization/pseudonymization techniques applied

**Security**:
- [ ] Adversarial robustness testing (adversarial examples)
- [ ] Model inversion risk assessed
- [ ] Prompt injection testing (for LLMs)
- [ ] Access controls verified

**Monitoring**:
- [ ] Continuous monitoring implemented (see [Model Performance Dashboard](model-performance-dashboard.md))
- [ ] Drift detection configured (data drift, concept drift)
- [ ] Anomaly detection for inputs and outputs
- [ ] Regular audits scheduled

---

### MANAGE: Risk Mitigation and Response

**Risk mitigation**:
- [ ] Mitigation strategies defined for each identified risk
- [ ] Risk acceptance documented (for residual risks)
- [ ] Risk transfer evaluated (insurance, vendor contracts)
- [ ] Risk avoidance documented (features not implemented due to risk)

**Model validation**:
- [ ] Independent model validation completed (separate team)
- [ ] Validation dataset separate from training/test data
- [ ] Edge case testing performed
- [ ] Stress testing completed

**Deployment controls**:
- [ ] Phased rollout plan (canary, blue/green)
- [ ] A/B testing with control group
- [ ] Human-in-the-loop for high-stakes decisions
- [ ] Circuit breakers configured (auto-disable if metrics degrade)

**Incident response**:
- [ ] AI incident response plan documented (see [AI Incident Runbooks](ai-incident-runbooks.md))
- [ ] Incident detection mechanisms in place
- [ ] Escalation procedures defined
- [ ] Post-incident review process

**Documentation**:
- [ ] Model card created (see Model Card template below)
- [ ] Data card created (dataset documentation)
- [ ] System architecture documented
- [ ] Risk assessment report published

**Continuous improvement**:
- [ ] Feedback loop from users to developers
- [ ] Periodic retraining plan (see [Model Retraining Playbook](model-retraining-playbook.md))
- [ ] Version control for models and data
- [ ] Lessons learned documented

---

## Example: NIST AI RMF for Customer Support Chatbot

**Company**: TechCorp Inc.
**AI System**: Customer Support Chatbot (RAG-based LLM)
**Risk Level**: Medium
**Date**: 2026-02-15

### GOVERN

**Governance committee**:
- Executive sponsor: VP Engineering (Alice)
- AI owner: ML Team Lead (Bob)
- Risk owner: CISO (Carol)
- Ethics review: Legal Counsel (David)

**Policies**:
- AI Governance Policy v1.2 (approved 2026-01-10)
- Model approval: Dev → QA → Security review → Prod
- Quarterly risk reviews scheduled

**Training**:
- All ML engineers completed "Responsible AI" course (2h, internal)
- Leadership completed ethics training (1h, external vendor)

### MAP

**System context**:
- **Purpose**: Answer customer product questions 24/7
- **Intended use**: Customer-initiated chat on website
- **Out-of-scope**: No financial advice, no medical advice, no personal data processing
- **Users**: 10k customers/month (global, 18+ years old)
- **Environment**: AWS production (us-east-1, eu-west-1)

**Data**:
- Training data: 50k product docs + 100k historical support tickets (anonymized)
- Data quality: 95% accurate (manual QA of 1k samples)
- Biases: English-only (bias toward English speakers)
- PII: All PII removed during preprocessing

**Risk categorization**:
- **Impact level**: Medium (wrong answers frustrate customers, but low financial/safety impact)
- **Risk domains**:
  - Bias: Low (product questions, not user-specific decisions)
  - Transparency: Medium (users should know it's AI)
  - Privacy: Low (no PII processed)
  - Security: Medium (prompt injection risk)
  - Safety: Low (no physical harm possible)
  - Accountability: Medium (need human escalation path)

### MEASURE

**Performance**:
- Accuracy: 85% (answers match human agent responses)
- Response time: <2 seconds P95
- User satisfaction: 4.2/5 stars (post-chat survey)
- Tracked by language: English 85%, other languages N/A (not supported)

**Fairness**:
- No protected attributes in product questions (not applicable)
- Equal accuracy across product categories (verified)

**Explainability**:
- Sources cited in responses (which documents used)
- "Why this answer?" tooltip shows retrieval scores
- Tested with 10 users (9/10 found explanations helpful)

**Privacy**:
- PIA completed (2026-01-05) - no PII collected
- Chat logs anonymized (no user names, emails stored)
- Data retention: 90 days

**Security**:
- Prompt injection testing: 50 test cases, 2 bypasses found and fixed
- Input sanitization implemented
- Output filtering for sensitive data (API keys, passwords)

**Monitoring**:
- Model performance dashboard (accuracy, latency, user satisfaction)
- Drift detection: weekly checks on input distributions
- Anomaly detection: alerts if >10% "I don't know" responses

### MANAGE

**Mitigation**:
- Risk: Hallucinated answers → Mitigation: Confidence threshold (only answer if confidence >0.7), "I don't know" otherwise
- Risk: Prompt injection → Mitigation: Input sanitization, output filtering, rate limiting
- Residual risk: Occasional wrong answers → Accepted (low impact, escalation to human agent available)

**Validation**:
- Independent QA team tested 1k queries (separate from ML team)
- Edge cases tested: gibberish input, multilingual input, adversarial prompts
- Stress testing: 5k concurrent users, latency stayed <3s

**Deployment**:
- Phased rollout: 5% of traffic → 50% → 100% (over 2 weeks)
- A/B test with human agents (50/50 split for 1 week)
- Human escalation button prominent in UI
- Circuit breaker: if accuracy drops below 75%, auto-disable and alert team

**Incident response**:
- Incidents logged in Jira (tag: ai-incident)
- Severity 1: CISO notified within 1 hour
- Post-incident review within 48 hours

**Documentation**:
- Model card published (see below)
- System architecture diagram in Confluence
- Risk assessment report shared with legal team

**Continuous improvement**:
- User feedback: thumbs up/down on every response
- Monthly review of low-rated responses
- Retraining: quarterly with new product docs

---

## Model Card Template

Model cards provide transparency about AI models. Include in every production system.

```markdown
# Model Card: [Model Name]

**Model version**: [v1.0]
**Date**: [YYYY-MM-DD]
**Owner**: [Team/Person]
**Status**: [Development / Production / Deprecated]

---

## Model Details

**Model type**: [LLM fine-tuned / RAG / Custom classifier / etc.]
**Architecture**: [GPT-4, BERT, custom CNN, etc.]
**Framework**: [TensorFlow, PyTorch, scikit-learn, etc.]
**Training data**: [Description, size, sources]
**Training procedure**: [Fine-tuning, from-scratch, transfer learning]

---

## Intended Use

**Primary use cases**:
- [Use case 1]
- [Use case 2]

**Out-of-scope uses**:
- [What the model should NOT be used for]

**Target users**: [Who should use this model]

---

## Performance

**Metrics**:
- Accuracy: [X%]
- Precision: [X%]
- Recall: [X%]
- F1 Score: [X]

**Tested on**:
- [Test dataset description]
- [Subgroup performance if applicable]

**Limitations**:
- [Known failure modes]
- [Performance degradation conditions]

---

## Fairness & Bias

**Protected attributes tested**: [Race, gender, age, etc.]
**Fairness metrics**: [Demographic parity, equalized odds, etc.]
**Bias mitigation**: [Techniques applied]

---

## Ethical Considerations

**Risks**: [Potential harms or misuse]
**Mitigations**: [How risks are addressed]

---

## Maintenance

**Monitoring**: [How model performance is tracked]
**Retraining cadence**: [How often model is updated]
**Owner**: [Contact for issues]
```

### Example Model Card: Customer Support Chatbot

```markdown
# Model Card: Customer Support Chatbot v2.1

**Model version**: v2.1
**Date**: 2026-02-10
**Owner**: ML Team (Bob)
**Status**: Production

---

## Model Details

**Model type**: RAG (Retrieval-Augmented Generation)
**Architecture**: GPT-4 Turbo (via OpenAI API) + pgvector retrieval
**Framework**: LangChain + OpenAI API
**Training data**: 50k product documents + 100k anonymized support tickets
**Training procedure**: No fine-tuning (zero-shot GPT-4 with retrieved context)

---

## Intended Use

**Primary use cases**:
- Answer product-related questions (features, pricing, troubleshooting)
- 24/7 customer support on website

**Out-of-scope uses**:
- Financial or investment advice
- Medical or health advice
- Processing personal or sensitive data

**Target users**: TechCorp customers (18+, global)

---

## Performance

**Metrics**:
- Accuracy: 85% (matches human agent responses)
- Response time: <2s P95
- User satisfaction: 4.2/5 stars

**Tested on**:
- 1k held-out customer questions (not in training data)
- Verified equal accuracy across product categories

**Limitations**:
- English only (no other languages)
- Struggles with multi-part questions (requires clarification)
- May hallucinate if confidence <0.7 (threshold configured)

---

## Fairness & Bias

**Protected attributes tested**: Not applicable (product questions, not user decisions)
**Bias mitigation**: Equal accuracy across product categories verified

---

## Ethical Considerations

**Risks**:
- Hallucinated answers may frustrate customers
- Prompt injection could bypass filters

**Mitigations**:
- Confidence threshold (only answer if >0.7)
- Human escalation button prominent
- Input sanitization and output filtering
- Rate limiting

---

## Maintenance

**Monitoring**: Real-time dashboard (accuracy, latency, satisfaction)
**Retraining cadence**: Quarterly (new product docs added)
**Owner**: Bob (ML Team Lead) - bob@techcorp.com
```

---

## Blank NIST AI RMF Checklist

Copy for your project:

```markdown
# NIST AI RMF Implementation - [Project Name]

**System**: [Name]
**Owner**: [Team/Person]
**Risk Level**: [Low / Medium / High / Critical]
**Date**: [YYYY-MM-DD]

## GOVERN
- [ ] Governance committee established
- [ ] Policies published
- [ ] Training completed
- [ ] AI system inventory maintained

## MAP
- [ ] System context documented
- [ ] Data sources mapped
- [ ] Risk categorization completed
- [ ] Stakeholders identified

## MEASURE
- [ ] Performance metrics defined
- [ ] Fairness metrics tracked
- [ ] Explainability implemented
- [ ] Privacy assessment completed
- [ ] Security testing performed
- [ ] Monitoring configured

## MANAGE
- [ ] Mitigation strategies defined
- [ ] Model validation completed
- [ ] Deployment controls implemented
- [ ] Incident response plan documented
- [ ] Model card published
- [ ] Continuous improvement process established

## Documentation
- [ ] Risk assessment report
- [ ] Model card
- [ ] Data card
- [ ] Architecture diagrams
```

---

## Related Templates

- [AI Governance Policy](ai-governance-policy.md) - Comprehensive policy template
- [EU AI Act Compliance](eu-ai-act-compliance.md) - EU regulatory compliance
- [AI Incident Runbooks](ai-incident-runbooks.md) - Incident response procedures
- [Model Retraining Playbook](model-retraining-playbook.md) - Model lifecycle management
- [Compliance Requirements Checklist](compliance-requirements-checklist.md) - Legal and regulatory compliance
