# Phase 5: Secure - AI Security

## Discover AI security risks

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

## Protect AI resources and data

### Secure AI resources

**Identity and Access**:
- Strict IAM (least privilege)
- Mandatory MFA
- RBAC for models/data

**Network**:
- Segmentation (VPC, subnets)
- DDoS protection
- Firewall + IDS/IPS

**Models**:
- Model scanning (vulnerabilities)
- Watermarking (traceability)
- Adversarial testing
- Provenance verification

### Secure AI data

**Data protection**:
- Encryption (at rest + in transit)
- DLP (sensitive data scanning)
- Anonymization/pseudonymization

**Application security**:
- Input/output validation
- Guardrails (prompt/output filtering)
- Rate limiting
- API abuse monitoring

**Data Loss Prevention (DLP)**:

**Prevention**:
- Automatic data classification
- Block sensitive data uploads
- PII masking in prompts/outputs

**Detection**:
- Scan conversations/logs
- Suspicious pattern alerts
- Behavioral analysis

> See [GLOSSARY.md](../GLOSSARY.md) for DLP tool options (cloud, on-premise, open-source)

## Detect AI security threats

### Monitoring and response

**SIEM (Security Information and Event Management)**:
- Centralized logs
- Anomaly alerts
- Correlation rules for AI-specific threats

**Incident response**:
- Defined procedures for AI security incidents
- Escalation paths
- Containment and recovery plans

### Penetration testing

**Scope**:
- Prompt injection attacks
- Model extraction attempts
- Data exfiltration vectors
- Supply chain vulnerabilities

**Frequency**: Annual (minimum) + after major changes

## Next Step

→ [Phase 6: Manage](06-manage.md) - Complete MLOps/LLMOps
