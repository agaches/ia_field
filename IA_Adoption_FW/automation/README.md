# Framework IA Automatisation

> IA en production - Applications et APIs métier

## Pour qui ?

Ce framework s'adresse aux **organisations, architectes et SRE** qui souhaitent :
- Déployer des applications IA en production
- Exposer des APIs IA à des clients ou utilisateurs
- Automatiser des processus métier critiques avec l'IA

**Exemples d'usage** :
- API IA exposée publiquement
- Chatbot client en production
- Workflow automatisé critique métier
- Système ML de prédiction ou recommandation

## Prérequis

Ce framework suppose que votre organisation a :
- ✅ **Maturité individuelle** : Membres d'équipe compétents en IA (voir [Framework Employee](../employee/README.md))
- ✅ **Maturité équipe** : Processus delivery avec intégration IA (voir [Framework Delivery](../delivery/README.md))
- ✅ **Niveaux 3-4** : RAG, ML avancé, MLOps, orchestration

**Pas encore prêt ?** Commencez par [IA pour l'Employé](../employee/README.md) puis [IA for Delivery](../delivery/README.md).

## Maturité requise

**Niveaux 3-4** : Compétences avancées à expert
- Prompt engineering et sélection modèles
- Infrastructure (VM/Kubernetes/Containers)
- MLOps/LLMOps

## Structure du framework

Le framework suit 6 phases :

1. **[Strategy](01-strategy.md)** - Identifier les cas d'usage IA métier
2. **[Plan](02-plan.md)** - Planifier l'architecture et infrastructure
3. **[Ready](03-ready.md)** - Établir la landing zone IA complète
4. **[Govern](04-govern.md)** - Gouvernance complète (FULL - NIST AI RMF, AI CoE)
5. **[Secure](05-secure.md)** - Sécurité production (FULL - Defense-in-depth)
6. **[Manage](06-manage.md)** - MLOps/LLMOps complet

## Caractéristiques clés

| Aspect | Niveau |
|--------|--------|
| **Gouvernance** | FULL - NIST AI RMF, AI CoE, 3 portes d'approbation, audits |
| **Sécurité** | COMPLET - Defense-in-depth (6 layers), DLP complet, SIEM, pentesting |
| **Opérations** | COMPLET - MLOps/LLMOps complet (CI/CD, model registry, drift detection, DR) |
| **Risque** | HIGH-CRITICAL |
| **Coût** | Dizaines à centaines de k€/mois |
| **Timeline** | Mois à trimestres |

## Quick Start Checklist

### 🏭 Pour démarrer rapidement

- [ ] Vérifier les prérequis (maturité Employee + Delivery)
- [ ] Lire [01-strategy.md](01-strategy.md) - Identifier les cas d'usage métier
- [ ] Évaluer les risques organisationnels (NIST AI RMF)
- [ ] Établir l'AI CoE et comité éthique
- [ ] Construire la landing zone IA complète
- [ ] Implémenter defense-in-depth (6 layers)
- [ ] Mettre en place MLOps/LLMOps complet

## Progression

Niveau le plus élevé d'adoption IA. Prérequis :
1. [Employee](../employee/README.md) - Compétences individuelles
2. [Delivery](../delivery/README.md) - Processus d'équipe
3. Expérience gestion IA en production
