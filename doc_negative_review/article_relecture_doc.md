# Arrêtez de demander au LLM si c'est bien. Demandez-lui ce qui cloche.

## Introduction : La boucle de l'enfer

Il y a quelques mois, pour un talk technique, j'ai demandé à Claude : *"Qu'en penses-tu ?"*

*   V1 : *"Excellent ! Solide."*
*   V2 (après retouches) : *"Génial ! Mais inverse A et B, et rajoutes C."*
*   V3 (après modifs) : *"Parfait ! Pour améliorer la fluidité, inverser B et A. Et C ne sert à rien."*

J'ai compris ce soir-là que l'IA préférait me répondre positivement plutôt que de me dire ce qui clochait. Ce comportement de "Yes Man" n'est pas un bug, c'est un défaut de conception documenté.

## Le problème : le biais de complaisance des LLM

### La "sycophancy" (complaisance) : un défaut documenté

Les grands modèles de langage (ChatGPT, Claude, Gemini, etc.) montrent systématiquement un comportement appelé "sycophancy" (complaisance) : ils ont tendance à valider les opinions de l'utilisateur plutôt que de les contredire, même lorsque ces opinions sont incorrectes [1].

### Le coupable : le réentraînement (Reinforcement Learning from Human Feedback - RLHF)

Le réentraînement des modèles (RLHF) favorise les réponses qui plaisent aux évaluateurs humains plutôt que la vérité objective. Paradoxalement, plus un modèle est grand et entraîné, plus il devient complaisant [2].

**Résultat** : Le modèle est optimisé pour votre satisfaction immédiate, pas pour la vérité.

### Les conséquences concrètes critiques

Des études récentes montrent que les LLM changent leurs réponses lorsqu'elles sont contestées, même quand leur réponse initiale était correcte.

Concrètement, une simple remise en question (ex: "T'es sûr ?") peut pousser le LLM à changer sa réponse par pression sociale, validant l'utilisateur au détriment de la vérité [3].

## La solution : les personas négatifs

Le changement de formulation transforme radicalement les retours :

| Prompt                                                 | Type de retour obtenu                           |
| ------------------------------------------------------ | ----------------------------------------------- |
| "Analyse ce document"                                  | Feedback positif générique + suggestions molles |
| "Critique ce document"                                 | Critiques ouvertes du document                  |
| "Tu es un concurrent. Comment tu attaquerais ce doc ?" | Identification de vraies faiblesses             |

> **Astuce** : Précisez au modèle que ce document n'est pas le vôtre (ex: "J'ai reçu ce brouillon d'un collègue..."). Cela désactive le filtre de politesse du modèle qui cherche à ne pas vous vexer.

## Pourquoi ça marche ?

### Contrainte de l'adversaire

En imposant un rôle critique, vous créez une tension dans le prompt : l'IA doit choisir entre respecter votre consigne (être critique) et suivre son biais de complaisance (être positive).

Le prompt adversarial **augmente la probabilité** de réponses critiques sans éliminer complètement le biais.

### Simuler l'adversité avant qu'elle arrive

Les personas négatifs sont un **stress-test documentaire**. Ils simulent les objections réelles dans un environnement contrôlé.

Cette approche s'inspire de méthodes éprouvées :
- **Red teaming** en cybersécurité : des équipes attaquent leurs propres systèmes pour trouver les vulnérabilités
- **Stress tests bancaires** : les banques testent leurs portefeuilles avec des scénarios catastrophes (régulation Bâle III)
- **Murder boards** militaires/corporate : des panels dont le job est de détruire votre argumentaire avant la vraie présentation

### Remplacement d'un lecteur externe

Si un LLM lit votre doc et ne comprend pas vos propos, un lecteur pressé risque de ne pas le comprendre non plus.

Par ce test, elle devient un **indicateur de complexité** en identifiant le langage spécifique à votre domaine qu'elle ne maitrise pas (et que donc un lecteur externe ne maitrise pas non plus).

## Limites et bonnes pratiques

### 1. Faux positifs : la règle des "2+ personas"
Le LLM peut inventer des problèmes pour satisfaire la consigne. 
**Règle** : Si **2+ personas** pointent le même problème → c'est probablement réel. Sinon, vérifiez.

### 2. Manque de contexte
Avec un contexte vide, le LLM ignore le contexte et l'historique interne de votre entreprise. 
Utilisez sa "naïveté" comme un atout : c'est un test d'accessibilité pour un lecteur externe.

### 3. Diversifier les angles de vue
Pour un résultat optimal, **mélangez les retours** : combinez des critiques sur la forme (écriture, cohésion) et sur le fond (logique, pertinence stratégique).

## Next step : Passez à l'offensive

Tant que vous chercherez la validation dans vos prompts, vous obtiendrez de la complaisance.
Pour transformer vos documents, vous devez changer vos prompts.

### Votre boîte à outils pour commencer

Pour vous éviter de partir d'une page blanche, j'ai compilé et testé une série de "Personas Négatifs" prêts à l'emploi. Ce catalogue à faire évoluer contient des prompts pour :
*   Simuler un **CFO** obsédé par le ROI.
*   Incarner un **Concurrent** agressif.
*   Jouer le rôle d'un **Lecteur pressé** qui décroche au moindre flou.

👉 **[Accéder au Catalogue de Prompts Négatifs](https://github.com/agaches/ia_field/blob/main/doc_review/catalogue_negative_prompts.md)**

### Mode d'emploi express (15 min chrono)

Voici comment je procède :
1.  **Choisissez 2 Personas opposés** (ex: un CFO pour les chiffres + un Concurrent pour la stratégie).
2.  **Ouvrez une conversation vierge** pour chaque persona (pour éviter la contamination du contexte).
3.  **Copiez-collez le prompt + votre texte**.
4.  **Compilez uniquement les critiques qui reviennent 2 fois**. Le reste, c'est du bruit.

### La preuve par l'exemple : le crash-test de cet article

Pour ne pas reproduire l'erreur de mon talk réseau, j'ai appliqué cette méthode sur l'article que vous lisez. Je suis parti d'un premier brouillon bavard (consultable ici : [l'article original avant critique](old_article_relecture.md)) et je l'ai fait passer à la moulinette de 3 prompts itératifs.

**1. Le prompt "Valeur" (pour élaguer)**
> *"Identifie dans ce document :
1. Les paragraphes qui n'apportent pas de valeur (pure rhétorique)
2. Les sections qui manquent de substance
3. Le ratio contenu utile / remplissage
4. Les zones où l'on pourrait être plus concis
Fournis un % de contenu "utile" vs "remplissage" pour chaque section."*

**2. Le prompt "Cohérence" (pour structurer)**
> *"Analyse ce document en vérifiant :
La cohérence logique du début à la fin
Les éventuelles contradictions entre sections
Les ruptures dans le fil narratif
Les redondances inutiles"*

**3. Le prompt "Qualité perçue" (pour crédibiliser)**
> *"Tu es un lecteur qui sature des articles putaclic et des machins générés par IA.
Évalue :
La rigueur de l'argumentation (1-10)
La qualité des sources et références (1-10)
Le professionnalisme du ton (1-10)
La précision des données (1-10)
Qu'est-ce qui te fait penser "article de qualité" vs "article bof" "*

**4. Le prompt "Journaliste expérimenté" (pour finaliser)**
> *"Tu es un journaliste expérimenté.
La personne est un amateur qui apprécie un style simple, direct, concret, qui parle un peu de lui et avec un peu d'humour.
Reprends une analyse en profondeur de l'article en résultat et donnes-en un avis."*

Les scores avant/après :
*   **Ratio % utile :** Passée globalement de 60% à 96%
*   **Qualité perçue :** Note passée de 4/10 (argumentaire mou) à 9/10 (logique implacable).

**L'exemple le plus parlant ? L'introduction.**
La version brouillon s'étalait sur **12 lignes** de narration personnelle ("Je devais préparer un talk... J'ai la connaissance technique...").
La version finale tient en **6 lignes** qui posent le conflit immédiatement sans trop rentrer dans le détail.

Le lien vers la première version pour la comparaison :
👉 **[Accéder à l'ancien article](https://github.com/agaches/ia_field/blob/main/doc_review/old_article_relecture.md.md)**

L'**Avis final du journaliste:** C'est un article solide, utile et agréable à lire. Il ne cherche pas à impressionner par la complexité, mais à convaincre par l'efficacité.

## Le mot de la fin

Ne me croyez pas sur parole, essayez. 
Prenez votre dernier brouillon, et testez divers prompts (même au hasard).
Essayez le  prompt du "CFO Sceptique" sur vos propositions commerciales
Essayez le prompt du "Le Bullshit Detector" sur les dernières communications sur l'IA
Regardez votre texte se faire démolir... avec tous les axes identifiés pour pouvoir mieux le reconstruire.

Merci d'avoir lu jusqu'ici. Et j'en profite pour remercier tous mes relecteurs et relectrices.

## Sources

[1] [Perez et al., Anthropic 2022](https://www.anthropic.com/research/towards-understanding-sycophancy-in-language-models) - "Discovering Language Model Behaviors with Model-Written Evaluations". Étude sur 12 modèles différents montrant que le taux d'accord avec l'utilisateur augmente systématiquement avec la taille du modèle. 
[2] [Malmqvist 2024](https://arxiv.org/html/2411.15287) - "Sycophancy in Large Language Models: Causes and Mitigations". Revue technique analysant les causes, les impacts et les stratégies d'atténuation de la complaisance dans les LLM.
[3] [Étude DeepMind 2024](https://deepmind.google/discover/blog/evaluating-frontier-models-for-dangerous-capabilities/) citée dans [Computerworld, mars 2024](https://www.computerworld.com/article/4023989/llms-bow-to-pressure-changing-answers-when-challenged-deepmind-study.html). Les LLM modifient leurs réponses sous pression sociale, même quand ils avaient raison initialement. 
