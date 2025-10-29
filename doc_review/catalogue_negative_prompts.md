# 📚 Catalogue de Prompts - Relecture IA

---

> **💡 Comment utiliser ce catalogue ?**  
> Ce document est une bibliothèque de tous les prompts disponibles. Pour savoir **quels prompts utiliser selon votre contexte**, consultez le **[Guide d'Usage](guide_usage.md)**.

---

## 📑 Table des Matières

- [📚 Catalogue de Prompts - Relecture IA](#-catalogue-de-prompts---relecture-ia)
  - [📑 Table des Matières](#-table-des-matières)
  - [1. Structure \& Cohérence](#1-structure--cohérence)
    - [P1.1 - Analyse de Cohérence Globale](#p11---analyse-de-cohérence-globale)
    - [P1.2 - Test de la Pyramide Inversée](#p12---test-de-la-pyramide-inversée)
    - [P1.3 - Évaluation de la Densité](#p13---évaluation-de-la-densité)
    - [P1.4 - Test Cohérence Express (15 sec)](#p14---test-cohérence-express-15-sec)
  - [2. Personas Direction](#2-personas-direction)
    - [P2.1 - Le CFO Sceptique](#p21---le-cfo-sceptique)
    - [P2.2 - Le CEO Pragmatique](#p22---le-ceo-pragmatique)
    - [P2.3 - Le CEO Express (1 min)](#p23---le-ceo-express-1-min)
    - [P2.4 - Le CDO Innovant mais Échaudé](#p24---le-cdo-innovant-mais-échaudé)
  - [3. Personas Techniques](#3-personas-techniques)
    - [P3.1 - L'Architecte Technique Rigoureux](#p31---larchitecte-technique-rigoureux)
    - [P3.2 - Le Chef de Projet Terrain](#p32---le-chef-de-projet-terrain)
    - [P3.3 - Le Chef de Projet Express](#p33---le-chef-de-projet-express)
    - [P3.4 - Le DSI Conservateur](#p34---le-dsi-conservateur)
  - [4. Personas Utilisateurs](#4-personas-utilisateurs)
    - [P4.1 - L'Utilisateur Final Résistant](#p41---lutilisateur-final-résistant)
    - [P4.2 - Le Middle Manager Inquiet](#p42---le-middle-manager-inquiet)
  - [5. Tests de Robustesse](#5-tests-de-robustesse)
    - [P5.1 - Le Stress Test Concurrent](#p51---le-stress-test-concurrent)
    - [P5.2 - Le Concurrent Express](#p52---le-concurrent-express)
    - [P5.3 - L'Audit de Crédibilité](#p53---laudit-de-crédibilité)
    - [P5.4 - Le Test du "So What?"](#p54---le-test-du-so-what)
    - [P5.5 - Le Bullshit Detector](#p55---le-bullshit-detector)
    - [P5.6 - Le Client Mécontent](#p56---le-client-mécontent)
    - [P5.7 - L'Expert du Domaine](#p57---lexpert-du-domaine)
  - [6. Analyses Spécialisées](#6-analyses-spécialisées)
    - [P6.1 - Analyse du Ton et du Registre](#p61---analyse-du-ton-et-du-registre)
    - [P6.2 - Vérification de l'Accessibilité](#p62---vérification-de-laccessibilité)
    - [P6.3 - Le Test "12 ans"](#p63---le-test-12-ans)
    - [P6.4 - Test de Mémorabilité](#p64---test-de-mémorabilité)
    - [P6.5 - Test "Trop Cher"](#p65---test-trop-cher)
    - [P6.6 - Test "Trop Théorique"](#p66---test-trop-théorique)
    - [P6.7 - Test "Pas Sérieux"](#p67---test-pas-sérieux)
    - [P6.8 - Test "Trop Long"](#p68---test-trop-long)
  - [7. Prompts de Synthèse](#7-prompts-de-synthèse)
    - [P7.1 - Executive Summary Critique](#p71---executive-summary-critique)
    - [P7.2 - Synthèse Express 5 Points](#p72---synthèse-express-5-points)
    - [P7.3 - Matrice de Décision](#p73---matrice-de-décision)
    - [P7.4 - Le Prompt Ultimate (Multi-Perspectives)](#p74---le-prompt-ultimate-multi-perspectives)

---

## 1. Structure & Cohérence

### P1.1 - Analyse de Cohérence Globale
```
Analyse ce document en vérifiant :
1. La cohérence logique du début à la fin
2. Les éventuelles contradictions entre sections
3. Les ruptures dans le fil narratif
4. Les redondances inutiles

Fournis un rapport structuré avec :
- Les incohérences identifiées (avec numéros de page/section)
- Le niveau de gravité (mineur/majeur/critique)
- Des suggestions de correction
```

**Quand l'utiliser :** Documents longs, multi-contributeurs, avant envoi final  
**Durée estimée :** 3-5 min  
**Tag :** `#cohérence` `#structure` `#base`

---

### P1.2 - Test de la Pyramide Inversée
```
Ce document suit-il le principe de la pyramide inversée ?
- Le message clé est-il clair dès le début ?
- Les informations sont-elles hiérarchisées par importance ?
- Un lecteur pressé comprendrait-il l'essentiel en lisant seulement les 20% premiers ?

Note chaque section de 1 à 5 sur la clarté du message principal.
```

**Quand l'utiliser :** Executive summaries, propositions commerciales, pitchs  
**Durée estimée :** 2-3 min  
**Tag :** `#structure` `#executive` `#priorité`

---

### P1.3 - Évaluation de la Densité
```
Identifie dans ce document :
1. Les paragraphes qui n'apportent pas de valeur (pure rhétorique)
2. Les sections qui manquent de substance
3. Le ratio contenu utile / remplissage
4. Les zones où l'on pourrait être plus concis

Fournis un % de contenu "utile" vs "remplissage" pour chaque section.
```

**Quand l'utiliser :** Documents > 10 pages, feedback "trop long"  
**Durée estimée :** 3-4 min  
**Tag :** `#densité` `#concision` `#remplissage`

---

### P1.4 - Test Cohérence Express (15 sec)
```
Identifie en bullet points :
- Les contradictions dans ce document
- Les sections qui ne s'enchaînent pas logiquement  
- Les redondances inutiles
- Ce qui manque pour que ce soit complet

Sois direct et factuel.
```

**Quand l'utiliser :** Validation rapide avant envoi  
**Durée estimée :** 1 min  
**Tag :** `#express` `#cohérence` `#rapide`

---

## 2. Personas Direction

### P2.1 - Le CFO Sceptique
```
Tu es un Directeur Financier avec 20 ans d'expérience. Tu as vu passer des dizaines de propositions de transformation. Tu es naturellement sceptique sur les promesses de ROI et cherches toujours les coûts cachés.

Analyse ce document en te concentrant sur :
- La crédibilité des projections financières
- Les coûts non mentionnés ou minimisés
- Le réalisme du planning
- Les risques financiers non adressés
- Le manque de métriques concrètes

Pour chaque point faible, indique ce qui manque pour te convaincre.
```

**Quand l'utiliser :** Business case, proposition d'investissement, transformation  
**Durée estimée :** 3-5 min  
**Tag :** `#finance` `#ROI` `#persona` `#direction`

---

### P2.2 - Le CEO Pragmatique
```
Tu es CEO d'une entreprise de [taille]. Tu as 5 minutes pour parcourir ce document avant une réunion. Tu cherches :
1. La proposition de valeur en une phrase
2. L'impact business concret
3. Pourquoi maintenant et pas dans 6 mois
4. Ce qui différencie cette approche
5. Les quick wins possibles

Qu'est-ce qui te fait dire "oui" ou "non" ? Sois direct et sans filtre.
```

**Quand l'utiliser :** Documents stratégiques, propositions de transformation, pitchs  
**Durée estimée :** 2-3 min  
**Tag :** `#stratégie` `#valeur` `#persona` `#direction`

---

### P2.3 - Le CEO Express (1 min)
```
Tu es [CEO/CFO/CTO] avec 2 minutes pour lire ce document.
Réponds :
1. Quelle est la proposition de valeur ?
2. Quel est le ROI concret ?
3. Pourquoi maintenant ?
4. Qu'est-ce qui te fait dire OUI ou NON ?

Sois brutal dans ton feedback.
```

**Quand l'utiliser :** Validation ultra-rapide, deadline urgente  
**Durée estimée :** 1-2 min  
**Tag :** `#express` `#direction` `#décision`

---

### P2.4 - Le CDO Innovant mais Échaudé
```
Tu es Chief Digital Officer. Tu as mené 3 transformations digitales, dont une qui a échoué. Tu es enthousiaste sur l'innovation mais tu connais les pièges.

Évalue ce document sur :
- Le réalisme de la transformation proposée
- Les prérequis organisationnels non mentionnés
- La maturité technique requise
- Les risques de résistance au changement
- La vraie capacité d'exécution

Identifie tous les "red flags" basés sur ton expérience.
```

**Quand l'utiliser :** Projets de transformation digitale, innovation organisationnelle  
**Durée estimée :** 4-5 min  
**Tag :** `#digital` `#transformation` `#persona` `#direction`

---

## 3. Personas Techniques

### P3.1 - L'Architecte Technique Rigoureux
```
Tu es Lead Architect avec une obsession pour la scalabilité et la maintenabilité. 

Analyse ce document technique en vérifiant :
- La faisabilité technique réelle
- Les dépendances non mentionnées
- Les risques de dette technique
- L'alignement avec les standards du marché
- Les compétences requises vs disponibles

Sois particulièrement critique sur les simplifications excessives.
```

**Quand l'utiliser :** Spécifications techniques, propositions d'architecture  
**Durée estimée :** 4-6 min  
**Tag :** `#technique` `#architecture` `#persona` `#faisabilité`

---

### P3.2 - Le Chef de Projet Terrain
```
Tu es Chef de Projet. Tu as géré 50+ projets, dont 30% ont dérapé en délai ou budget.

Examine ce document avec ton œil de praticien :
- Le planning est-il réaliste ou optimiste ?
- Quelles sont les dépendances critiques cachées ?
- Où sont les buffers pour les imprévus ?
- Les ressources prévues sont-elles suffisantes ?
- Quels sont les risques non identifiés ?

Liste tout ce qui te fait penser "ça va déraper".
```

**Quand l'utiliser :** Planning projet, feuille de route, proposition de projet  
**Durée estimée :** 3-4 min  
**Tag :** `#projet` `#planning` `#persona` `#réalisme`

---

### P3.3 - Le Chef de Projet Express
```
Tu es chef de projet expérimenté. Tu as vu des projets similaires échouer.
Liste :
- Ce qui est irréaliste dans le planning
- Les coûts cachés non mentionnés
- Les dépendances critiques oubliées
- Les compétences requises mais pas disponibles

Pas de complaisance.
```

**Quand l'utiliser :** Validation rapide de planning  
**Durée estimée :** 2-3 min  
**Tag :** `#express` `#projet` `#réalisme`

---

### P3.4 - Le DSI Conservateur
```
Tu es DSI d'une entreprise traditionnelle. Ta priorité : la stabilité et la sécurité. Tu as un legacy important et peu de budget.

Évalue cette proposition selon :
- L'impact sur les systèmes existants
- Les risques de sécurité
- La complexité d'intégration
- Les besoins en compétences nouvelles
- Le TCO réel sur 5 ans

Quelles questions poses-tu pour protéger ton SI ?
```

**Quand l'utiliser :** Propositions impactant le SI, projets d'intégration  
**Durée estimée :** 4-5 min  
**Tag :** `#SI` `#sécurité` `#persona` `#legacy`

---

## 4. Personas Utilisateurs

### P4.1 - L'Utilisateur Final Résistant
```
Tu es un utilisateur métier senior. Tu maîtrises parfaitement tes outils actuels et tu es sceptique sur les changements.

Lis ce document et exprime :
- Ce qui te fait peur dans ce changement
- Les fonctionnalités dont tu as vraiment besoin
- Ce qui ressemble à du "gadget" inutile
- L'effort d'apprentissage que ça représente
- Les vrais bénéfices pour ton quotidien

Sois honnête sur ce qui te motiverait vraiment à changer.
```

**Quand l'utiliser :** Projets de changement d'outils, adoption utilisateurs  
**Durée estimée :** 3-4 min  
**Tag :** `#utilisateur` `#adoption` `#persona` `#résistance`

---

### P4.2 - Le Middle Manager Inquiet
```
Tu es manager intermédiaire. Cette transformation pourrait impacter ton équipe et potentiellement ton rôle.

Analyse le document en pensant à :
- L'impact sur ton équipe
- Les compétences à développer
- Les changements organisationnels sous-entendus
- Ton rôle dans 2 ans si ça se fait
- Les résistances prévisibles de tes équipes

Quelles garanties demandes-tu ?
```

**Quand l'utiliser :** Projets de réorganisation, transformation managériale  
**Durée estimée :** 3-4 min  
**Tag :** `#management` `#organisation` `#persona` `#équipe`

---

## 5. Tests de Robustesse

### P5.1 - Le Stress Test Concurrent
```
Tu es consultant senior chez [Concurrent]. On te demande de démonter cette proposition pour gagner le deal.

Attaque le document sur :
- Les faiblesses méthodologiques
- Les références datées ou non pertinentes
- Les promesses non étayées
- Les simplifications abusives
- Les coûts sous-estimés

Comment construirais-tu une contre-proposition gagnante ?
```

**Quand l'utiliser :** Propositions commerciales, appels d'offres  
**Durée estimée :** 3-4 min  
**Tag :** `#concurrent` `#attaque` `#robustesse` `#commercial`

---

### P5.2 - Le Concurrent Express
```
Tu travailles pour un concurrent. Comment démolir cette proposition ?
- Points faibles de l'argumentation
- Promesses non prouvées
- Simplifications abusives
- Ce que tu proposerais de mieux

Sois impitoyable.
```

**Quand l'utiliser :** Validation rapide avant envoi commercial  
**Durée estimée :** 2-3 min  
**Tag :** `#express` `#concurrent` `#commercial`

---

### P5.3 - L'Audit de Crédibilité
```
Vérifie la crédibilité de ce document :
1. Les références sont-elles vérifiables et récentes ?
2. Les statistiques sont-elles sourcées correctement ?
3. Les cas clients sont-ils pertinents pour le contexte ?
4. Les experts cités sont-ils reconnus ?
5. Y a-t-il des affirmations non prouvées présentées comme des faits ?

Note la crédibilité globale de 1 à 10 avec justification.
```

**Quand l'utiliser :** Documents à forte valeur, audits qualité  
**Durée estimée :** 4-5 min  
**Tag :** `#crédibilité` `#sources` `#audit` `#qualité`

---

### P5.4 - Le Test du "So What?"
```
Pour chaque section de ce document, applique le test du "So What?" :
- Quelle est la vraie valeur ajoutée de cette section ?
- Qu'est-ce que ça change concrètement ?
- Pourquoi le lecteur devrait s'en soucier ?
- Peut-on supprimer cette section sans perdre le message ?

Identifie toutes les sections qui échouent au test.
```

**Quand l'utiliser :** Documents trop longs, optimisation de contenu  
**Durée estimée :** 3-4 min  
**Tag :** `#valeur` `#pertinence` `#optimisation`

---

### P5.5 - Le Bullshit Detector
```
Ton seul job : détecter le bullshit dans ce document.
- Buzzwords creux sans substance
- Promesses impossibles à tenir
- Généralisations abusives
- Affirmations non prouvées
- Logique fallacieuse

Sors ton détecteur de bullshit et ne fais pas de prisonniers.
```

**Quand l'utiliser :** Documents marketing, propositions trop optimistes  
**Durée estimée :** 2-3 min  
**Tag :** `#bullshit` `#critique` `#buzzwords` `#⚠️`

---

### P5.6 - Le Client Mécontent
```
Tu as déjà acheté ce type de solution 3 fois. Ça a foiré 3 fois.
Tu es énervé et méfiant.
Qu'est-ce qui dans ce document te rappelle les arnaques précédentes ?
Qu'est-ce qui sent le "déjà vu qui a mal fini" ?

Exprime ta colère légitime.
```

**Quand l'utiliser :** Propositions de vente récurrentes, clients échaudés  
**Durée estimée :** 2-3 min  
**Tag :** `#client` `#méfiance` `#retex` `#⚠️`

---

### P5.7 - L'Expert du Domaine
```
Tu es LE expert mondial sur ce sujet. PhD + 30 ans d'expérience.
Identifie :
- Les erreurs factuelles
- Les simplifications dangereuses  
- Les contre-vérités
- Ce qui est dépassé depuis 5 ans
- Ce que seul un amateur dirait

Démolis avec l'autorité de l'expert.
```

**Quand l'utiliser :** Documents techniques pointus, publications  
**Durée estimée :** 4-5 min  
**Tag :** `#expert` `#technique` `#précision` `#⚠️`

---

## 6. Analyses Spécialisées

### P6.1 - Analyse du Ton et du Registre
```
Analyse le ton de ce document :
1. Est-il cohérent du début à la fin ?
2. Est-il adapté à l'audience cible ?
3. Y a-t-il des ruptures de ton problématiques ?
4. Le niveau de technicité est-il approprié ?
5. Le document est-il trop commercial ou trop technique ?

Fournis des exemples précis de phrases problématiques.
```

**Quand l'utiliser :** Multi-contributeurs, documents mixtes tech/business  
**Durée estimée :** 3-4 min  
**Tag :** `#ton` `#style` `#audience` `#cohérence`

---

### P6.2 - Vérification de l'Accessibilité
```
Ce document est-il accessible à quelqu'un qui ne connaît pas le sujet ?
- Liste tous les acronymes non définis
- Identifie le jargon technique non expliqué
- Trouve les concepts qui nécessitent des prérequis
- Évalue si un non-expert peut comprendre l'essentiel
- Propose des simplifications pour les passages complexes
```

**Quand l'utiliser :** Documents grand public, formations, vulgarisation  
**Durée estimée :** 3-4 min  
**Tag :** `#accessibilité` `#jargon` `#vulgarisation` `#clarté`

---

### P6.3 - Le Test "12 ans"
```
Tu as 12 ans et tu dois comprendre ce document.
- Quels mots tu ne comprends pas ?
- Quelles phrases sont trop compliquées ?
- Où tu décroches complètement ?
- Qu'est-ce qui devrait avoir un schéma ?

Si tu ne comprends pas, c'est que c'est mal expliqué.
```

**Quand l'utiliser :** Test de simplicité extrême, vulgarisation  
**Durée estimée :** 2-3 min  
**Tag :** `#simplicité` `#vulgarisation` `#clarté` `#express`

---

### P6.4 - Test de Mémorabilité
```
Un lecteur vient de finir ce document. Dans 1 semaine, que retiendra-t-il ?
1. Identifie les 3 messages clés qui restent
2. Les concepts vraiment différenciants
3. Les éléments "forgettable"
4. Ce qui manque pour marquer les esprits

Le document réussit-il à être mémorable ?
```

**Quand l'utiliser :** Pitchs, présentations, documents de marque  
**Durée estimée :** 3-4 min  
**Tag :** `#mémorabilité` `#impact` `#message`

---

### P6.5 - Test "Trop Cher"
```
Tu es un acheteur professionnel. Ton job : réduire les coûts.
Dans ce document :
- Qu'est-ce qui semble surfacturé ?
- Quels coûts ne sont pas justifiés ?
- Où peux-tu négocier -30% facilement ?
- Quelle alternative moins chère proposerais-tu ?

Sois aussi dur qu'un vrai acheteur.
```

**Quand l'utiliser :** Propositions commerciales, budgets  
**Durée estimée :** 2-3 min  
**Tag :** `#coûts` `#négociation` `#acheteur` `#express`

---

### P6.6 - Test "Trop Théorique"
```
Compte dans ce document :
- Nombre d'exemples concrets avec chiffres
- Nombre de cas clients nommés
- Nombre de frameworks/modèles théoriques
- Ratio pratique/théorie (en %)

Pour chaque concept théorique, demande : "Montre-moi UN cas réel où ça a marché."
```

**Quand l'utiliser :** Documents académiques, consultants, stratégie  
**Durée estimée :** 2-3 min  
**Tag :** `#pratique` `#concret` `#exemples` `#express`

---

### P6.7 - Test "Pas Sérieux"
```
Tu es un senior partner dans un cabinet prestigieux.
Évalue :
- La rigueur de l'argumentation (1-10)
- La qualité des sources et références (1-10)
- Le professionnalisme du ton (1-10)
- La précision des données (1-10)

Qu'est-ce qui te fait penser "junior" vs "senior" ?
```

**Quand l'utiliser :** Documents stratégiques, publications  
**Durée estimée :** 3-4 min  
**Tag :** `#sérieux` `#professionnalisme` `#qualité` `#express`

---

### P6.8 - Test "Trop Long"
```
Ce document fait X pages.
1. Quelles sections peuvent être supprimées sans perdre le message ?
2. Quels paragraphes sont du pur remplissage ?
3. Peux-tu résumer le document en 1 page max ?
4. Quelle est la longueur optimale pour ce type de document ?

Coupe tout ce qui n'est pas essentiel.
```

**Quand l'utiliser :** Documents > 20 pages, optimisation  
**Durée estimée :** 3-4 min  
**Tag :** `#longueur` `#concision` `#optimisation` `#express`

---

## 7. Prompts de Synthèse

### P7.1 - Executive Summary Critique
```
Génère un executive summary critique de ce document en 5 points :
1. Forces principales (max 2)
2. Faiblesses majeures (max 3)
3. Risques non adressés
4. Opportunités manquées
5. Recommandation finale : GO / NO GO / À RETRAVAILLER

Sois factuel et orienté décision.
```

**Quand l'utiliser :** Validation finale, prise de décision  
**Durée estimée :** 3-4 min  
**Tag :** `#synthèse` `#décision` `#executive`

---

### P7.2 - Synthèse Express 5 Points
```
Synthèse en 5 points :
1. LA force principale
2. LES 2 faiblesses majeures  
3. LE risque non adressé le plus grave
4. CE QUI manque pour convaincre
5. Verdict : ENVOYER / RETRAVAILLER / REFAIRE

Pas de langue de bois.
```

**Quand l'utiliser :** Validation ultra-rapide, décision GO/NO GO  
**Durée estimée :** 2-3 min  
**Tag :** `#express` `#synthèse` `#décision`

---

### P7.3 - Matrice de Décision
```
Crée une matrice de décision basée sur ce document :

| Critère              | Note (1-5) | Poids | Commentaire |
| -------------------- | ---------- | ----- | ----------- |
| Clarté du ROI        |            | 30%   |             |
| Faisabilité          |            | 25%   |             |
| Risques maîtrisés    |            | 20%   |             |
| Différenciation      |            | 15%   |             |
| Rapidité d'exécution |            | 10%   |             |

Score final : XX/100
Recommandation : [Décision]
```

**Quand l'utiliser :** Décisions complexes, comparaison d'options  
**Durée estimée :** 4-5 min  
**Tag :** `#décision` `#matrice` `#scoring` `#comparaison`

---

### P7.4 - Le Prompt Ultimate (Multi-Perspectives)
```
Tu vas analyser ce document selon 5 perspectives en 1 minute chacune :

1. CEO pressé : C'est quoi le deal ? Ça vaut le coup ?
2. CFO sceptique : Où sont les coûts cachés ? Le ROI est bidon ?
3. Utilisateur final : Qu'est-ce que ça change pour moi concrètement ?
4. Concurrent : Comment je détruis cette proposition ?
5. Expert du domaine : Quelles erreurs/naïvetés vois-tu ?

Pour chaque perspective : 
- Le point le plus fort
- Le point le plus faible
- Verdict : CONVINCE / NE CONVINCE PAS

Synthèse finale : Ce document est-il prêt ? OUI/NON
Si NON : LA chose à corriger en priorité.
```

**Quand l'utiliser :** Validation complète en une seule passe  
**Durée estimée :** 5-7 min  
**Tag :** `#ultimate` `#complet` `#multi-perspectives` `#⭐`

---

**📖 Retour au [README](README.md)** | **🎯 [Guide d'Usage](GUIDE_USAGE.md)** | **✅ [Checklist](checklist_relecture_ia.md)**
