# Catalogue de Prompts Relecture

Une proposition de prompts pour auditer vos documents "Business" (propositions, spécifications) et vos supports "Editoriaux" (articles, posts).

## 📖 Table des matières
- [Catalogue de Prompts Relecture](#catalogue-de-prompts-relecture)
  - [📖 Table des matières](#-table-des-matières)
  - [🚀 Guide de démarrage](#-guide-de-démarrage)
  - [1. Structure \& Cohérence (Le Fond)](#1-structure--cohérence-le-fond)
    - [Analyse de Cohérence Globale](#analyse-de-cohérence-globale)
  - [2. Le Prompt "Caméléon" (Adaptable)](#2-le-prompt-caméléon-adaptable)
    - [Le Persona Sur-Mesure](#le-persona-sur-mesure)
  - [3. Les Personas Décideurs (Vision Stratégique)](#3-les-personas-décideurs-vision-stratégique)
    - [Le DAF (CFO) Sceptique](#le-daf-cfo-sceptique)
    - [Le DSI (CIO) Conservateur](#le-dsi-cio-conservateur)
    - [Le Métier (Utilisateur Final)](#le-métier-utilisateur-final)
    - [Le Client Mécontent (ou Exigeant)](#le-client-mécontent-ou-exigeant)
  - [4. Les Personas "Réalité Terrain" (Vision Exécution)](#4-les-personas-réalité-terrain-vision-exécution)
    - [L'Architecte Technique Rigoureux](#larchitecte-technique-rigoureux)
    - [Le Chef de Projet Terrain](#le-chef-de-projet-terrain)
    - [Le Stress Test Concurrent](#le-stress-test-concurrent)
  - [5. Les Tests "Crash Test" (Fun \& Radical)](#5-les-tests-crash-test-fun--radical)
    - [Le Test "12 ans" (Clarté)](#le-test-12-ans-clarté)
    - [Le Bullshit Detector (violent)](#le-bullshit-detector)
    - [Le Bullshit Detector avec echelle](#le-bullshit-detector-avec-echelle)
  - [6. Spécial "Publications \& Articles" (Le Kit de l'Article)](#6-spécial-publications--articles-le-kit-de-larticle)
    - [Le Prompt "Valeur / Densité"](#le-prompt-valeur--densité)
    - [Le Prompt "Anti-Putaclic / Qualité Perçue"](#le-prompt-anti-putaclic--qualité-perçue)
    - [Le Prompt "Journaliste Expérimenté"](#le-prompt-journaliste-expérimenté)
  - [7. La Synthèse pour Décider](#7-la-synthèse-pour-décider)
    - [La Matrice de Décision](#la-matrice-de-décision)
- [Fin du document](#fin-du-document)

## 🚀 Guide de démarrage
*Comment utiliser ce catalogue en 15 min chrono*

1.  **Choisissez 2 Personas opposés** (ex: un CFO pour les chiffres + un Concurrent pour la stratégie).
2.  **Ouvrez une conversation vierge** pour chaque persona (pour éviter la contamination du contexte).
3.  **Copiez-collez le prompt + votre texte**.
4.  **Compilez uniquement les critiques qui reviennent 2 fois**. Le reste, c'est du bruit.

## 1. Structure & Cohérence (Le Fond)
*Pour vérifier que la maison tient debout.*

### Analyse de Cohérence Globale
*Pourquoi l'utiliser : Pour s'assurer que le document ne se contredit pas et suit une logique claire.*
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

## 2. Le Prompt "Caméléon" (Adaptable)
*Le couteau suisse.*

### Le Persona Sur-Mesure
*Pourquoi l'utiliser : Pour simuler n'importe quel interlocuteur spécifique (Investisseur, Auditeur, Partenaire) sans chercher un prompt dédié.*
```
Tu es [ROLE : ex: un Investisseur VC / un Futur Client / un Auditeur Sécurité].
Ton profil : [TRAITS : ex: Sceptique, pressé, focalisé sur le ROI].
Ton objectif : Décider si [ACTION : ex: tu investis / tu signes / tu valides].

Analyse ce document selon ton point de vue unique.
1. Qu'est-ce qui te rassure ?
2. Qu'est-ce qui t'inquiète (Red Flags) ?
3. Quelles questions critiques poses-tu à l'auteur ?
4. Verdict : Go / No Go ?
```

## 3. Les Personas Décideurs (Vision Stratégique)
*Ceux qui signent les chèques et valident la conformité.*

### Le DAF (CFO) Sceptique
*Pourquoi l'utiliser : Pour blinder l'aspect financier et ROI de votre proposition.*
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

### Le DSI (CIO) Conservateur
*Pourquoi l'utiliser : Pour anticiper les blocages liés à la sécurité, au legacy et à l'intégration.*
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

### Le Métier (Utilisateur Final)
*Pourquoi l'utiliser : Pour vérifier que la solution répond à un vrai besoin et anticiper la résistance au changement.*
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

### Le Client Mécontent (ou Exigeant)
*Pourquoi l'utiliser : Pour tester la solidité de votre promesse de valeur face à un client échaudé.*
```
Tu as déjà acheté ce type de solution 3 fois. Ça a foiré 3 fois.
Tu es énervé et méfiant.
Qu'est-ce qui dans ce document te rappelle les arnaques précédentes ?
Qu'est-ce qui sent le "déjà vu qui a mal fini" ?

Exprime ta colère légitime.
```

## 4. Les Personas "Réalité Terrain" (Vision Exécution)
*Ceux qui font le travail et connaissent les problèmes du terrain.*

### L'Architecte Technique Rigoureux
*Pourquoi l'utiliser : Pour valider la faisabilité technique, la scalabilité et l'absence de dette technique cachée.*
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

### Le Chef de Projet Terrain
*Pourquoi l'utiliser : Pour vérifier le réalisme du planning et identifier les risques opérationnels.*
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

### Le Stress Test Concurrent
*Pourquoi l'utiliser : Pour identifier les faiblesses stratégiques que vos concurrents exploiteront.*
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

## 5. Les Tests "Crash Test" (Fun & Radical)
*Pour nettoyer le document de tout superflu.*

### Le Test "12 ans" (Clarté)
*Pourquoi l'utiliser : Pour forcer une vulgarisation extrême et vérifier que le message essentiel est clair.*
```
Tu as 12 ans et tu dois comprendre ce document.
- Quels mots tu ne comprends pas ?
- Quelles phrases sont trop compliquées ?
- Où tu décroches complètement ?
- Qu'est-ce qui devrait avoir un schéma ?

Si tu ne comprends pas, c'est que c'est mal expliqué.
```

### Le Bullshit Detector
*Pourquoi l'utiliser : Pour éliminer le jargon vide et les promesses intenables.*
```
Ton seul job : détecter le bullshit dans ce document.
- Buzzwords creux sans substance
- Promesses impossibles à tenir
- Généralisations abusives
- Affirmations non prouvées
- Logique fallacieuse

Sors ton détecteur de bullshit et ne fais pas de prisonniers.
```

### Le Bullshit Detector avec echelle
*Pourquoi l'utiliser : Pour éliminer le jargon vide et les promesses intenables.*
```
Ton job : détecter et QUANTIFIER le bullshit dans ce document.

ÉCHELLE DE NOTATION (sur 10) :

0-2/10 : SOLIDE
- Sources vérifiables citées
- Affirmations nuancées ou prouvées
- Reconnaissance explicite des limites
- Pas de promesses exagérées
- Contenu > packaging

3-4/10 : ACCEPTABLE 
- Quelques approximations mineures
- Packaging légèrement marketing mais honnête
- Manque parfois de nuances
- Affirmations généralement défendables

5-6/10 : LIMITE
- Mélange de vrai et d'exagérations
- Sources faibles ou absentes
- Promesses un peu trop belles
- Packaging commence à masquer le fond

7-8/10 : BULLSHIT STANDARD
- Affirmations péremptoires sans preuves
- Généralisations abusives
- "Révolution" / "Game changer" / "Tout a changé"
- Autopromo déguisée en sagesse
- Logique circulaire ou fallacieuse

9-10/10 : BULLSHIT PUR
- Zéro substance, 100% packaging
- Promesses impossibles assumées
- Buzzwords en rafale sans sens
- Pure manipulation émotionnelle
- Vente forcée déguisée en contenu

ANALYSE OBLIGATOIRE :
1. Note finale sur 10 avec justification
2. Top 3 des red flags détectés
3. Ce qui est factuellement faux (si applicable)
4. Ce qui est vrai mais exagéré
5. Le vrai message vs. le message marketé

Sois impitoyable sur les faits, mais juste sur l'échelle.
Pas de prisonniers sur le bullshit, mais reconnais le contenu solide.
```

## 6. Spécial "Publications & Articles" (Le Kit de l'Article)
*Les prompts spécifiques pour transformer un brouillon en article solide.*

### Le Prompt "Valeur / Densité"
*Pourquoi l'utiliser : Pour élaguer le remplissage et augmenter la densité d'information.*
```
Identifie dans ce document :
1. Les paragraphes qui n'apportent pas de valeur (pure rhétorique)
2. Les sections qui manquent de substance
3. Le ratio contenu utile / remplissage
4. Les zones où l'on pourrait être plus concis

Fournis un % de contenu "utile" vs "remplissage" pour chaque section.
```

### Le Prompt "Anti-Putaclic / Qualité Perçue"
*Pourquoi l'utiliser : Pour crédibiliser le ton et s'assurer que le contenu fait "pro".*
```
Tu es un lecteur qui sature des articles putaclic et des machins générés par IA.
Évalue :

La rigueur de l'argumentation (1-10)
La qualité des sources et références (1-10)
Le professionnalisme du ton (1-10)
La précision des données (1-10)
Qu'est-ce qui te fait penser "article de qualité" vs "article bof" ?
```

### Le Prompt "Journaliste Expérimenté"
*Pourquoi l'utiliser : Pour finaliser le style, le rendre plus humain, direct et engageant.*
```
Tu es un journaliste expérimenté.
L'audience apprécie un style [simple, romancé, direct, fleuri, concret, ...].
Reprends une analyse en profondeur de l'article en résultat et donnes-en un avis.
```

## 7. La Synthèse pour Décider
*Pour conclure et passer à l'action.*

### La Matrice de Décision
*Pourquoi l'utiliser : Pour obtenir un score objectif et faciliter la prise de décision (Go/No Go).*
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

# Fin du document