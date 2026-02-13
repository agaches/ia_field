# Note Technique - Déploiement IA chez Etech

**Auteur :** Architecture Cloud & IA  
**Date :** Février 2026  
**Contexte :** 50 personnes, outils IA disparates (Copilot, Claude, Cursor, Gemini), adoption organique non pilotée

---

## 1. OBJECTIF

Passer de **l'expérimentation individuelle** à **l'IA intégrée dans les projets** (delivery) pour accélérer dev, test, ops et réduire les frictions.

**Périmètre prioritaire :** IA for delivery (pas capitalisation/marketplace dans un premier temps)

---

## 2. QUESTIONS STRUCTURANTES À TRANCHER

### 2.1 Stratégie et gouvernance

**Décisions immédiates :**
- Accepter la diversité d'outils ou standardiser ? → **Acceptée selon document**
- Objectif : productivité interne, offre client ou les deux ? → **Les deux selon document**
- Qui décide des outils autorisés ? (individu, équipe, direction)
- Budget IA : existe-t-il ou à créer ?
- Qui pilote le programme ? (besoin d'un "AI Lead" ?)

**Governance light nécessaire :**
- Processus de validation des outils (sécurité, coût, conformité)
- Règles d'usage des données clients avec LLM tiers
- Traçabilité des utilisations IA (audit)

### 2.2 Sécurité et données

**Risques majeurs identifiés :**
- Fuite de données clients via outils SaaS
- Secrets (tokens, passwords) dans les prompts
- Absence de classification des données

**À définir immédiatement :**
- Quelles données peuvent aller vers LLM tiers ? (matrice de classification)
- Isolation données clients : instances dédiées par projet/client ?
- DLP (Data Loss Prevention) nécessaire ?
- Politique de rétention prompts/conversations
- Conformité RGPD + AI Act : évaluation d'impact IA (AIIA) requise ?

### 2.3 Cas d'usage et priorisation

**Par profil technique :**
| Profil | Cas d'usage prioritaires | Outils actuels |
|--------|--------------------------|----------------|
| Dev | Code completion, review, refactoring, debug | Copilot, Cursor, Claude Code |
| DevOps | Scripts infra, troubleshooting, doc | Claude, Gemini |
| Test | Génération tests, analyse bugs, couverture | Copilot, Claude |
| Archi | Documentation, diagrammes, veille | Claude, Gemini |
| Ops | Analyse logs, incidents, automatisation | Claude, Gemini |

**Processus chronophages identifiés :**
- Reporting projet (automatisation via IA ?)
- Documentation technique (génération/maintenance)
- Onboarding nouveaux arrivants
- Revue de code
- Analyse post-mortem incidents

**À décider :**
- Quick wins vs transformations profondes ?
- Quels irritants prioritaires à résoudre ?
- Demandes clients IA : lesquelles ? quelle urgence ?

### 2.4 Compétences et formation

**État actuel à mesurer :**
- Niveau de maturité IA par profil (grille d'évaluation à définir)
- Champions IA informels existants ?
- Connaissances : prompt engineering, RAG, fine-tuning ?

**Stratégie de montée en compétences :**
- Former tout le monde ou créer cellule spécialisée ?
- Format : interne, externe, auto-apprentissage ?
- Qui devient référent IA par domaine ?
- Besoin de recrutement compétences IA ?

### 2.5 Coûts

**Situation actuelle :**
- Coût total actuel inconnu (abonnements dispersés)
- Risque de coûts imprévisibles (APIs à la consommation)

**À clarifier :**
- Centraliser les achats ou autonomie ?
- Budget expérimentation vs production
- Stratégie pricing : par utilisateur, consommation, mixte ?
- Refacturation/valorisation IA aux clients possible ?
- Optimisation : cache, modèles moins chers, open source ?

### 2.6 Interopérabilité client

**Contrainte forte : agnosticisme cloud**

**À définir :**
- Standards d'interopérabilité : OpenAI API, MCP, autres ?
- Couche d'abstraction multi-provider nécessaire ?
- Gestion spécificités clients (Azure OpenAI, AWS Bedrock, GCP Vertex)
- Documentation patterns d'intégration

---

## 3. DÉMARCHE DE DÉPLOIEMENT

### Phase 0 : Diagnostic (Semaines 1-2)

**Objectif :** Comprendre l'existant avant de structurer

1. **Cartographie actuelle**
   - Qui utilise quoi ? (inventaire outils + usages)
   - Coûts actuels (licences, APIs)
   - Champions IA informels
   - Irritants/besoins remontés

2. **Évaluation maturité**
   - Grille de maturité IA par profil (niveau 1-5)
   - Compétences techniques IA présentes
   - Cas d'usage déjà fonctionnels

3. **Cadrage sécurité/conformité**
   - Classification données existante ?
   - Contraintes clients contractuelles
   - Gap analysis RGPD/AI Act

**Livrables :** État des lieux + matrice décisions à prendre

### Phase 1 : Structuration (Semaines 3-6)

**Objectif :** Poser les bases avant généralisation

1. **Gouvernance light**
   - Nommer AI Lead/Champion
   - Définir règles d'usage (données, sécurité)
   - Process validation outils
   - Budget alloué

2. **Sécurité**
   - Matrice classification données
   - Règles isolation projets/clients
   - DLP si nécessaire
   - Audit trail

3. **Projet pilote**
   - Sélection 1 projet test (critères : équipe mature, irritants identifiés, durée >3 mois)
   - Cas d'usage ciblés (2-3 max)
   - Intégration IA dans workflow projet
   - Mesure avant/après

4. **Formation ciblée**
   - Champions : formation avancée
   - Équipe pilote : prompt engineering, best practices
   - Format : ateliers pratiques (pas théorique)

**Livrables :** Règles d'usage, projet pilote lancé, 1er groupe formé

### Phase 2 : Déploiement progressif (Semaines 7-16)

**Objectif :** Étendre à davantage de projets

1. **REX projet pilote**
   - Métriques : temps gagné, qualité, adoption, coûts
   - Ajustements règles/outils
   - Documentation patterns qui marchent

2. **Extension**
   - Sélection 3-5 projets additionnels
   - Critères : maturité équipe + irritants identifiés
   - Accompagnement adapté au niveau

3. **Standardisation progressive**
   - Consolidation outils (si pertinent)
   - Best practices documentées
   - Support interne organisé

4. **Formation générale**
   - Déploiement formation tous profils
   - Formats adaptés (dev ≠ ops ≠ archi)

**Livrables :** REX structuré, 5+ projets IA-enabled, formations déployées

### Phase 3 : Industrialisation (Semaines 17-26)

**Objectif :** Généralisation et capitalisation

1. **IA par défaut**
   - Tous nouveaux projets intègrent IA
   - Outils IA dans onboarding
   - Autonomie équipes

2. **Capitalisation** (maintenant pertinent)
   - Plateforme partage (style Neo2) si ROI démontré
   - Agents/workflows réutilisables
   - Communauté de pratique

3. **Amélioration continue**
   - KPIs consolidés
   - Ajustements stratégie
   - Veille techno

---

## 4. CRITÈRES DE SÉLECTION PROJETS PILOTES

**Critères obligatoires :**
- ✅ Équipe avec maturité technique suffisante
- ✅ Irritants/douleurs identifiés et mesurables
- ✅ Durée projet > 3 mois (temps d'apprentissage)
- ✅ Sponsor projet favorable à l'expérimentation
- ✅ Données projet compatibles sécurité (pas de blocage client)

**Critères bonus :**
- Champions IA informels dans l'équipe
- Stack technique moderne (APIs, cloud-native)
- Possibilité de mesurer ROI facilement

**Anti-patterns :**
- ❌ Projet en crise (pas le moment d'expérimenter)
- ❌ Équipe résistante au changement
- ❌ Contraintes sécurité bloquantes
- ❌ Projet trop court (< 2 mois)

---

## 5. MÉTRIQUES DE SUCCÈS

**Phase pilote (qualitatif d'abord) :**
- Adoption : % équipe utilisant IA quotidiennement
- Satisfaction : feedback équipe (1-5)
- Irritants résolus : nombre et impact

**Phase déploiement (quantitatif) :**
- Temps gagné : mesure avant/après sur tâches types
- Qualité : réduction bugs, couverture tests
- Coûts : investissement vs gains productivité

**Phase industrialisation (stratégique) :**
- ROI global
- Offres clients IA déployées
- Maturité IA moyenne équipes

---

## 6. RISQUES ET MITIGATIONS

| Risque | Impact | Mitigation |
|--------|--------|------------|
| Résistance équipes | Élevé | Co-construction, champions, quick wins |
| Fuite données | Critique | Classification + règles strictes + audit |
| Coûts explosifs | Moyen | Monitoring + quotas + optimisation |
| Échec pilote | Élevé | Sélection rigoureuse + accompagnement |
| Lock-in vendor | Moyen | Abstraction multi-provider |

---

## 7. DÉCISIONS À PRENDRE (PROCHAINES 2 SEMAINES)

**Immédiat :**
1. Nommer AI Lead/sponsor programme
2. Valider budget phase 0+1 (diagnostic + pilote)
3. Lancer diagnostic (cartographie + maturité)

**Court terme (J+15) :**
1. Définir règles sécurité/données
2. Sélectionner projet pilote
3. Identifier champions à former

**Moyen terme (J+30) :**
1. Démarrer projet pilote
2. Déployer formation champions
3. Définir métriques de suivi

---

## 8. ANTI-PATTERNS À ÉVITER

- ❌ Vouloir tout standardiser immédiatement (accepter diversité initiale)
- ❌ Déployer sans règles sécurité (risque majeur)
- ❌ Généraliser sans pilote (apprendre d'abord)
- ❌ Former sans cas d'usage concrets (théorie inutile)
- ❌ Négliger les coûts (surveiller dès le début)
- ❌ Ignorer les réticences (change management essentiel)

---

## SYNTHÈSE : 3 PRINCIPES DIRECTEURS

1. **Progressive** : Diagnostic → Pilote → Extension → Généralisation
2. **Pragmatique** : Focus irritants réels, quick wins mesurables
3. **Sécurisée** : Règles claires avant déploiement, pas d'improvisation

**Next step :** Validation approche + lancement diagnostic (2 semaines)

---

**Annexes à produire :**
- A. Grille d'évaluation maturité IA (par profil)
- B. Matrice classification données
- C. Template REX projet pilote
- D. Checklist sécurité IA