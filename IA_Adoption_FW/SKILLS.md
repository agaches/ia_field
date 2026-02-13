# Grille de Compétences IA

> Référence unique pour évaluer et développer vos compétences IA

## 1. Vue d'ensemble des 4 niveaux

```
┌─────────────────────────────────────────────────────────────────────┐
│                        NIVEAUX DE MATURITÉ                           │
└─────────────────────────────────────────────────────────────────────┘

 Niveau 1                    Niveau 2                    Niveau 3                    Niveau 4
 BASIQUE                     INTERMÉDIAIRE               AVANCÉ                      EXPERT

 • SaaS uniquement           • SaaS + API usage          • RAG, ML custom            • Training grands modèles
 • Prompt basics             • Prompt engineering        • Fine-tuning               • Infrastructure complexe
 • Zero code                 • Light integration         • MLOps basics              • MLOps complet
 • Discovery                 • Data pipelines basics     • Production-ready          • Scale enterprise

 ├─────────────────────────────┤                         ├───────────────────────────────────────┤
 │     EMPLOYEE FRAMEWORK       │                         │        DELIVERY FRAMEWORK              │
 └─────────────────────────────┘                         └───────────────────────────────────────┘
                                                          ├───────────────────────────────────────────────┤
                                                          │        AUTOMATION FRAMEWORK                    │
                                                          └───────────────────────────────────────────────┘
```

**Mapping frameworks** :
- Niveau 1-2 → [Employee](employee/)
- Niveau 2-3 → [Delivery](delivery/)
- Niveau 3-4 → [Automation](automation/)

---

## 2. Définitions des 4 niveaux

| Niveau | Compétences | Technologies | Cas d'usage | Framework |
|--------|-------------|--------------|-------------|-----------|
| **1 - Basique** | Prompt basics, usage SaaS | ChatGPT, Claude, Copilot | Productivité personnelle | Employee |
| **2 - Intermédiaire** | Prompt engineering, APIs | SaaS + API (OpenAI, Anthropic) | Workflows automatisés, scripts | Employee → Delivery |
| **3 - Avancé** | RAG, ML custom, MLOps basics | PaaS (SageMaker, Vertex AI), Vector DBs | Applications IA, RAG production | Delivery → Automation |
| **4 - Expert** | Fine-tuning LLM, infrastructure GPU | K8s, Terraform, GPU clusters | Production critique, scale enterprise | Automation |

---

## 3. Les 6 axes de compétences

Chaque niveau se décompose en 6 axes :

1. **Prompt Engineering & GenAI**
   - Niveau 1-2 : Prompts simples → Few-shot, CoT
   - Niveau 3-4 : ReAct, Tree-of-Thought → Prompt optimization

2. **ML & Data Science**
   - Niveau 1-2 : Aucun → Basics (régression, classification)
   - Niveau 3-4 : ML custom, feature engineering → Fine-tuning LLM, RLHF

3. **Infrastructure & DevOps**
   - Niveau 1-2 : Aucun → Git, CI basics
   - Niveau 3-4 : Cloud (AWS/GCP/Azure), Docker → K8s, Terraform, GPU clusters

4. **MLOps & LLMOps**
   - Niveau 1-2 : Aucun → Versioning basics
   - Niveau 3-4 : CI/CD ML, monitoring → Production-grade (A/B testing, canary)

5. **Data Governance & Security**
   - Niveau 1-2 : RGPD awareness → PII, encryption basics
   - Niveau 3-4 : DLP, audits → Compliance complète (NIST AI RMF)

6. **Domain Expertise**
   - Niveau 1-2 : Connaissance métier basique → Solide
   - Niveau 3-4 : Expert métier → Stratégie IA domaine

---

## 4. Skills Matrix

### Barème ⭐

- **⭐** (Basique) : Awareness, usage guidé
- **⭐⭐** (Intermédiaire) : Usage autonome quotidien
- **⭐⭐⭐** (Avancé/Expert) : Architecture, design, mentoring

### Template

| Axe | Étoiles | Notes |
|-----|---------|-------|
| 1. Prompt Engineering & GenAI | ⭐⭐ | Maîtrise few-shot, CoT |
| 2. ML & Data Science | ⭐ | Basics uniquement |
| 3. Infrastructure & DevOps | ⭐⭐ | Git, CI/CD basics |
| 4. MLOps & LLMOps | ⭐ | Versioning uniquement |
| 5. Data Governance & Security | ⭐⭐ | RGPD, PII |
| 6. Domain Expertise | ⭐⭐⭐ | Expert métier |

**Niveau global** : Calculer la moyenne → Score 0.4-0.6 = Niveau 2

### Prérequis minimaux par niveau

**Niveau 2** :
- Prompt Engineering ≥ ⭐⭐

**Niveau 3** :
- Prompt Engineering ≥ ⭐⭐
- ML/Data ≥ ⭐⭐
- Infrastructure ≥ ⭐⭐

**Niveau 4** :
- Tous axes ≥ ⭐⭐
- Infrastructure ≥ ⭐⭐⭐
- MLOps ≥ ⭐⭐⭐

---

## 5. Auto-évaluation guidée

**5 étapes rapides (<10min)** :

1. **Remplir Skills Matrix** (section 4) - 5min
2. **Calculer score moyen** - 1min
3. **Vérifier prérequis minimaux** (section 4) - 2min
4. **Identifier niveau global** (section 2) - 1min
5. **Identifier gaps prioritaires** - 1min

**Résultat** : Vous connaissez votre niveau et savez quoi améliorer.

---

## 6. Validation passage de framework

### Employee → Delivery

**Critères individuels** :
- ✅ Niveau 2 validé (Skills Matrix ≥ ⭐⭐ sur 3+ axes)
- ✅ 3-6 mois usage quotidien outils SaaS
- ✅ Prompts complexes maîtrisés (few-shot, CoT)

**Critères équipe** :
- ✅ 50%+ équipe Niveau 2
- ✅ 1+ champion IA (prêt à devenir Tech Lead IA)
- ✅ Use case équipe identifié

**Red flags** :
- ❌ <30% équipe utilise IA quotidiennement
- ❌ Pas de champion IA dans l'équipe
- ❌ Management non aligné

---

### Delivery → Automation

**Critères individuels** :
- ✅ Niveau 3 validé (Skills Matrix ≥ ⭐⭐⭐ sur 2+ axes)
- ✅ 1+ projet IA en production (PoC → Prod)
- ✅ MLOps basics maîtrisés

**Critères équipe** :
- ✅ Tous membres ≥ Niveau 2
- ✅ 50%+ équipe Niveau 3
- ✅ 1+ membre Niveau 4 (Tech Lead)
- ✅ 6-12 mois expérience Delivery
- ✅ Infrastructure MLOps opérationnelle

**Critères organisationnels** :
- ✅ AI CoE ou équipe dédiée
- ✅ Sponsor executive (CTO/VP)
- ✅ Politique IA Responsable définie

**Red flags** :
- ❌ Aucun projet IA en production
- ❌ Équipe <5 personnes ou <50% Niveau 3
- ❌ Infrastructure MLOps inexistante
- ❌ Pas de sponsor executive

---

## Checklist de transition

**Avant de passer au framework suivant** :

### Employee → Delivery
- [ ] 50%+ équipe Niveau 2
- [ ] 3-6 mois expérience individuelle
- [ ] 1+ champion IA identifié
- [ ] Use case équipe identifié
- [ ] Management aligné

### Delivery → Automation
- [ ] Tous membres ≥ Niveau 2, 50%+ Niveau 3
- [ ] 1+ membre Niveau 4 (ou prêt à le devenir)
- [ ] 6-12 mois expérience Delivery
- [ ] 1+ projet IA en production
- [ ] Infrastructure MLOps opérationnelle
- [ ] AI CoE ou gouvernance formalisée
- [ ] Sponsor executive (CTO/VP)
- [ ] Politique IA Responsable définie

**En cas de doute** : Restez sur le framework actuel 3-6 mois. Mieux vaut consolider que précipiter.
