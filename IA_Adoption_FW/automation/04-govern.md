# Phase 4 : Govern - Gouvernance IA

## Vue d'ensemble

La gouvernance IA transforme les principes d'IA responsable en contrôles opérationnels mesurables. Elle assure la conformité réglementaire, la gestion des risques et la confiance des parties prenantes tout au long du cycle de vie IA.

## 1. Évaluer les risques organisationnels

### Framework NIST AI RMF

Le [NIST AI Risk Management Framework](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf) structure la gestion des risques IA en 4 fonctions : Govern, Map, Measure, Manage.

### Matrice des risques IA

| Catégorie de risque | Description | Impact potentiel | Probabilité | Stratégie de mitigation |
|---------------------|-------------|------------------|-------------|------------------------|
| **Biais et discrimination** | Décisions inéquitables basées sur attributs sensibles | Élevé (légal, réputation) | Moyen | Évaluation équité, tests de biais, datasets diversifiés |
| **Hallucinations (GenAI)** | Génération d'informations incorrectes ou inventées | Moyen (crédibilité, décisions) | Élevé | RAG, human-in-the-loop, validation outputs |
| **Data poisoning** | Manipulation malveillante des données d'entraînement | Élevé (intégrité modèle) | Faible | Validation données, provenance, monitoring |
| **Model theft** | Vol de modèles propriétaires ou sensibles | Moyen (IP, concurrence) | Moyen | Contrôles d'accès, watermarking, chiffrement |
| **Privacy leakage** | Fuite de données sensibles via outputs/modèles | Élevé (GDPR, confiance) | Moyen | DLP, anonymisation, audits réguliers |
| **Prompt injection** | Manipulation du comportement via prompts malveillants | Moyen (sécurité, compliance) | Élevé | Filtrage inputs, sandboxing, guardrails |
| **Non-conformité** | Violation réglementations (GDPR, EU AI Act, etc.) | Élevé (amendes, légal) | Moyen | Audits conformité, documentation, politiques |
| **Drift** | Dégradation performance au fil du temps | Moyen (business value) | Élevé | Monitoring continu, retraining, alertes |

### Grille d'évaluation de maturité gouvernance

| Niveau | Politiques & Processus | Outils & Automation | Culture & Formation | Conformité & Audit |
|--------|----------------------|---------------------|-------------------|-------------------|
| **Niveau 1** | Politiques informelles, ad-hoc | Outils manuels, spreadsheets | Sensibilisation basique | Audits réactifs |
| **Niveau 2** | Politiques documentées, processus définis | Outils spécialisés, semi-automatisés | Formation régulière, guidelines | Audits périodiques |
| **Niveau 3** | Politiques appliquées, workflow approuvé | Automation complète, intégration CI/CD | Culture responsabilité, experts dédiés | Monitoring continu, métriques |
| **Niveau 4** | Gouvernance prédictive, amélioration continue | IA pour gouvernance IA, self-service | Innovation responsable, leadership | Conformité proactive, certifications |

### Template d'évaluation des risques

**Pour chaque système IA** :
1. **Identifier les risques** : Utiliser la matrice ci-dessus + risques spécifiques au cas d'usage
2. **Évaluer impact × probabilité** : Score 1-5 pour chaque dimension
3. **Prioriser** : Score combiné > 15 = Risque critique
4. **Définir mitigations** : Actions concrètes pour réduire risque
5. **Assigner responsabilité** : Personne/équipe accountable

## 2. Documenter les politiques de gouvernance

### Structure de politique IA (template condensé)

```markdown
# Politique [Nom]
**Version** : X.Y | **Date** : YYYY-MM-DD | **Owner** : [Rôle]

## Objectif
[1-2 phrases : Pourquoi cette politique existe]

## Périmètre
- **Applicable à** : [Systèmes, équipes, départements]
- **Exclusions** : [Si applicable]

## Principes
1. [Principe clé 1]
2. [Principe clé 2]
3. [Principe clé 3]

## Règles
| Règle | Obligatoire | Contrôle |
|-------|-------------|----------|
| [Règle 1] | Oui/Non | [Comment vérifier] |
| [Règle 2] | Oui/Non | [Comment vérifier] |

## Responsabilités (RACI)
| Rôle | Responsabilité |
|------|---------------|
| Data Scientist | Responsible |
| ML Engineer | Accountable |
| AI Ethics | Consulted |
| Legal | Informed |

## Non-conformité
[Conséquences en cas de violation]

## Révision
Révision annuelle ou lors de changements réglementaires majeurs.
```

### Politiques essentielles

1. **Politique d'utilisation acceptable IA**
   - Cas d'usage autorisés/interdits
   - Restrictions sur données sensibles
   - Protocoles human-in-the-loop

2. **Politique de gouvernance des données**
   - Classification et traitement des données
   - Rétention et suppression
   - Conformité GDPR/CCPA

3. **Politique d'approbation des modèles**
   - Gates de validation (development → staging → production)
   - Critères de performance minimaux
   - Évaluation biais et équité

4. **Politique de conformité réglementaire**
   - EU AI Act (systèmes à haut risque)
   - Réglementations sectorielles (santé, finance)
   - Documentation et auditabilité

### Centre d'excellence IA (AI CoE)

**Structure organisationnelle** :
```
AI Center of Excellence
├── AI Governance Board (décisions stratégiques)
│   ├── CTO/CIO
│   ├── Legal
│   ├── Privacy Officer
│   └── Business Leaders
├── AI Ethics Committee (évaluation éthique)
│   ├── AI Ethics Specialist
│   ├── Data Scientists
│   └── Domain Experts
└── AI Operations Team (implémentation)
    ├── ML Engineers
    ├── MLOps Engineers
    └── Data Engineers
```

**Responsabilités clés** :
- **Governance Board** : Approuver politiques, budget, stratégie
- **Ethics Committee** : Évaluer risques éthiques, approuver déploiements
- **Operations Team** : Implémenter contrôles, monitoring, incidents

## 3. Appliquer les politiques

### Mécanismes d'application

| Mécanisme | Description | Outils (voir GLOSSARY.md) |
|-----------|-------------|---------------------------|
| **Contrôles d'accès** | IAM basé sur rôles (RBAC) | IAM services cloud |
| **Politiques cloud** | Restrictions au niveau infrastructure | AWS Organizations/GCP Org Policy/Azure Policy |
| **Content filtering** | Filtrage inputs/outputs GenAI | Services de filtrage natifs cloud |
| **DLP** | Détection données sensibles | Services DLP cloud (voir GLOSSARY) |
| **Model registry** | Versioning et approbation modèles | Model registry services |
| **Audit logging** | Traçabilité complète des actions | Logging services cloud |

### Workflow d'approbation des modèles

```
┌─────────────────────┐
│  Development        │
│  - Build model      │
│  - Evaluate locally │
└─────────────────────┘
          ↓
    ┌─────────┐
    │ Gate 1  │ → Validation technique (accuracy, latency, coût)
    └─────────┘
          ↓
┌─────────────────────┐
│  Staging            │
│  - Deploy test env  │
│  - A/B testing      │
└─────────────────────┘
          ↓
    ┌─────────┐
    │ Gate 2  │ → Validation éthique (biais, équité, conformité)
    └─────────┘
          ↓
┌─────────────────────┐
│  Production         │
│  - Deploy prod      │
│  - Monitor          │
└─────────────────────┘
          ↓
    ┌─────────┐
    │ Gate 3  │ → Revue post-déploiement (30/60/90 jours)
    └─────────┘
```

**Critères de validation par gate** :

**Gate 1 - Validation technique** :
- [ ] Métriques performance > seuils définis
- [ ] Tests unitaires et intégration passés
- [ ] Coût estimé < budget approuvé
- [ ] Documentation technique complète

**Gate 2 - Validation éthique** :
- [ ] Évaluation biais complétée (score équité > seuil)
- [ ] Analyse d'impact éthique validée
- [ ] Conformité réglementaire vérifiée
- [ ] Approbation AI Ethics Committee

**Gate 3 - Revue post-déploiement** :
- [ ] Métriques business atteintes
- [ ] Pas d'incidents majeurs
- [ ] Feedback utilisateurs positif
- [ ] Drift modèle < seuil acceptable

### Exemple de politiques cloud-native

**AWS Organizations - SCP (Service Control Policy)** :
- Restreindre régions autorisées pour workloads IA
- Forcer chiffrement pour tous les datasets
- Exiger tagging pour ressources IA

**GCP Organization Policy** :
- Restreindre APIs IA autorisées
- Forcer audit logging
- Limiter compute quotas par projet

**Azure Policy** :
- Forcer Azure Policy pour ressources AI
- Exiger filtres de contenu sur Azure OpenAI
- Restreindre fine-tuning aux équipes approuvées

## 4. Surveiller les risques

### Métriques de conformité et gouvernance

| Métrique | Objectif | Fréquence | Outil (voir GLOSSARY) |
|----------|----------|-----------|----------------------|
| **% modèles avec évaluation biais** | 100% | Mensuel | Model registry + rapports |
| **Temps moyen approbation modèle** | < 5 jours | Hebdo | Workflow tracking |
| **% incidents sécurité IA résolus < 24h** | > 95% | Quotidien | SIEM |
| **Score conformité GDPR** | 100% | Trimestriel | Compliance tools |
| **% datasets avec data lineage** | 100% | Mensuel | Data catalog |
| **Nombre violations politiques IA** | 0 | Continu | Policy enforcement tools |
| **% modèles en production monitorés** | 100% | Hebdo | Monitoring dashboards |
| **Drift détecté et adressé < 7 jours** | > 90% | Hebdo | Drift detection tools |

### Audits périodiques

**Audits internes (trimestriels)** :
- Revue conformité politiques IA
- Vérification traçabilité (data lineage, model provenance)
- Évaluation efficacité contrôles
- Identification gaps

**Audits externes (annuels)** :
- Certification ISO/SOC 2 si applicable
- Audit réglementaire (GDPR, secteur-specific)
- Pentest sécurité IA (voir [Phase Secure](05-secure.md))
- Validation par tiers indépendant

### Gestion des incidents IA

**Workflow de gestion d'incident** :
```
Détection → Triage → Investigation → Remédiation → Post-mortem
     ↓         ↓          ↓              ↓             ↓
  Alertes  Priorité   Root cause   Fix+Deploy    Learnings
                     (P0/P1/P2)                  Documentation
```

**Catégories d'incidents IA** :
- **P0 (Critique)** : Violation GDPR, biais discriminatoire en production, data breach
- **P1 (Majeur)** : Drift significatif, hallucinations fréquentes, violation politique
- **P2 (Mineur)** : Dégradation performance, non-conformité mineure

**SLA de résolution** :
- P0 : < 4 heures
- P1 : < 24 heures
- P2 : < 7 jours

### Tableau de bord gouvernance (KPIs clés)

**Indicateurs à tracker en temps réel** :
1. Nombre de modèles en production vs approuvés
2. Taux de conformité aux politiques (%)
3. Incidents IA ouverts par criticité
4. Métriques de drift par modèle
5. Coûts IA vs budget
6. Score de maturité gouvernance (1-4)

## Checklist Govern

### 🚀 Startup
- [ ] Définir politiques IA basiques (utilisation acceptable, données sensibles)
- [ ] Établir processus approbation modèles (gates simplifiés)
- [ ] Configurer audit logging pour ressources IA
- [ ] Désigner responsable gouvernance IA

### 🏢 Enterprise
- [ ] Créer AI Center of Excellence (Governance Board + Ethics Committee)
- [ ] Documenter politiques IA complètes (utilisation, données, conformité, approbation)
- [ ] Implémenter workflow d'approbation multi-gates
- [ ] Déployer outils d'application automatique (DLP, content filtering, policies)
- [ ] Établir métriques de conformité et dashboards
- [ ] Planifier audits périodiques (internes trimestriels, externes annuels)
- [ ] Mettre en place gestion incidents IA avec SLAs

## Prochaine étape

→ [Phase 5 : Secure](05-secure.md) - Sécuriser l'IA
