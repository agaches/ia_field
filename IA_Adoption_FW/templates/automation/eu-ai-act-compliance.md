# EU AI Act Compliance Checklist

> **Purpose**: Compliance checklist for EU Artificial Intelligence Act
> **Used in**: Automation Phase 2 (Build) - Ensure regulatory compliance
> **Update frequency**: Review quarterly, update when regulations change

---

## What is the EU AI Act?

The EU Artificial Intelligence Act is the world's first comprehensive AI regulation, effective from 2026. It uses a risk-based approach with four categories: **Unacceptable Risk** (banned), **High Risk** (strict requirements), **Limited Risk** (transparency obligations), and **Minimal Risk** (no obligations).

**When this applies**:
- AI systems placed on the EU market or affecting EU residents
- General-purpose AI models (GPAIs) with >10^25 FLOPs training compute
- Applies to providers, deployers, importers, and distributors

**Penalties**:
- **Prohibited AI**: Up to €35M or 7% global annual turnover
- **High-risk violations**: Up to €15M or 3% global annual turnover
- **Other violations**: Up to €7.5M or 1.5% global annual turnover

---

## Risk Classification Decision Tree

**Step 1: Is your AI system prohibited?**
- [ ] Social scoring by governments → **BANNED**
- [ ] Exploiting vulnerabilities of specific groups (children, disabled, elderly) → **BANNED**
- [ ] Subliminal manipulation causing harm → **BANNED**
- [ ] Real-time remote biometric identification in public spaces (with exceptions for law enforcement) → **BANNED**

If YES to any → **Stop. Cannot deploy.**

**Step 2: Is your AI system high-risk?**

**High-risk by sector (Annex III)**:
- [ ] **Biometrics**: Identification, categorization, emotion recognition
- [ ] **Critical infrastructure**: Energy, transport, water, gas, health
- [ ] **Education**: Access, assessment, evaluation of students
- [ ] **Employment**: Recruitment, task allocation, promotion, termination, performance monitoring
- [ ] **Essential services**: Credit scoring, creditworthiness, insurance pricing
- [ ] **Law enforcement**: Risk assessment, lie detection, crime analytics, evidence evaluation
- [ ] **Migration**: Asylum, visa, border control risk assessment
- [ ] **Justice**: Legal research, case outcome prediction

**High-risk by use case**:
- [ ] Safety component of products (toys, aviation, cars, medical devices, machinery)
- [ ] Product must undergo third-party conformity assessment

If YES to any → **High-Risk AI** (see High-Risk Checklist below)

**Step 3: Limited risk?**
- [ ] Interacts with humans (chatbots, virtual assistants)
- [ ] Generates synthetic content (deepfakes, AI-generated text/images/audio)
- [ ] Emotion recognition or biometric categorization (non-prohibited uses)

If YES → **Limited Risk** (transparency requirements only)

**Step 4: All others**
→ **Minimal Risk** (no specific obligations, but GPAI rules may apply)

---

## High-Risk AI Compliance Checklist

If your AI system is classified as **High-Risk**, comply with all requirements below:

### 1. Risk Management System

- [ ] Risk management system established (documented process)
- [ ] Risk identification across AI lifecycle (data, design, deployment, use)
- [ ] Risk estimation (severity × probability)
- [ ] Risk evaluation against acceptable thresholds
- [ ] Risk mitigation measures implemented
- [ ] Residual risks communicated to users
- [ ] Testing of risk mitigation effectiveness
- [ ] Periodic review (at least annually or after significant changes)

**Documentation**:
- [ ] Risk management plan documented
- [ ] Risk register maintained

---

### 2. Data and Data Governance

**Training, validation, testing data**:
- [ ] Data governance practices established
- [ ] Data quality criteria defined (relevance, completeness, accuracy)
- [ ] Appropriate statistical properties (representativeness, balance)
- [ ] Biases identified and mitigated (to extent appropriate for intended purpose)
- [ ] Data gaps identified and addressed
- [ ] Data provenance documented (sources, collection methods)

**Data processing**:
- [ ] Data cleaning procedures documented
- [ ] Data labeling procedures documented (if applicable)
- [ ] Data augmentation documented (if used)
- [ ] Data splitting strategy documented (train/validation/test)

**Special categories of personal data** (race, ethnicity, health, etc.):
- [ ] Justified necessity documented (if used)
- [ ] Appropriate safeguards implemented
- [ ] GDPR compliance verified (legal basis, data subject rights)

---

### 3. Technical Documentation

**Required documentation** (must be kept up-to-date):
- [ ] General description of AI system (purpose, intended users)
- [ ] Detailed design specifications (architecture, algorithms, parameters)
- [ ] Data requirements and data used (sources, quality, preprocessing)
- [ ] Computational resources (hardware, software, dependencies)
- [ ] Training methodology (hyperparameters, optimization, stopping criteria)
- [ ] Validation and testing procedures
- [ ] Performance metrics (accuracy, precision, recall, F1, etc.)
- [ ] Limitations and expected operational constraints
- [ ] Instructions for use (installation, configuration, operation)
- [ ] Human oversight measures (see Section 5)
- [ ] Cybersecurity measures (see Section 6)
- [ ] Post-market monitoring plan (see Section 8)

**Keep documentation for**:
- 10 years after AI system last placed on market

---

### 4. Record-Keeping (Logging)

**Automatic logging** (to extent technically feasible):
- [ ] Logging capabilities implemented
- [ ] Logs capture: events, dates, times, outcomes
- [ ] Logs enable traceability of AI system functioning
- [ ] Logs enable post-market monitoring
- [ ] Log retention period defined (proportionate to purpose)

**Logging content**:
- [ ] Input data logged (or reference to inputs)
- [ ] Outputs/decisions logged
- [ ] Intermediate steps logged (if needed for traceability)
- [ ] Errors and anomalies logged

**Log protection**:
- [ ] Logs protected against tampering, deletion, unauthorized access
- [ ] Encryption applied (if sensitive data)
- [ ] Access controls implemented (who can view logs)

---

### 5. Transparency and User Information

**Instructions for use** (clear, comprehensive, user-friendly):
- [ ] Identity and contact details of provider
- [ ] Intended purpose of AI system
- [ ] Level of accuracy, robustness, cybersecurity
- [ ] Known limitations and expected errors
- [ ] Human oversight measures (see Section 6)
- [ ] Instructions for deployers (installation, configuration, operation)
- [ ] Hardware and software requirements
- [ ] Expected lifetime of AI system
- [ ] Maintenance and care procedures

**Disclosure to users**:
- [ ] Users informed they are interacting with AI system (unless obvious)
- [ ] Deployers informed of high-risk classification

---

### 6. Human Oversight

**Human oversight measures** (at least one required):
- [ ] Human-in-the-loop (HITL): Human reviews AI decisions before execution
- [ ] Human-on-the-loop (HOTL): Human can intervene during AI operation
- [ ] Human-in-command (HIC): Human can override AI decisions

**Requirements**:
- [ ] Oversight individuals identified and trained
- [ ] Oversight measures effective (can prevent/minimize risks)
- [ ] Oversight individuals can understand AI system capabilities and limitations
- [ ] Oversight individuals can interpret outputs correctly
- [ ] Oversight individuals can decide when not to use AI or override decision
- [ ] Oversight measures do not cause over-reliance (automation bias addressed)

**Documentation**:
- [ ] Human oversight measures documented in technical documentation
- [ ] Training materials for oversight individuals prepared

---

### 7. Accuracy, Robustness, Cybersecurity

**Accuracy**:
- [ ] Appropriate level of accuracy defined (based on intended purpose)
- [ ] Accuracy tested during development
- [ ] Accuracy metrics reported in documentation
- [ ] Accuracy maintained throughout lifecycle (monitoring in production)

**Robustness**:
- [ ] Resilience to errors, faults, inconsistencies
- [ ] Tested against edge cases, adversarial inputs
- [ ] Fallback mechanisms implemented (if AI fails)
- [ ] Graceful degradation (reduces functionality rather than full failure)

**Cybersecurity**:
- [ ] Resilience against attacks (adversarial examples, poisoning, model inversion, extraction)
- [ ] Security testing performed (penetration testing, red teaming)
- [ ] Security controls implemented (input validation, output filtering, rate limiting)
- [ ] Incident response plan for security breaches (see [AI Incident Runbooks](ai-incident-runbooks.md))
- [ ] Security patches and updates process defined

---

### 8. Quality Management System

**QMS requirements**:
- [ ] Quality management system established (ISO 9001 or equivalent)
- [ ] Quality policies defined
- [ ] Design and development controls
- [ ] Verification and validation procedures
- [ ] Post-market monitoring (see Section 9)
- [ ] Incident reporting procedures
- [ ] Corrective and preventive actions (CAPA)
- [ ] Documentation and record-keeping

**ISO 9001 certification** (recommended, not required):
- [ ] ISO 9001 certified (demonstrates QMS compliance)

---

### 9. Conformity Assessment

**Self-assessment** (internal testing, most high-risk AI):
- [ ] Technical documentation prepared
- [ ] Risk management system implemented
- [ ] Data governance implemented
- [ ] Testing performed (accuracy, robustness, cybersecurity)
- [ ] Conformity assessment documented
- [ ] EU Declaration of Conformity signed by provider

**Third-party assessment** (notified body, required for specific use cases):
- [ ] Biometric identification systems
- [ ] Critical infrastructure management
- [ ] Required for Annex I products (safety-critical)

**CE Marking**:
- [ ] CE mark affixed to AI system or packaging (indicates conformity)
- [ ] CE mark visible, legible, indelible

---

### 10. Registration and Transparency

**EU Database registration**:
- [ ] High-risk AI system registered in EU database (before market placement)
- [ ] Information provided: name, provider, intended purpose, risk management measures
- [ ] Registration updated if significant changes

**Transparency to users**:
- [ ] Users informed of high-risk classification (where appropriate)
- [ ] Users informed of limitations and expected errors

---

### 11. Post-Market Monitoring

**Monitoring plan**:
- [ ] Post-market monitoring plan documented
- [ ] Data collection methods defined (user feedback, incident reports, performance metrics)
- [ ] Monitoring frequency defined (continuous or periodic)
- [ ] Responsible persons assigned

**Performance monitoring**:
- [ ] AI system performance tracked in production (accuracy, errors, failures)
- [ ] Performance compared to development/testing phase
- [ ] Degradation detected and addressed (see [Model Performance Dashboard](model-performance-dashboard.md))

**Incident monitoring**:
- [ ] Serious incidents tracked (harm, bias, security breaches)
- [ ] Incidents reported to authorities (within 15 days)
- [ ] Root cause analysis performed
- [ ] Corrective actions implemented

**Periodic review**:
- [ ] Monitoring data reviewed (at least annually)
- [ ] Risk assessment updated based on monitoring data
- [ ] Technical documentation updated if changes made

---

### 12. Obligations for Deployers (Users of High-Risk AI)

If you **deploy** (not develop) a high-risk AI system:

- [ ] Instructions for use followed
- [ ] Human oversight implemented (as specified by provider)
- [ ] Input data quality verified (relevant, complete, accurate)
- [ ] AI system monitored during operation
- [ ] Logs maintained (as specified by provider)
- [ ] Incidents reported to provider (serious incidents to authorities)
- [ ] Data protection impact assessment (DPIA) conducted (if personal data processed)
- [ ] Consultation with workers' representatives (if workplace AI)

---

## Limited Risk AI - Transparency Obligations

If your AI system is **Limited Risk**, comply with transparency requirements:

### 1. Chatbots and Virtual Assistants
- [ ] Users informed they are interacting with AI (unless obvious from context)
- [ ] Disclosure clear and distinguishable

### 2. Emotion Recognition and Biometric Categorization
- [ ] Users informed before processing (clear notice)
- [ ] Exceptions: Law enforcement, biometric categorization for labeling/filtering datasets

### 3. Deepfakes and Synthetic Content
- [ ] Content labeled as AI-generated (text, images, audio, video)
- [ ] Label machine-readable (metadata) and human-readable
- [ ] Exceptions: Content for artistic, satirical, or similar purposes (but label if risk of harm)

---

## General-Purpose AI (GPAI) Models

If you develop **general-purpose AI models** (e.g., LLMs like GPT, Claude, Llama):

### GPAI - Standard Models

- [ ] Technical documentation prepared (architecture, training data, capabilities, limitations)
- [ ] Compliance with copyright law (training data sources documented)
- [ ] Publicly available summary of training data

### GPAI - Systemic Risk Models (>10^25 FLOPs)

**Additional requirements** (beyond standard GPAI):
- [ ] Model evaluation (adversarial testing, red teaming)
- [ ] Systemic risks assessed (cybersecurity, public health, safety, fundamental rights)
- [ ] Risk mitigation measures implemented
- [ ] Serious incidents tracked and reported to authorities
- [ ] Cybersecurity protections (model weights, training infrastructure)

**Examples of systemic risk models**:
- GPT-4, Claude 3, Gemini Ultra, Llama 3 405B (all >10^25 FLOPs)

---

## EU AI Act Compliance Example

**Company**: TechCorp Inc.
**AI System**: Hiring Candidate Screener
**Classification**: **High-Risk** (employment use case)
**Date**: 2026-02-15

### Compliance Status

**Risk Management** ✅:
- Risk management system documented (v1.0)
- Risks identified: bias (gender, race), privacy (candidate data), security (data breaches)
- Mitigation: Bias testing, anonymization, encryption, human review

**Data Governance** ✅:
- Training data: 100k historical candidate profiles (anonymized)
- Bias testing: Gender parity verified (50% male, 50% female), racial representation assessed
- Data quality: 95% complete (5% missing fields imputed)

**Technical Documentation** ✅:
- Architecture: BERT fine-tuned on job descriptions + candidate profiles
- Performance: 78% accuracy vs human recruiters
- Limitations: Struggles with non-traditional backgrounds, English-only

**Logging** ✅:
- All candidate screenings logged (input resumes, output scores, timestamps)
- Logs retained for 3 years (compliance + audit)

**Transparency** ✅:
- Candidates informed: "AI-assisted screening. Human review follows."
- Instructions for HR team documented (installation, configuration, operation)

**Human Oversight** ✅:
- Human-in-the-loop: HR manager reviews all AI recommendations before decisions
- Training: 2-hour session for HR team on AI limitations and bias awareness

**Accuracy/Robustness** ✅:
- Accuracy: 78% (acceptable for screening, not final decision)
- Robustness: Tested with adversarial resumes (keyword stuffing), filters applied
- Cybersecurity: Input validation, output filtering, encryption at rest/transit

**Quality Management** ✅:
- ISO 9001 certified (company-wide)
- Quarterly reviews of AI performance and bias metrics

**Conformity Assessment** ✅:
- Self-assessment completed (internal testing)
- EU Declaration of Conformity signed by CTO
- CE mark affixed (digital label)

**Registration** ✅:
- Registered in EU database (entry ID: AI-2026-HIRE-001)

**Post-Market Monitoring** ✅:
- Monthly performance reviews (accuracy, bias, incidents)
- Incidents tracked (1 bias complaint in 6 months, investigated, no action needed)

---

## Blank Compliance Checklist

Copy for your project:

```markdown
# EU AI Act Compliance - [AI System Name]

**System**: [Name]
**Classification**: [Prohibited / High-Risk / Limited Risk / Minimal Risk]
**Provider**: [Company]
**Date**: [YYYY-MM-DD]
**Status**: [Planning / In Progress / Compliant]

---

## Risk Classification
- [ ] Prohibited AI assessment completed → Result: [Not Prohibited]
- [ ] High-risk assessment completed → Result: [High-Risk / Not High-Risk]
- [ ] Limited risk assessment completed → Result: [Limited Risk / Not Limited Risk]

---

## High-Risk AI Checklist (if applicable)

### 1. Risk Management
- [ ] Risk management system established
- [ ] Risks identified and documented
- [ ] Mitigation measures implemented
- [ ] Periodic review scheduled

### 2. Data Governance
- [ ] Data quality criteria defined
- [ ] Biases identified and mitigated
- [ ] Data provenance documented

### 3. Technical Documentation
- [ ] System description
- [ ] Design specifications
- [ ] Performance metrics
- [ ] Limitations documented
- [ ] Instructions for use

### 4. Logging
- [ ] Logging implemented
- [ ] Logs protected

### 5. Transparency
- [ ] Instructions for use prepared
- [ ] Users informed of AI use

### 6. Human Oversight
- [ ] Oversight measures implemented
- [ ] Oversight individuals trained

### 7. Accuracy/Robustness/Security
- [ ] Accuracy targets defined and tested
- [ ] Robustness tested
- [ ] Cybersecurity measures implemented

### 8. Quality Management System
- [ ] QMS established

### 9. Conformity Assessment
- [ ] Self-assessment completed (or third-party if required)
- [ ] EU Declaration of Conformity signed
- [ ] CE mark affixed

### 10. Registration
- [ ] Registered in EU database

### 11. Post-Market Monitoring
- [ ] Monitoring plan documented
- [ ] Performance tracked
- [ ] Incidents reported

---

## Limited Risk Checklist (if applicable)
- [ ] Transparency requirements met (chatbots, emotion recognition, deepfakes)

---

## GPAI Checklist (if applicable)
- [ ] Technical documentation prepared
- [ ] Training data summary published
- [ ] Systemic risk assessment (if >10^25 FLOPs)

---

## Validation
- [ ] All applicable checklists completed
- [ ] Documentation reviewed by legal counsel
- [ ] Compliance verified before market placement
```

---

## Key Deadlines

- **August 2024**: Prohibited AI rules apply
- **February 2025**: GPAI model rules apply
- **August 2026**: High-risk AI rules apply (existing systems)
- **August 2027**: Full enforcement (new and existing systems)

**Recommendation**: Start compliance work now. High-risk AI requires significant documentation and testing (6-12 months minimum).

---

## Related Templates

- [NIST AI RMF Implementation](nist-ai-rmf-implementation.md) - Risk management framework
- [AI Governance Policy](ai-governance-policy.md) - Internal governance policies
- [Compliance Requirements Checklist](compliance-requirements-checklist.md) - Multi-jurisdiction compliance
- [Model Performance Dashboard](model-performance-dashboard.md) - Post-market monitoring
- [AI Incident Runbooks](ai-incident-runbooks.md) - Incident response procedures
