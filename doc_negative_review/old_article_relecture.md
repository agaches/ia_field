# Arrêtez de demander à l'IA si c'est bien. Demandez-lui ce qui cloche.

<!-- 
EN RÉSUMÉ : CE QUI REND L'ARTICLE FAIBLE

❌ Trop long pour un lecteur pressé (cible manquée)
❌ Pas de preuve forte (10 docs, chiffres invérifiables)
❌ Exemple terrain incomplet (phrase cassée, pas de concret)
❌ Structure répétitive (4 tableaux de personas au lieu d'1)
❌ Promesse temps fausse (15 min annoncées, 1h en réalité)
❌ Angle mort majeur : pourquoi l'IA plutôt qu'un humain ?

La vraie question que vous évitez : Si l'IA génère 40% de faux positifs et n'a pas le contexte métier, pourquoi ne pas juste payer un expert 1h de son temps ?
-->

En 2024, 65% des développeurs utilisent l'IA quotidiennement dans leur travail ([Stack Overflow Survey 2024](https://survey.stackoverflow.co/2024/)). Mais la plupart obtiennent des validations complaisantes plutôt que des critiques utiles. 

Voici comment j'ai découvert une méthode simple pour obtenir de vrais retours — et pourquoi elle fonctionne.

**Disclaimer** : Cet article documente une méthode empirique testée sur ma propre pratique. Les données quantitatives sont limitées, mais les principes s'appuient sur des recherches publiées sur les biais des LLM. Ce n'est pas une étude scientifique, c'est un retour d'expérience reproductible.

---

## Le problème : le biais de complaisance des IA

### Une expérience personnelle révélatrice

Je devais préparer un talk technique sur le diagnostic réseau. J'ai la connaissance technique, je sais former... mais un talk de 50 minutes qui doit captiver, avec du storytelling, c'est une autre histoire.

Alors comme beaucoup, je me suis appuyé sur une IA (Claude, en l'occurrence) pour m'aider.

**Soirée 1** : J'écris ma première version, je demande : *"Qu'en penses-tu ?"*
> "Excellent ! Votre contenu est solide, bien structuré..."

Je suis rassuré. Je continue.

**Soirée 2** : Je retravaille le document. Nouvelle analyse.
> "C'est très bien ! MAIS pour être encore meilleur, voici quelques suggestions pour une v2..."

Je casse tout mon plan pour suivre ses recommandations.

**Soirée 3** : Je demande une analyse de cette v2 retravaillée.
> "Excellent travail ! MAIS pour optimiser davantage, voici des pistes pour une v3..."

Ses suggestions de v3 ? **Quasiment ma structure de v1**.

J'ai tourné en boucle. Trois soirées pour finalement revenir au point de départ.

---

## Pourquoi l'IA est souvent trop positive ?

Ce qui m'est arrivé n'est pas un cas isolé. C'est un défaut de conception documenté scientifiquement.

### La "sycophancy" (complaisance) : un défaut documenté

Les grands modèles de langage (ChatGPT, Claude, etc.) exhibent systématiquement un comportement appelé "sycophancy" (complaisance) : ils ont tendance à valider les opinions de l'utilisateur plutôt que de les contredire, même lorsque ces opinions sont incorrectes.

**Source** : [Perez et al., Anthropic 2022](https://www.anthropic.com/research/towards-understanding-sycophancy-in-language-models) - "Discovering Language Model Behaviors with Model-Written Evaluations"  
→ Étude sur 12 modèles différents montrant que le taux d'accord avec l'utilisateur augmente systématiquement avec la taille du modèle

### Le coupable : le RLHF (Reinforcement Learning from Human Feedback)

Le RLHF, la méthode utilisée pour "aligner" les modèles avec les préférences humaines, récompense les modèles pour générer des réponses que les évaluateurs humains préfèrent. 

**Le problème ?** Les humains ont tendance à préférer les réponses qui valident leurs propres opinions.

**Source** : [Sharma et al. 2023](https://arxiv.org/html/2411.15287) - "Towards Understanding Sycophancy in Language Models" (arXiv preprint)  
→ Démontre que les modèles plus grands et plus entraînés deviennent paradoxalement *plus* complaisants, pas moins

**Résultat** : L'IA est optimisée pour maximiser votre satisfaction immédiate (via le feedback positif), pas pour vous confronter à des vérités inconfortables.

### Les conséquences concrètes

Des études récentes montrent que les IA changent leurs réponses lorsqu'elles sont contestées, même quand leur réponse initiale était correcte.

**Source** : [Étude DeepMind 2024](https://deepmind.google/discover/blog/evaluating-frontier-models-for-dangerous-capabilities/) citée dans [Computerworld, mars 2024](https://www.computerworld.com/article/4023989/llms-bow-to-pressure-changing-answers-when-challenged-deepmind-study.html)  
→ Les LLM modifient leurs réponses sous pression sociale, même quand ils avaient raison initialement

**En clair** : Quand vous cherchez des faiblesses dans un document, vous avez besoin d'un **contradicteur**, pas d'un **cheerleader**.

---

## La solution : les personas négatifs

### L'origine de la méthode

En testant différents prompts, j'ai remarqué qu'un simple changement de formulation transformait radicalement les retours :

| Prompt                                                 | Type de retour obtenu                            |
| ------------------------------------------------------ | ------------------------------------------------ |
| "Analyse ce document"                                  | Feedback positif générique + suggestions molles  |
| "Critique ce document comme un CFO sceptique"          | Objections concrètes sur les coûts et le ROI     |
| "Tu es un concurrent. Comment tu attaquerais ce doc ?" | Identification de vraies faiblesses stratégiques |

**Le déclic** : Le mot "critique" + un rôle adversarial suffisait à sortir l'IA de son mode validation automatique.

Cette technique rejoint une recommandation observée empiriquement : au lieu de présenter son propre travail, on peut utiliser la "technique du fall guy" - présenter le document comme celui d'un collègue à évaluer. Cela permet d'obtenir des retours plus objectifs en contournant le biais de complaisance.

**Source** : [Pareto Software Blog](https://www.paretosoftware.fi/blog/mitigating-sycophantic-bias-in-llms?lang=en) - Retour d'expérience d'une équipe finlandaise (pas une étude académique, mais des observations cohérentes avec la recherche)

---

## Pourquoi ça marche ?

### 1. Contrainte adversariale

En imposant un rôle critique, vous créez une tension dans le prompt : l'IA doit choisir entre respecter votre consigne (être critique) et suivre son biais de complaisance (être positive).

Le prompt adversarial **augmente la probabilité** de réponses critiques sans éliminer complètement le biais. C'est une question de pondération probabilistique, pas de "choix conscient" de l'IA.

**Nuance importante** : L'IA peut toujours être positive ET jouer le rôle ("En tant que CFO, je trouve ça excellent..."). Mais en pratique, le rôle adversarial domine souvent.

### 2. Simuler l'adversité avant qu'elle arrive

Les personas négatifs sont un **stress-test documentaire**. Ils simulent les objections réelles dans un environnement contrôlé.

Cette approche s'inspire de méthodes éprouvées :
- **Red teaming** en cybersécurité : des équipes attaquent leurs propres systèmes pour trouver les vulnérabilités
- **Stress tests bancaires** : les banques testent leurs portefeuilles avec des scénarios catastrophes (régulation Bâle III)
- **Murder boards** militaires/corporate : des panels dont le job est de détruire votre argumentaire avant la vraie présentation

**Différence clé** : Un CFO réel a 20 ans d'expérience métier et des priorités cachées. L'IA simule un rôle générique. C'est plus rapide mais moins expert.

### 3. Proxy de lisibilité minimale

Si une IA lit votre doc et ne comprend pas votre ROI, un lecteur pressé risque de ne pas le comprendre non plus.

**Pourquoi ?** L'IA lit séquentiellement sans combler les implicites avec du contexte métier. Si votre message ne passe pas avec elle, c'est probablement qu'il manque de clarté.

**Nuance critique** : L'IA n'est PAS équivalente à un lecteur humain. Elle n'a ni expérience sectorielle, ni contexte émotionnel, ni capacité à "lire entre les lignes". Elle peut aussi sur-interpréter (halluciner des liens inexistants) ou manquer des erreurs factuelles subtiles.

Mais elle devient un **indicateur de clarté minimale** : ce qu'elle ne comprend pas, un lecteur peu familier avec votre domaine risque de le manquer aussi.

---

## Les limites (à connaître AVANT de commencer)

### Faux positifs garantis

L'IA **va** sur-critiquer. Certains retours seront hors-sujet, exagérés, ou basés sur des hypothèses erronées.

**Dans mon expérience** : environ 30-40% des critiques étaient non pertinentes ou trop sévères.

**C'est normal. Et ce n'est pas grave.**

Vous ne cherchez pas la perfection. Vous cherchez les **angles morts** que vous n'aviez pas vus.

**Règle empirique** : Si 2+ personas différents pointent le même problème → c'est probablement réel et mérite investigation. Si un seul persona le mentionne → vérifiez avec un humain expert.

### L'IA n'a pas le contexte métier complet

Elle ne connaît pas :
- Votre historique avec le client
- Les contraintes politiques internes
- Les non-dits de votre secteur
- La véracité des chiffres (elle peut halluciner)
- Les incohérences avec d'autres docs du projet
- Les enjeux légaux/réglementaires spécifiques
- Le timing (ce doc sort trop tôt/tard ?)

**Utilisez son regard extérieur comme un complément**, pas comme un remplacement d'une relecture humaine qualifiée.

Parfois, une question "naïve" de l'IA révèle un point qui mérite clarification pour un public non-expert.

### Pas de validation scientifique rigoureuse

Je n'ai pas comparé cette méthode à des peer reviews humaines contrôlées. Je n'ai pas de protocole double-aveugle. Je n'ai pas de métriques avant/après sur 100+ documents.

C'est une technique pragmatique qui m'a aidé à améliorer mes documents. Point.

---

## Mode d'emploi (15-30 minutes par document)

### Prérequis

- Un LLM avec fenêtre de contexte longue : Claude 3.5 Sonnet, GPT-4, Gemini Pro
- Votre document en format texte/markdown (si PDF, extraire le texte d'abord avec un outil OCR)
- 15-30 minutes de temps

### Étape 1 : Choisir 2-3 personas selon votre contexte

| Type de document             | Personas recommandés                                         |
| ---------------------------- | ------------------------------------------------------------ |
| **Proposition commerciale**  | CFO sceptique + Utilisateur final + Concurrent               |
| **Architecture technique**   | Ops legacy + Auditeur sécurité + Dev junior                  |
| **Article de blog**          | Lecteur pressé + Expert contradicteur + Stagiaire découverte |
| **Présentation stratégique** | Investisseur + Concurrent + Journaliste critique             |

**Critère de sélection** : Diversité des angles d'attaque. Évitez 3 personas similaires (ex : 3 rôles financiers).

### Étape 2 : Lancer les prompts

Pour chaque persona, dans une **conversation séparée** :

```
Tu es [RÔLE PRÉCIS avec contexte]. Voici un document [TYPE]. 
Ta mission : identifier TOUTES les faiblesses, incohérences, points flous.
Ne sois pas poli. Sois direct et critique.

[COLLER VOTRE DOCUMENT]

Qu'est-ce qui ne va pas ?
```

**Paramètres recommandés** :
- Température : 0.7-1.0 (pour varier les critiques)
- Max tokens : 2000-4000 (pour des retours détaillés)
- Une conversation par persona (pour éviter la contamination de contexte)

### Étape 3 : Compiler les retours

Utilisez ce template simple :

| Critique                  | CFO | Ops | Junior | Fréquence | Priorité  | Action                         |
| ------------------------- | --- | --- | ------ | --------- | --------- | ------------------------------ |
| ROI flou et non chiffré   | ✓   | ✓   | ✓      | 3/3       | 🔴 Haute   | Ajouter calcul détaillé page 5 |
| Jargon technique excessif |     |     | ✓      | 1/3       | 🟡 Moyenne | Glossaire en annexe            |
| Pas de plan de secours    |     | ✓   |        | 1/3       | 🟢 Basse   | Mention rapide suffisante      |

**Temps estimé** : 5 min par persona + 10 min compilation = ~25 min total

---

## Catalogue de prompts (exemples concrets)

### Pour documents financiers

**Le CFO sceptique**
```
Tu es un Directeur Financier avec 20 ans d'expérience dans des scale-ups tech. 
Tu as vu passer 1000 propositions commerciales bullshit. 
Ton job : détecter les coûts cachés, les ROI gonflés, les hypothèses irréalistes. 
Sois impitoyable sur les chiffres. Si un calcul ne tient pas, dis-le brutalement.
```

**L'auditeur comptable**
```
Tu es auditeur externe Big Four. Tu vérifies la cohérence des chiffres, 
la traçabilité, la conformité réglementaire. Tout doit être justifié et sourçable.
Pointe les incohérences, les chiffres ronds suspects, les projections trop optimistes.
```

### Pour documents techniques

**L'architecte legacy**
```
Tu maintiens des systèmes legacy vieux de 15 ans en production. 
Tu détestes les "solutions miracles" et les architectures sur-engineered.
Ton job : pointer les incompatibilités, les dettes techniques cachées, 
les points de défaillance, les architectures qui ne passeront jamais en prod.
```

**L'ops de nuit qui se méfie**
```
Tu es SRE/DevOps. Tu te réveilles à 3h du matin quand ça casse. 
Analyse ce document : où sont les SPOF ? Qu'est-ce qui va merder en prod ? 
Quels sont les points de contention ? Où est le monitoring ? Les rollback ?
```

### Pour documents marketing/communication

**Le prospect pressé et méfiant**
```
Tu es décideur senior. Tu reçois 50 propositions par semaine. 
Tu lis en diagonale. Tu cherches les bullshit buzzwords, les promesses vides,
les ROI non prouvés. Si tu ne comprends pas la valeur en 30 secondes, tu passes au suivant.
Qu'est-ce qui te ferait jeter ce document ?
```

**Le concurrent malveillant**
```
Tu es le concurrent direct. Tu veux détruire cette proposition.
Trouve les faiblesses stratégiques, les promesses impossibles à tenir,
les points d'attaque pour un contre-argumentaire. Sois sans pitié.
```

**Le stagiaire en découverte**
```
Tu es en stage découverte, première semaine dans ce secteur. 
Explique ce que tu as compris du document en termes simples.
Où es-tu perdu ? Quel jargon ne comprends-tu pas ? 
Quelles parties te semblent floues ou intimidantes ?
```

### Pour présentations stratégiques

**L'investisseur en due diligence**
```
Tu es VC en phase de due diligence. Tu cherches les red flags :
marché surévalué, concurrence sous-estimée, hypothèses de croissance irréalistes,
risques non adressés, team incomplète. Qu'est-ce qui te ferait dire non ?
```

**Le journaliste d'investigation**
```
Tu es journaliste tech. Tu cherches l'angle critique pour ton article.
Quelles sont les zones d'ombre ? Les questions embarrassantes ?
Les affirmations non sourcées ? Les contradictions ?
```

**[Catalogue complet (20+ personas) sur GitHub](https://github.com/agaches/ia_field/tree/main/doc_review)**

---

## Retour d'expérience terrain

### Ce qui a marché

**Documents testés** : 10 documents testés jusqu'à présent
- 4 architectures techniques
- 3 articles de blog techniques
- 2 communications stratégiques
- 1 propositions commerciales (20-40 slides)

**Patterns observés** :
1. Les personas financiers (CFO, auditeur) se concentrent sur l'aspect chiffres/ROI
2. Les personas "concurrent" montrent de vraies faiblesses
3. Les personas "junior" révèlent le jargon expert habituel à expliquer

**Exemple concret** : 

Sur une proposition commerciale, le "CFO sceptique" a pointé le Go sur le 1er lot et . 
Sur cet article, le suivi noté permet de voir la progression.

### Ce qui a moins bien marché

**Faux positifs** : J'ai quand même eu des critiques non pertinentes dans tout le lot.
- L'IA invente parfois des "problèmes" basés sur des hypothèses erronées
- Elle peut sur-interpréter ou halluciner des incohérences inexistantes
- Certains personas "caricaturaux" génèrent du bruit

**Solution** : La règle des "2+ personas" filtre relativement efficacement. Si une critique apparaît sur un seul persona, la vérifier avec un humain avant d'agir.

**Limitations rencontrées** :
- L'IA ne détecte pas les erreurs factuelles subtiles (mauvaise date, statistique obsolète)
- Elle manque le contexte politique/humain des organisations
- Elle peut valider des choses fausses si c'est dit avec confiance dans le doc

---

## Conclusion : un outil imparfait mais accessible

Un CFO sceptique n'a pas le temps de lire votre doc.  
Un concurrent ne va pas vous aider.  
Votre utilisateur final ne sera jamais 100% honnête.

**Mais l'IA peut simuler ces rôles en 15 minutes.**

Ce n'est pas magique. Ce n'est pas validé scientifiquement. Ça génère des faux positifs.

**Mais** : pour détecter les angles morts après la 15ème itération solitaire, c'est un filet de sécurité rapide et gratuit.

### Prochaines étapes concrètes

1. Testez maintenant : Prenez un document en cours, choisissez 2 personas du catalogue ci-dessus
2. Mesurez : Combien de critiques utiles vs faux positifs ?
3. Partagez : Vos retours d'expérience via [Issues GitHub](https://github.com/agaches/ia_field/issues)

Alors la prochaine fois que vous finalisez un document important :

❌ Ne demandez pas : *"C'est bien ?"*  
✅ Demandez : *"Qu'est-ce qui cloche ?"*

---

## Pour aller plus loin

### Bibliographie scientifique

**Sur le biais de complaisance (sycophancy)**

- **[Perez et al. 2022]** "Discovering Language Model Behaviors with Model-Written Evaluations" (Anthropic)  
  → Première démonstration systématique du biais de sycophancy  
  https://www.anthropic.com/research/discovering-language-model-behaviors

- **[Sharma et al. 2023]** "Towards Understanding Sycophancy in Language Models"  
  → Démontre que les modèles plus grands deviennent *plus* complaisants (scaling inversé)  
  arXiv:2411.15287

- **[Anthropic 2024]** "Towards Understanding Sycophancy in Language Models"  
  → État de l'art sur les causes profondes et tentatives de mitigation  
  https://www.anthropic.com/research/towards-understanding-sycophancy-in-language-models

**Sur le RLHF et ses effets secondaires**

- **[Ouyang et al. 2022]** "Training language models to follow instructions with human feedback" (OpenAI)  
  → Paper fondateur du RLHF, documente les premiers effets de bord  
  arXiv:2203.02155

- **[Bai et al. 2022]** "Constitutional AI: Harmlessness from AI Feedback" (Anthropic)  
  → Alternative au RLHF pour réduire certains biais  
  arXiv:2212.08073

**Sur la modification des réponses sous pression**

- **[DeepMind 2024]** "Evaluating Frontier Models for Dangerous Capabilities"  
  → Montre que les LLM changent d'avis sous pression sociale  
  https://deepmind.google/discover/blog/evaluating-frontier-models-for-dangerous-capabilities/

### Ressources additionnelles

**Prompting efficace**
- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)
- [OpenAI Prompt Engineering Best Practices](https://platform.openai.com/docs/guides/prompt-engineering)

**Red teaming et adversarial thinking**
- [NIST Guide on Red Teaming](https://www.nist.gov/cybersecurity)
- "Thinking in Bets" par Annie Duke (décisions sous incertitude)

---

## Contacts & contributions

**Questions / Retours d'expérience**  
GitHub Issues : https://github.com/agaches/ia_field/issues

**Catalogue de prompts (contributions bienvenues)**  
https://github.com/agaches/ia_field/tree/main/doc_review

---

**Dernière mise à jour** : Octobre 2024  
**Licence** : CC BY 4.0 (libre de partager et adapter avec attribution)

**Remerciements** : Merci aux équipes d'Anthropic et DeepMind pour la recherche sur les biais des LLM qui a inspiré cette méthode pragmatique.