# Phase 5 : Secure - Sécurité IA

## Vue d'ensemble

Defense-in-depth (6 layers) : découverte risques, protection, détection, réponse.

## 1. Risques sécurité IA

### OWASP LLM Top 10

[OWASP Generative AI](https://genai.owasp.org/)

| Risque | Impact | Mitigation |
|--------|--------|------------|
| **LLM01: Prompt Injection** | Élevé | Validation inputs, sandboxing, guardrails |
| **LLM02: Insecure Output** | Élevé | Validation outputs, sanitization |
| **LLM03: Data Poisoning** | Moyen | Validation sources, data provenance |
| **LLM04: Model DoS** | Moyen | Rate limiting, quotas |
| **LLM05: Supply Chain** | Élevé | Vérification provenance, scanning |
| **LLM06: Info Disclosure** | Élevé | DLP, anonymisation, filtering |
| **LLM07: Insecure Plugins** | Moyen | Validation plugins, sandboxing |
| **LLM08: Excessive Agency** | Élevé | Least privilege, human-in-the-loop |
| **LLM09: Overreliance** | Moyen | Human validation, fact-checking |
| **LLM10: Model Theft** | Moyen | Contrôles d'accès, watermarking |

### MITRE ATLAS

[MITRE ATLAS](https://atlas.mitre.org/) - Tactiques d'attaque IA

**Phases** : Reconnaissance → Resource Dev → Initial Access → Execution → Persistence → Exfiltration

## 2. Defense-in-depth (6 layers)

### Layer 1 : Identité et Accès
- IAM strict (least privilege)
- MFA obligatoire
- RBAC pour modèles/données

### Layer 2 : Réseau
- Segmentation (VPC, subnets)
- DDoS protection
- Firewall + IDS/IPS

### Layer 3 : Données
- Chiffrement (at rest + in transit)
- DLP (scan données sensibles)
- Anonymisation/pseudonymisation

### Layer 4 : Application
- Input/output validation
- Guardrails (filtrage prompts/outputs)
- Rate limiting
- Monitoring API abuse

### Layer 5 : Modèles
- Model scanning (vulnérabilités)
- Watermarking (traçabilité)
- Adversarial testing
- Provenance verification

### Layer 6 : Monitoring & Response
- SIEM (logs centralisés)
- Alertes anomalies
- Incident response plan
- Pentesting régulier

## 3. DLP Complet

**Prévention** :
- Classification données automatique
- Blocage upload données sensibles
- Masking PII dans prompts/outputs

**Détection** :
- Scan conversations/logs
- Alertes patterns suspects
- Analyse comportementale

**Outils** : AWS Macie, GCP DLP API, Azure Purview, solutions tierces

## 4. Pentesting IA

**Scope** :
- Prompt injection attacks
- Model extraction attempts
- Data exfiltration vectors
- Supply chain vulnerabilities

**Fréquence** : Annuel (minimum) + après changements majeurs

## Checklist Secure

- [ ] Defense-in-depth 6 layers implémenté
- [ ] OWASP LLM Top 10 mitigations
- [ ] DLP complet (prévention + détection)
- [ ] SIEM + monitoring anomalies
- [ ] Incident response plan
- [ ] Pentesting annuel

## Prochaine étape

→ [Phase 6 : Manage](06-manage.md) - MLOps/LLMOps complet
