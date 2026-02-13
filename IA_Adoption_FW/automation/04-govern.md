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

## Checklist Govern

- [ ] Framework NIST AI RMF implémenté
- [ ] Politiques IA documentées et appliquées
- [ ] AI CoE établi
- [ ] Processus approbation 3 portes
- [ ] Audits réguliers (trimestriels)
- [ ] Conformité réglementaire vérifiée

## Prochaine étape

→ [Phase 5 : Secure](05-secure.md) - Sécurité IA production
