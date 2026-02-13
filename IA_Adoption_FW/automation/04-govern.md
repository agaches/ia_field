# Phase 4: Govern - AI Governance

## Overview

Complete governance: risk management, policies, approvals, AI CoE.

## 1. Assess Risks (NIST AI RMF)

[NIST AI Risk Management Framework](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)

### Primary Risks

| Risk | Impact | Mitigation |
|--------|--------|------------|
| **Bias and discrimination** | High (legal, reputation) | Bias testing, diverse datasets |
| **Hallucinations (GenAI)** | Medium (credibility) | RAG, human-in-the-loop, validation |
| **Data poisoning** | High (integrity) | Data validation, provenance |
| **Privacy leakage** | High (GDPR) | DLP, anonymization, audits |
| **Prompt injection** | Medium (security) | Input filtering, guardrails |
| **Non-compliance** | High (fines) | Audits, documentation, policies |
| **Drift** | Medium (business value) | Continuous monitoring, retraining |

**Assessment**: Impact × Probability (1-5) → Score >15 = Critical

## 2. Essential Policies

**Acceptable AI Use**: Authorized/prohibited use cases, sensitive data restrictions

**Data Governance**: Classification, retention, GDPR/CCPA

**Model Approval**: Validation gates (dev → staging → prod), performance criteria, bias assessment

## 3. AI Center of Excellence (AI CoE)

**Role**: Centralize AI governance, standards, best practices

**Composition**:
- AI Ethics Lead
- ML Engineers (senior)
- Legal/Compliance
- Security
- Business stakeholders

**Responsibilities**: Model approval, audits, training, regulatory monitoring

## 4. Approval Process

**3 Gates**:
1. **Concept** → Use case validation, risks, data
2. **Development** → Model review, bias testing, security
3. **Production** → Final validation, monitoring, DR

**Gates**: Go/No-Go decided by AI CoE

## 5. Audits & Compliance

**Regular Audits** (quarterly):
- Policy compliance
- Bias/fairness testing
- Security (vulnerabilities, DLP)
- Model performance

**Regulatory Compliance**: EU AI Act, GDPR, CCPA, sector-specific (healthcare, finance)

## 6. Legal Compliance - Concrete Actions

### EU AI Act (Effective August 2026)

**High-risk systems** (Art. 6): Customer chatbots, credit systems, recruitment, biometrics

**Required actions**:

| Requirement | Technical Implementation | Tools Examples |
|-------------|-------------------------|----------------|
| Risk management (Art. 9) | NIST AI RMF + quarterly assessment | Risk register, audit logs |
| Data governance (Art. 10) | Data lineage + quality metrics | OpenMetadata, DataHub, Apache Atlas |
| Technical documentation (Art. 11) | Model cards (templates) | Model registry + metadata |
| Transparency (Art. 13) | User disclosure ("AI-generated content") | UI/UX requirements |
| Human oversight (Art. 14) | Human-in-the-loop (critical decisions) | Workflow approval tools |
| Accuracy/robustness (Art. 15) | Drift detection + retraining triggers | Evidently AI, NannyML, Fiddler |

**Compliance timeline**:
- **Feb 2026**: High-risk system identification (gap analysis)
- **Aug 2026**: Full compliance required (all controls operational)
- **Ongoing**: Quarterly audits + annual reassessment

### GDPR (Operational)

**Technical actions**:

| GDPR Requirement | Implementation | Validation |
|------------------|----------------|------------|
| Data minimization (Art. 5) | Anonymize training data (PII removal) | DLP scans, audit logs |
| Right to explanation (Art. 22) | Log model decisions (traceability) | Decision audit trail |
| Data retention (Art. 5) | Auto-delete logs >30 days (configurable) | Retention policies |
| Breach notification (Art. 33) | DPO notification (<72h) | Incident response playbook |
| Data portability (Art. 20) | Export user data on request | API endpoints |

**Tools**: AWS Macie / GCP DLP API / Azure Purview, Microsoft Presidio

### CCPA (California - if applicable)

**Key requirements**:
- Right to know (data collected)
- Right to delete
- Opt-out of data sale
- Privacy notice at collection

**Implementation**: Similar to GDPR controls + California-specific disclosures

### Sector-Specific (if applicable)

**Healthcare (HIPAA)**: PHI encryption, access controls, BAA with vendors, audit trails

**Finance (PCI-DSS, SOX)**: Cardholder data protection, model explainability for credit decisions, SOX controls for ML pipelines

**Insurance**: Fairness testing (protected classes), transparency in pricing models

## Govern Checklist

**Governance Framework**:
- [ ] NIST AI RMF framework implemented
- [ ] AI policies documented and enforced
- [ ] AI CoE established
- [ ] 3-gate approval process
- [ ] Regular audits (quarterly)

**Legal Compliance**:
- [ ] EU AI Act: High-risk systems identified (if applicable)
- [ ] EU AI Act: Technical documentation (model cards) ready
- [ ] GDPR: PII anonymization automated
- [ ] GDPR: Data retention policies configured (<30 days)
- [ ] GDPR: Audit trail for model decisions operational
- [ ] DLP tools deployed (AWS Macie / GCP DLP / Azure Purview)
- [ ] Sector-specific compliance validated (HIPAA, PCI-DSS, etc.)

## Next Step

→ [Phase 5: Secure](05-secure.md) - Production AI security
