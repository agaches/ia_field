# Phase 5: Secure - AI Security

## Overview

Defense-in-depth (6 layers): risk discovery, protection, detection, response.

## 1. AI Security Risks

### OWASP LLM Top 10

[OWASP Generative AI](https://genai.owasp.org/)

| Risk | Impact | Mitigation |
|--------|--------|------------|
| **LLM01: Prompt Injection** | High | Input validation, sandboxing, guardrails |
| **LLM02: Insecure Output** | High | Output validation, sanitization |
| **LLM03: Data Poisoning** | Medium | Source validation, data provenance |
| **LLM04: Model DoS** | Medium | Rate limiting, quotas |
| **LLM05: Supply Chain** | High | Provenance verification, scanning |
| **LLM06: Info Disclosure** | High | DLP, anonymization, filtering |
| **LLM07: Insecure Plugins** | Medium | Plugin validation, sandboxing |
| **LLM08: Excessive Agency** | High | Least privilege, human-in-the-loop |
| **LLM09: Overreliance** | Medium | Human validation, fact-checking |
| **LLM10: Model Theft** | Medium | Access controls, watermarking |

### MITRE ATLAS

[MITRE ATLAS](https://atlas.mitre.org/) - AI attack tactics

**Phases**: Reconnaissance → Resource Dev → Initial Access → Execution → Persistence → Exfiltration

## 2. Defense-in-depth (6 layers)

### Layer 1: Identity and Access
- Strict IAM (least privilege)
- Mandatory MFA
- RBAC for models/data

### Layer 2: Network
- Segmentation (VPC, subnets)
- DDoS protection
- Firewall + IDS/IPS

### Layer 3: Data
- Encryption (at rest + in transit)
- DLP (sensitive data scanning)
- Anonymization/pseudonymization

### Layer 4: Application
- Input/output validation
- Guardrails (prompt/output filtering)
- Rate limiting
- API abuse monitoring

### Layer 5: Models
- Model scanning (vulnerabilities)
- Watermarking (traceability)
- Adversarial testing
- Provenance verification

### Layer 6: Monitoring & Response
- SIEM (centralized logs)
- Anomaly alerts
- Incident response plan
- Regular pentesting

## 3. Data Loss Prevention (DLP)

**Prevention**:
- Automatic data classification
- Block sensitive data uploads
- PII masking in prompts/outputs

**Detection**:
- Scan conversations/logs
- Suspicious pattern alerts
- Behavioral analysis

> See [GLOSSARY.md](../GLOSSARY.md) for DLP tool options (cloud, on-premise, open-source)

## 4. AI Pentesting

**Scope**:
- Prompt injection attacks
- Model extraction attempts
- Data exfiltration vectors
- Supply chain vulnerabilities

**Frequency**: Annual (minimum) + after major changes

## Secure Checklist

- [ ] 6-layer defense-in-depth implemented
- [ ] OWASP LLM Top 10 mitigations
- [ ] Complete DLP (prevention + detection)
- [ ] SIEM + anomaly monitoring
- [ ] Incident response plan
- [ ] Annual pentesting

## Next Step

→ [Phase 6: Manage](06-manage.md) - Complete MLOps/LLMOps
