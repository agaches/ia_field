# DAT as Code : automatiser la documentation technique avec l'IA

## Introduction

L'année dernière, j'ai écrit un [guide pour moderniser son DAT](https://dev.to/onepoint/moderniser-son-dossier-darchitecture-technique-guide-pratique-pour-2024-7d6). Un an après, avec l'arrivée des coding assistants et leurs connecteurs, je me suis demandé : **qu'est-ce qu'on peut vraiment faire avec l'IA pour maintenir un DAT ?**

J'ai testé sur un projet Terraform. 
Objectif : partir de zéro et arriver à une doc complète (architecture + exploitation) avec le moins d'effort possible.

Spoiler : en 2h de setup, c'est fait.

## La découverte : templates + prompts

Premier test avec un coding assistant : je lui donne un fichier markdown avec une structure (titres, sections) et j'y glisse des instructions dans des commentaires HTML `<!-- -->`.

Genre `<!-- décris ici les composants principaux en 5 lignes -->`.

Et ça marche. Le coding assistant suit la structure et remplit chaque section selon les consignes.

<!-- visuel de template markdown avec commentaires HTML contenant des prompts -->

Ça peut paraître con mais c'est le plus efficace que j'ai testé pour garder une cohérence de style documentaire globale.

## Le problème : 3 outils à synchroniser

Dans un projet classique, on jongle avec :
- **GitHub** : markdown en doc-as-code
- **Confluence** : pour la recherche et facilité de lecture
- **Jira** : pour tracer les issues et projets

Maintenir Confluence à jour à la main, c'est l'enfer. 
On aimerait pouvoir le faire dans GitHub à côté du code, mais c'est moins pratique pour la recherche et la facilité de lecture.
Et on veut éviter de se retrouver avec de la redite partout.

Ce qui paraît le plus adapté, c'est écrire la doc avec le code et mettre Confluence à jour en conséquence, avec des liens et des références vers la doc sur GitHub.

<!-- visuel de schéma : Github (markdown) <-> Confluence <-> Jira avec flèches de synchronisation -->

## La solution : MCP (Model Context Protocol)

Les MCP, c'est des connecteurs pour que ton coding assistant discute avec des services externes. J'en ai identifié trois essentiels pour ce projet :

**Context7** : vérifie que la doc respecte les standards et détecte ce qui manque.

**GitHub** : lit le code (Terraform dans mon cas) pour extraire l'info architecture.

**Atlassian** : s'interface avec Confluence et Jira.

<!-- visuel de diagramme d'architecture : VS Code + Coding Assistant au centre, connecté aux 3 MCP (Github, Atlassian, Context7) -->

## Setup

J'installe les 3 MCP dans mon IDE (VsCode dans mon cas, mais ça marche avec Cursor, IntelliJ, etc.).

Pour Atlassian, je configure dans `.vscode/settings.json` :
- URL de la page Confluence du projet
- Board Jira associé

<!-- visuel de capture d'écran du fichier settings.json avec configuration MCP -->

Je teste les connexions : ça passe.

Ensuite, je crée un repo GitHub avec mes templates de doc dans `tpl_docs/` :
- `TPL_README.md` : vue globale
- `TPL_README_IAM.md` : IAM
- `TPL_README_FW.md` : firewall
- `TPL_README_SIZING.md` : sizing
- `TPL_README_PROCEDURE.md` : procédures
- `TPL_README_DEX.md` : dossier d'exploitation

<!-- visuel de capture d'écran de l'arborescence tpl_docs avec les différents templates -->

<!-- lien vers repo public Github avec les exemples de fichiers de template -->

## Itération 1 : créer la documentation

Je crée une commande custom "create doc" dans `agents.md` (config du coding assistant) pour tout faire d'un coup.

**Premier problème** : l'assistant essaie d'accéder à mon dépôt GitHub privé sans authentification. Fail.
→ Fix : je précise dans `agents.md` d'utiliser le connecteur GitHub.

**Deuxième problème** : il commence à générer README, IAM, FW... et boom, dépassement de contexte (Claude Sonnet 3.5).

<!-- visuel de diagramme de flux montrant échec : analyse -> README -> IAM -> FW -> BOOM (context overflow) -->

Conclusion : Fail. Il faut découper.

## Itération 2 : itératif

Je modifie `agents.md` pour séparer le processus :

1. **Analyse** : inspection du Terraform
2. **Plan** : liste des docs à générer
3. **Exécution** : un doc à la fois, une conversation par doc

<!-- visuel de diagramme de flux réussi : 1.Analyse -> 2.Plan -> 3a.README -> 3b.IAM -> 3c.FW -> 3d.SIZING (étapes séquentielles) -->

Résultats :
- Analyse + plan : ✓
- Génération séquentielle : ✓ (mais c'est long)
- Doc complète : ✓

Finalement, l'itératif, c'est le bien.

Petit souci restant : **c'est verbeux**. Je dois retravailler les prompts dans les templates pour lui dire de faire court ("5 lignes max").

## Itération 3 : doc d'exploitation

Avec l'itération 2, je génère la doc d'architecture.
Je voudrais maintenant ajouter la documentation sur l'exploitation (DEX avec SLA, fiche DICT, monitoring, sauvegarde, et les procédures d'exploitation sur les composants).

Là où c'est pertinent : le coding assistant est doué pour écrire les procédures avec **les commandes précises**. 

En plus d'écrire dans la procédure 
"réattacher le disque à la VM", le coding assistant me donne la commande technique précise :
```bash
gcloud compute instances attach-disk instance-1 --disk=disk-1 --zone=europe-west1-b
```

Ça apporte une valeur ajoutée à la procédure technique et ça évite ensuite de perdre 10 minutes à rechercher/deviner la syntaxe de la commande.

<!-- visuel de exemple avant/après : procédure vague vs procédure avec commande précise gcloud/az/kubectl -->

J'ajoute `TPL_README_DEX.md` et `TPL_README_PROCEDURE.md`, je mets à jour `agents.md`.

Problème : toujours trop verbeux. Je continue d'affiner les prompts. 

## Itération 4 : publication dans Confluence

Maintenant je veux publier dans Confluence, avec une séparation claire **architecture** / **exploitation**.

Deux petits challenges :
- Un template "procédure" → plusieurs pages (une par composant : DB, load balancer, etc.)
- Faire comprendre au coding assistant les macros Confluence (notamment pour les diagrammes Mermaid)

Ma stratégie :

**GitHub** (source) :
- `README.md`, `IAM.md`, `FW.md`, `SIZING.md`, `DEX.md`, `PROCEDURE_*.md`

**Confluence** (publication) :
- Page "Architecture" : liens vers GitHub + résumés
- Page "Exploitation" : lien DEX + sous-pages procédures

<!-- visuel de schéma d'organisation : Github (source) avec fichiers markdown vs Confluence (publication) avec pages et liens -->

## Itération 5 : GitHub Actions (en cours)

### Premier test : tout régénérer
Une GitHub Action par type de doc.

- `analyse` → crée des issues Jira `Doc:xxx`
- `update-iam`, `update-fw`, `update-dex` → traitent chaque issue

Problème : ça régénère tout à chaque fois, même ce qui n'a pas bougé.

### Deuxième test : détection d'écarts
Je teste une approche différente :

1. **Code ↔ Doc** : le code a changé sans update de doc ?
2. **Confluence ↔ Doc** : désync ?
3. **Template ↔ Doc** : le standard a évolué ?

Pour chaque écart → issue Jira → traitement ciblé.

<!-- visuel de diagramme de détection d'écarts : 3 comparaisons (code↔doc, confluence↔doc, template↔doc) qui génèrent des issues Jira -->

C'est en test, je valide si c'est plus pertinent.

## Bilan

### Ce que ça donne

**Temps** :
- Config (MCP + settings) : 1h
- Exécution complète : < 1h
- **Total : 2h** du repo vide à la doc complète

**Résultat** :
- Schémas d'archi
- Doc IAM et firewall
- Doc exploitation avec procédures
- Page Confluence propre

<!-- visuel de comparaison avant/après : gauche=repo vide, droite=documentation complète + page Confluence -->

### Les limites

Il faut quand même **relire**. 
Le coding assistant peut :
- Se tromper techniquement
- Approximer des choses, souvent les nombres
- Halluciner des informations

### Conclusion

L'IA ne supprime pas le boulot de doc. 
Elle change la nature du boulot : on peut obtenir 80% d'une documentation avec peu d'efforts.
Je trouve personnellement que ça devient plus facile : c'est plus simple pour moi de repartir d'une base documentaire et de corriger/éliminer l'inutile que de commencer d'une page blanche.

En plus, ça apporte une documentation exacte à 80% dans un format standard pour toutes les applications.

Et franchement, le gain de temps est réel. 
En doc assistant, ça fonctionne très bien.

L'automatisation complète demande plus de travail car elle nécessite de réfléchir aux différents écarts possibles.
C'est encore en test et mériterait de pouvoir y consacrer plus de temps.
