# Cloud-Agnostic AI Adoption Framework

> Framework léger d'adoption de l'IA, agnostique des fournisseurs cloud, basé sur les meilleures pratiques du Cloud Adoption Framework.

## Vue d'ensemble

Ce framework fournit un processus structuré pour adopter l'IA dans votre organisation, aagnostique des outils et technologies.

Le framework est organisé en **3 catégories** suivant le modèle "Person (Employee) → Equipe (Delivery) → Product (Automation)" :
- **[Employee](employee/)** - Adoption individuelle (compétences personnelles)
- **[Delivery](delivery/)** - Intégration équipe (processus collectifs)
- **[Automation](automation/)** - Production métier (applications IA)

Voir [00-strategy-global.md](00-strategy-global.md) pour comprendre le modèle complet.

---

## Les 3 catégories d'adoption IA

### Vue d'ensemble comparative

| Catégorie | Pour qui ? | Usage | Risque | Maturité / Prérequis | Framework |
|-----------|-----------|-------|--------|----------------------|-----------|
| **Employee** | Individus | Productivité personnelle | Low-Medium | Niveaux 1-2 | [employee/](employee/) |
| **Delivery** | Équipes | Processus collectifs | Medium | Niveaux 2-3 + Maîtrise Employee | [delivery/](delivery/) |
| **Automation** | Organisations | Production métier | High-Critical | Niveaux 3-4 + Expérience Delivery | [automation/](automation/) |

### 1. Employee - Adoption individuelle

**Pour qui** : Individus (tech ou non-tech) souhaitant améliorer leur productivité personnelle

**Exemples** :
- Développeur utilisant GitHub Copilot
- Employé utilisant ChatGPT pour rédaction
- Professionnel utilisant M365 Copilot

**Maturité requise** : Niveaux 1-2 (basique à intermédiaire)

**Framework** : [employee/README.md](employee/README.md)

---

### 2. Delivery - Intégration équipe

**Pour qui** : Équipes techniques et leads souhaitant intégrer l'IA dans les processus de livraison

**Exemples** :
- Code review automatisée par IA
- Génération collective de documentation
- Testing et refactoring assistés par IA

**Maturité requise** : Niveaux 2-3 (intermédiaire à avancé)

**Prérequis** : Membres d'équipe maîtrisent l'usage individuel (Employee Niveaux 1-2)

**Framework** : [delivery/README.md](delivery/README.md)

---

### 3. Automation - Production métier

**Pour qui** : Organisations, Equipes produits souhaitant déployer des applications IA en production

**Exemples** :
- API IA exposée publiquement
- Chatbot client en production
- Workflow automatisé critique métier

**Maturité requise** : Niveaux 3-4 (avancé à expert)

**Prérequis** : Maturité individuelle (Employee) + Expérience équipe (Delivery)

**Framework** : [automation/README.md](automation/README.md)

---

## Guide rapide "Quel framework utiliser ?"

### Questions pour vous orienter

**Q : "Je veux essayer GitHub Copilot pour coder plus vite"**
→ **Employee Framework** - Usage personnel, productivité individuelle

**Q : "Notre équipe veut automatiser les code reviews"**
→ **Delivery Framework** - Processus d'équipe, intégration collective

**Q : "On veut déployer un chatbot client en production"**
→ **Automation Framework** - Production métier, risque élevé

**Q : "Mon équipe n'a jamais utilisé l'IA"**
→ **Commencez par Employee** - Développez d'abord les compétences individuelles

**Q : "On a des outils individuels, on veut passer à l'équipe"**
→ **Delivery Framework** - Prérequis : Niveaux 1-2 individuels validés

**Q : "On veut scaler notre PoC IA en production"**
→ **Automation Framework** - Prérequis : Expérience Delivery + Compétences

Voir [00-strategy-global.md](00-strategy-global.md) pour plus de questions/réponses.

---

## Skills and Training

### Assess Your Level

Consult **[SKILLS.md](SKILLS.md)** for:
- Understand the 4 maturity levels (visual diagram)
- Self-assess your skills (Skills Matrix - 6 axes)
- Identify priority gaps
- Framework transition criteria (Employee → Delivery → Automation)
- Framework mapping

**Quick check**: What level are you?
- Level 1-2 → [Employee](employee/)
- Level 2-3 → [Delivery](delivery/)
- Level 3-4 → [Automation](automation/)

### Training Paths

Consult **[TRAINING.md](TRAINING.md)** for:
- Paths by level (1→2, 2→3, 3→4)
- Concepts + Tools structure for each path
- Tool training format (discovery with live scenarios)
- Project-based validation
- Recommended certifications
- Training governance (LIGHT/MEDIUM/FULL)

---

## Structure des frameworks

Chaque framework (Employee, Delivery, Automation) suit 6 phases communes :

```
┌─────────────┐
│  STRATEGY   │ → Définir votre vision IA
└─────────────┘
      ↓
┌─────────────┐
│    PLAN     │ → Planifier l'adoption
└─────────────┘
      ↓
┌─────────────┐
│    READY    │ → Préparer l'environnement
└─────────────┘
      ↓
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   GOVERN    │ ←→ │   SECURE    │ ←→ │   MANAGE    │
└─────────────┘    └─────────────┘    └─────────────┘
  Gouvernance         Sécurité        Opérations
```

### Les 6 phases (adaptées à chaque framework)

**1. Strategy** - Définir votre stratégie IA
- Employee : Découvrir les outils pour productivité personnelle
- Delivery : Explorer les patterns d'intégration équipe
- Automation : Identifier les cas d'usage métier avec ROI

**2. Plan** - Planifier l'adoption
- Employee : Évaluer et développer compétences personnelles
- Delivery : Planifier l'expérimentation collective (sprints)
- Automation : Planifier l'architecture et infrastructure

**3. Ready** - Préparer l'environnement
- Employee : Configurer environnement personnel
- Delivery : Préparer infrastructure d'équipe
- Automation : Établir landing zone IA complète

**4. Govern** - Gouverner l'IA
- Employee : LIGHT - Politique acceptable use (1-2 pages)
- Delivery : MEDIUM - Politiques équipe (5-10 pages)
- Automation : FULL - NIST AI RMF, AI CoE, audits

**5. Secure** - Sécuriser l'IA
- Employee : Awareness - Bonnes pratiques individuelles
- Delivery : Pragmatique - OWASP basics, DLP
- Automation : Complet - Defense-in-depth (6 layers)

**6. Manage** - Gérer l'IA
- Employee : Minimal - Gestion subscriptions SaaS
- Delivery : Basique - MLOps basics
- Automation : Complet - MLOps/LLMOps full

## Checklists par framework

Les checklists détaillées sont maintenant dans chaque framework :

### Employee Framework
Voir [employee/README.md](employee/README.md) pour la checklist complète
- Focus : Compétences individuelles, productivité personnelle
- Timeline : Heures → Jours

### Delivery Framework
Voir [delivery/README.md](delivery/README.md) pour la checklist complète
- Focus : Processus d'équipe, intégration collective
- Timeline : Semaines → Mois

### Automation Framework
Voir [automation/README.md](automation/README.md) pour la checklist complète
- Focus : Production métier, applications IA
- Timeline : Mois → Trimestres

## Principes clés

### Agnosticisme cloud
Ce framework est conçu pour être applicable avec n'importe quel fournisseur cloud (AWS, GCP, Azure, ou hybride/multi-cloud).

Voir [GLOSSARY.md](GLOSSARY.md) pour les équivalences des services cloud majeurs.

### IA Responsable
Six principes fondamentaux :
1. **Équité** : Traiter tous les utilisateurs de manière équitable
2. **Fiabilité et sécurité** : Fonctionnement sûr et fiable
3. **Confidentialité et sécurité** : Respect de la vie privée
4. **Inclusivité** : Accessible à tous
5. **Transparence** : Compréhensible et explicable
6. **Responsabilité** : Responsabilité claire

## Utilisation

### Pour démarrer

1. **Lire la stratégie globale** : [00-strategy-global.md](00-strategy-global.md) pour comprendre le modèle "Person → Project → Product"
2. **Choisir votre framework** selon votre situation :
   - Individu découvrant l'IA ? → [Employee Framework](employee/)
   - Équipe avec compétences IA ? → [Delivery Framework](delivery/)
   - Organisation déployant en production ? → [Automation Framework](automation/)
3. **Suivre les 6 phases** du framework choisi dans l'ordre
4. **Adapter** le framework à vos besoins spécifiques

### Progression entre frameworks

```
Employee (Niveaux 1-2)
    ↓
  Maîtrise individuelle
    ↓
Delivery (Niveaux 2-3)
    ↓
  Expérience équipe
    ↓
Automation (Niveaux 3-4)
```

**Important** : Ne sautez pas les étapes. Les prérequis de chaque framework existent pour garantir le succès.

## Ressources

- [NIST AI Risk Management Framework](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf)
- [MITRE ATLAS](https://atlas.mitre.org/)
- [OWASP Generative AI](https://genai.owasp.org/)

## Licence

Ce framework est inspiré du Microsoft Cloud Adoption Framework mais adapté pour être agnostique cloud et condensé pour une utilisation pratique.
