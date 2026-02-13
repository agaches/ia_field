# Phase 4 : Govern - Gouvernance IA

## Vue d'ensemble

Gouvernance complète : gestion risques, politiques, approbations, AI CoE.

## 1. Évaluer risques (NIST AI RMF)

[NIST AI Risk Management Framework](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)

### Risques principaux

| Risque | Impact | Mitigation |
|--------|--------|------------|
| **Biais et discrimination** | Élevé (légal, réputation) | Tests de biais, datasets diversifiés |
| **Hallucinations (GenAI)** | Moyen (crédibilité) | RAG, human-in-the-loop, validation |
| **Data poisoning** | Élevé (intégrité) | Validation données, provenance |
| **Privacy leakage** | Élevé (GDPR) | DLP, anonymisation, audits |
| **Prompt injection** | Moyen (sécurité) | Filtrage inputs, guardrails |
| **Non-conformité** | Élevé (amendes) | Audits, documentation, politiques |
| **Drift** | Moyen (business value) | Monitoring continu, retraining |

**Évaluation** : Impact × Probabilité (1-5) → Score >15 = Critique

## 2. Politiques essentielles

**Utilisation acceptable IA** : Cas d'usage autorisés/interdits, restrictions données sensibles

**Gouvernance données** : Classification, rétention, GDPR/CCPA

**Approbation modèles** : Gates de validation (dev → staging → prod), critères performance, évaluation biais

## 3. AI Center of Excellence (AI CoE)

**Rôle** : Centraliser gouvernance IA, standards, best practices

**Composition** :
- AI Ethics Lead
- ML Engineers (senior)
- Legal/Compliance
- Security
- Business stakeholders

**Responsabilités** : Approbation modèles, audits, formation, veille réglementaire

## 4. Processus d'approbation

**3 portes** :
1. **Concept** → Validation cas d'usage, risques, données
2. **Développement** → Review modèle, tests biais, sécurité
3. **Production** → Validation finale, monitoring, DR

**Gates** : Go/No-Go décidé par AI CoE

## 5. Audits & Conformité

**Audits réguliers** (trimestriels) :
- Conformité politiques
- Tests biais/équité
- Sécurité (vulnérabilités, DLP)
- Performance modèles

**Conformité réglementaire** : EU AI Act, GDPR, CCPA, sectorielles (santé, finance)

## 6. Conformité Légale - Actions Concrètes

### EU AI Act (Effective August 2026)

**High-risk systems** (Art. 6): Chatbots client, systèmes crédit, recrutement, biométrie

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

## Checklist Govern

**Governance Framework**:
- [ ] Framework NIST AI RMF implémenté
- [ ] Politiques IA documentées et appliquées
- [ ] AI CoE établi
- [ ] Processus approbation 3 portes
- [ ] Audits réguliers (trimestriels)

**Legal Compliance**:
- [ ] EU AI Act: High-risk systems identified (if applicable)
- [ ] EU AI Act: Technical documentation (model cards) ready
- [ ] GDPR: PII anonymization automated
- [ ] GDPR: Data retention policies configured (<30 days)
- [ ] GDPR: Audit trail for model decisions operational
- [ ] DLP tools deployed (AWS Macie / GCP DLP / Azure Purview)
- [ ] Sector-specific compliance validated (HIPAA, PCI-DSS, etc.)

## Prochaine étape

→ [Phase 5 : Secure](05-secure.md) - Sécurité IA production
