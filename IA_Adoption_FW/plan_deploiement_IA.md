# Plan de déploiement IA chez Etech - Contraintes et questionnements

## 1. Contexte organisationnel

### Contraintes identifiées
- Effectif limité (~50 personnes)
- Profils techniques hétérogènes (dev, devops, ops, archi, test)
- Outils IA actuels disparates et non standardisés (GitHub Copilot, Claude Team/Code, Cursor, Gemini)
- Absence de structure formelle dans l'adoption actuelle
- Nécessité d'interopérabilité avec les solutions clients

### Questionnements
- Quel est le niveau de maturité IA actuel de chaque profil/équipe ?
- Existe-t-il des champions IA informels dans l'organisation ?
- Quelle est la gouvernance IT/tech actuelle (processus de validation, d'achat) ?
- Y a-t-il un budget dédié à l'IA ou doit-il être créé ?
- Qui décide actuellement des outils utilisés (individuel, équipe, direction) ?

---

## 2. Stratégie IA

### Contraintes identifiées
- Besoin d'agnosticisme cloud (pas de dépendance Azure)
- Compatibilité obligatoire avec les solutions clients variées
- Contrainte de taille (pas de ressources pour gérer des solutions complexes)

### Questionnements
- Quels sont les cas d'usage prioritaires à adresser en premier ?
- Doit-on standardiser les outils ou accepter la diversité ? accepter la diversité
- Quel est l'objectif métier : productivité interne, offre client, ou les deux ? les deux
- Comment mesurer le ROI de l'adoption IA à notre échelle ?
- Quels sont les irritants actuels que l'IA pourrait résoudre ?
- Les clients demandent-ils déjà de l'IA ? Quels types de demandes ?

---

## 3. Identification des cas d'usage

### Contraintes identifiées
- Profils techniques avec des besoins différents (code, ops, architecture, test)
- Besoin de démontrer la valeur rapidement (petite structure)
- Risque de dispersion des efforts

### Questionnements
- Quels cas d'usage par profil (dev vs ops vs archi vs test) ?
- Quels processus internes sont chronophages et automatisables ?
- Quels cas d'usage sont demandés/attendus par les clients ?
- Y a-t-il des cas d'usage transverses (documentation, onboarding, veille) ?
- Quels cas d'usage génèrent le plus de valeur métier mesurable ?
- Doit-on prioriser les quick wins ou les transformations profondes ?

---

## 4. Choix technologique

### Contraintes identifiées
- Multiplicité des outils actuels (GitHub Copilot, Claude, Cursor, Gemini)
- Besoin d'agnosticisme (multi-cloud, multi-provider)
- Interopérabilité avec solutions clients
- Compétences techniques présentes mais disparates

### Questionnements
- Faut-il standardiser sur un outil principal ou maintenir la diversité ?
- Quels critères de sélection : coût, performance, facilité d'usage, interopérabilité ?
- SaaS uniquement ou besoin de solutions on-premise/hybrides pour certains clients ?
- Comment gérer les APIs IA (OpenAI, Anthropic, Google, open source) ?
- Faut-il une plateforme d'orchestration IA (LangChain, Semantic Kernel, autre) ?
- Quelle stratégie pour les modèles : uniquement propriétaires, hybride avec open source ?
- Comment garantir la portabilité des développements IA entre providers ?

---

## 5. Gouvernance des données

### Contraintes identifiées
- Données clients potentiellement sensibles
- Risque de fuite d'informations confidentielles via outils IA
- Hétérogénéité des exigences selon les clients

### Questionnements
- Quelle classification des données existe actuellement ?
- Quelles données peuvent être envoyées à des LLM tiers ?
- Comment isoler les données clients entre eux ?
- Faut-il des instances IA dédiées par client/projet ?
- Quelle politique de rétention des prompts/conversations ?
- Comment auditer l'usage des outils IA (traçabilité) ?
- Quelles sont les exigences RGPD à respecter ?
- Les contrats clients imposent-ils des contraintes spécifiques ?

---

## 6. Compétences et formation

### Contraintes identifiées
- 50 personnes avec niveaux de compétence IA variables
- Pas de temps dédié évident pour la formation
- Profils techniques mais pas forcément experts IA/ML

### Questionnements
- Quel est le niveau de connaissance actuel (prompt engineering, RAG, fine-tuning) ?
- Qui peut devenir référent IA par domaine ?
- Faut-il former tout le monde ou créer une cellule spécialisée ?
- Quel format de formation : interne, externe, certification, auto-apprentissage ?
- Comment capitaliser sur les apprentissages individuels actuels ?
- Faut-il recruter des compétences IA spécifiques ?
- Comment mesurer la montée en compétence ?

---

## 7. IA responsable et éthique

### Contraintes identifiées
- Risques liés à l'utilisation d'IA (biais, hallucinations, sécurité)
- Responsabilité vis-à-vis des clients
- Réglementation IA émergente (AI Act européen)

### Questionnements
- Quels principes d'IA responsable adopter ?
- Comment détecter et gérer les hallucinations ?
- Quelle responsabilité en cas d'erreur de l'IA dans un livrable client ?
- Comment auditer les outputs IA avant livraison ?
- Faut-il informer les clients de l'usage d'IA ?
- Quelle politique sur la génération de code (propriété intellectuelle) ?
- Comment gérer les biais potentiels dans les recommandations IA ?

---

## 8. Sécurité

### Contraintes identifiées
- Outils IA souvent en SaaS avec données externalisées
- Risque de fuite de secrets (tokens, passwords) dans les prompts
- Diversité des outils complique le contrôle

### Questionnements
- Comment empêcher la fuite de secrets via les outils IA ?
- Faut-il des outils de DLP (Data Loss Prevention) ?
- Quelle politique d'authentification/autorisation sur les outils IA ?
- Comment sécuriser les APIs IA utilisées ?
- Faut-il des audits de sécurité spécifiques IA ?
- Comment gérer les vulnérabilités dans le code généré par IA ?
- Quelles solutions pour détecter l'usage non autorisé d'IA ?

---

## 9. Gestion des coûts

### Contraintes identifiées
- Multiplicité des abonnements actuels (risque de coûts dispersés)
- Coûts potentiellement imprévisibles (usage à la consommation)
- Budget limité (PME ~50 personnes)

### Questionnements
- Quel est le coût total actuel des outils IA ?
- Faut-il centraliser les achats ou laisser l'autonomie ?
- Comment prévoir et contrôler les coûts API (tokens) ?
- Quelle stratégie de pricing : par utilisateur, à la consommation, mixte ?
- Peut-on facturer l'IA aux clients (refacturation, valorisation) ?
- Faut-il un budget d'expérimentation distinct du budget production ?
- Comment optimiser les coûts (cache, modèles moins chers, open source) ?

---

## 10. Interopérabilité et portabilité

### Contraintes identifiées
- Clients avec des solutions cloud/IA variées
- Risque de lock-in fournisseur
- Besoin d'adaptation rapide aux demandes clients

### Questionnements
- Quels standards d'interopérabilité adopter (OpenAI API, MCP, autres) ?
- Comment abstraire les appels aux LLM pour changer facilement de provider ?
- Faut-il une couche d'abstraction maison ou s'appuyer sur des frameworks ?
- Comment gérer les spécificités de chaque client (Azure OpenAI, AWS Bedrock, GCP Vertex) ?
- Quelle stratégie multi-cloud pour les déploiements IA ?
- Comment documenter et partager les patterns d'intégration ?

---

## 11. Adoption et conduite du changement

### Contraintes identifiées
- Adoption actuelle organique et non pilotée
- Risque de résistance à la standardisation
- Pas de culture formelle de partage sur l'IA

### Questionnements
- Comment faire adhérer les équipes à une stratégie commune ?
- Faut-il imposer ou recommander des outils/pratiques ?
- Comment valoriser les early adopters et leurs retours ?
- Quelle communication autour du plan IA (pourquoi, comment, quand) ?
- Comment mesurer l'adoption (métriques d'usage) ?
- Faut-il des incentives pour encourager l'utilisation ?
- Comment gérer les réticences ou les craintes (perte d'emploi, déqualification) ?

---

## 12. Organisation et rôles

### Contraintes identifiées
- Petite structure sans rôles IA formalisés
- Risque de dilution des responsabilités
- Besoin de réactivité (pas de lourdeur bureaucratique)

### Questionnements
- Faut-il créer un rôle de "responsable IA" ou "AI Champion" ?
- Qui décide des outils autorisés ?
- Qui gère les licences et les accès ?
- Faut-il un comité IA ou une gouvernance légère ?
- Comment articuler IA et organisation existante (équipes projet, pôles) ?
- Qui est responsable de la veille technologique IA ?
- Comment organiser le support interne (aide, troubleshooting) ?

---

## 13. Mesure et amélioration continue

### Contraintes identifiées
- Pas de métriques actuelles sur l'usage IA
- Difficulté à mesurer l'impact réel
- Risque de déployer sans évaluer

### Questionnements
- Quels KPIs définir (productivité, qualité, satisfaction, coûts, temps) ?
- Comment mesurer le ROI de l'IA ?
- Quelle fréquence de revue de la stratégie IA ?
- Comment collecter les retours d'expérience ?
- Faut-il des outils de monitoring spécifiques (dashboards) ?
- Comment capitaliser sur les apprentissages pour améliorer ?
- Quelle boucle de feedback : individuelle, équipe, organisation ?

---

## 14. Conformité réglementaire

### Contraintes identifiées
- AI Act européen en cours de déploiement
- Secteurs clients potentiellement réglementés
- Risques juridiques mal évalués

### Questionnements
- Quelles réglementations s'appliquent (AI Act, RGPD, sectorielles) ?
- Les cas d'usage envisagés sont-ils classés à risque (élevé, limité, minimal) ?
- Faut-il des évaluations d'impact IA (AIIA) ?
- Comment documenter la conformité pour les audits ?
- Les clients imposent-ils des certifications IA ?
- Faut-il un DPO impliqué dans la gouvernance IA ?
- Comment anticiper les évolutions réglementaires ?

---

## 15. Roadmap et priorisation

### Contraintes identifiées
- Ressources limitées (temps, budget, personnes)
- Besoin de résultats rapides (légitimation)
- Multiplicité des sujets à adresser

### Questionnements
- Quelle temporalité : 3 mois, 6 mois, 1 an ?
- Faut-il des phases (pilote, déploiement, généralisation) ?
- Quels quick wins prioriser pour démontrer la valeur ?
- Comment séquencer : gouvernance d'abord, puis usages ? Ou l'inverse ?
- Faut-il un projet pilote sur un cas d'usage / une équipe ?
- Comment gérer les dépendances entre sujets (ex: gouvernance avant déploiement) ?
- Quelle flexibilité pour ajuster le plan en cours de route ?
