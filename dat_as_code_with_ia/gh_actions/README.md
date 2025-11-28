# 🤖 GitHub Actions - Documentation Auto-Review

Système automatisé de review de documentation avec création d'issues pour correction par agent LLM.

## 📋 Vue d'ensemble

4 workflows modulaires qui s'exécutent à chaque PR mergée vers `main` :

| Workflow                      | Fonction                              | Label                 |
| ----------------------------- | ------------------------------------- | --------------------- |
| `doc-template-compliance.yml` | Vérification conformité aux templates | `template-compliance` |
| `doc-code-sync.yml`           | Sync code Terraform ↔ documentation   | `code-sync`           |
| `doc-confluence-sync.yml`     | Sync documentation ↔ Confluence       | `confluence-sync`     |
| `doc-quality-check.yml`       | Contrôle qualité (liens, TODOs, etc.) | `quality`             |

## 🚀 Installation

### 1. Configurer les secrets GitHub

Aller dans **Settings** → **Secrets and variables** → **Actions** → **New repository secret** :

```
CONFLUENCE_URL = https://<your-org>.atlassian.net
CONFLUENCE_TOKEN = <token_api_atlassian>
APP_PAGE_ID = <id_page_confluence_app>
```

### 2. Activer les workflows

Les fichiers sont déjà dans `.github/workflows/`. Les workflows sont **automatiquement actifs**.

### 3. Permissions GitHub Actions

Vérifier dans **Settings** → **Actions** → **General** → **Workflow permissions** :

- ✅ **Read and write permissions**
- ✅ **Allow GitHub Actions to create and approve pull requests**

### 4. Rendre les scripts exécutables

```bash
chmod +x .github/scripts/*.sh
```

> **Note Windows** : Commit les fichiers `.sh` avec les bons line endings (LF, pas CRLF)

## 🎯 Utilisation

### Déclenchement automatique

Les workflows se lancent automatiquement après chaque **PR mergée vers `main`** qui modifie :
- `docs/**`
- `**/*.md`
- `**/*.tf`

### Résultat

Si des problèmes sont détectés, une **issue GitHub** est créée automatiquement avec :
- 📊 Rapport détaillé des problèmes
- 🤖 Instructions JSON pour agent LLM
- 🏷️ Labels : `documentation`, `auto-review`, `llm-fix`

### Traitement des issues

Les issues créées peuvent être :
1. **Traitées manuellement** par un développeur
2. **Traitées automatiquement** par un agent LLM (à configurer séparément)

## 📦 Structure

```
.github/
├── workflows/               # 4 GitHub Actions
│   ├── doc-template-compliance.yml
│   ├── doc-code-sync.yml
│   ├── doc-confluence-sync.yml
│   └── doc-quality-check.yml
├── scripts/                 # Scripts bash de vérification
│   ├── check-template-compliance.sh
│   ├── check-code-doc-sync.sh
│   ├── check-confluence-sync.sh
│   └── check-doc-quality.sh
├── ISSUE_TEMPLATE/          # Template pour issues automatiques
│   └── doc-review-llm.md
└── README.md                # Ce fichier
```

## 🔍 Vérifications effectuées

### 1. Conformité templates (`doc-template-compliance.yml`)
- Présence des fichiers : `README.md`, `docs/README_*.md`
- Sections obligatoires par template
- Structure conforme aux templates de référence

### 2. Sync code ↔ doc (`doc-code-sync.yml`)
- Ressources Terraform documentées
- Modules avec README.md
- Variables avec descriptions
- Outputs référencés dans la doc

### 3. Sync doc ↔ Confluence (`doc-confluence-sync.yml`)
- Page principale Tufin à jour
- Sous-pages Architecture et Exploitation synchronisées
- Liens GitHub vers documentation

### 4. Qualité (`doc-quality-check.yml`)
- TODOs/FIXME dans le code
- Liens cassés
- Fichiers référencés manquants
- Hiérarchie des titres
- Blocs de code correctement fermés

## 🧪 Test manuel

Pour tester un workflow localement (nécessite [act](https://github.com/nektos/act)) :

```bash
# Installer act (Windows)
choco install act-cli

# Tester un workflow
act pull_request -W .github/workflows/doc-quality-check.yml
```

Ou push sur une branche et merger une PR pour déclencher les actions.

## 🛠️ Personnalisation

### Modifier les critères de vérification

Éditer les scripts dans `.github/scripts/*.sh`

### Ajouter un nouveau workflow

1. Créer `.github/workflows/mon-workflow.yml`
2. Créer `.github/scripts/mon-check.sh`
3. Utiliser le pattern des workflows existants

### Changer les labels des issues

Modifier la section `labels:` dans chaque workflow :

```yaml
labels: ['documentation', 'auto-review', 'llm-fix', 'mon-label']
```

## 📚 Ressources

- [Documentation GitHub Actions](https://docs.github.com/en/actions)
- [Templates de documentation](https://github.com/<org>/<project>/tree/main/toolbox/tpl_docs)
- [Configuration agent LLM](../agents.md)

## 🐛 Dépannage

### Les workflows ne se déclenchent pas

- Vérifier les permissions GitHub Actions
- Vérifier le nom de la branche cible (`main`)
- Consulter l'onglet **Actions** pour voir les logs

### Scripts bash ne fonctionnent pas

- Vérifier les line endings (LF)
- Vérifier les permissions d'exécution
- Tester localement avec Git Bash (Windows)

### Issues non créées

- Vérifier les secrets Confluence
- Vérifier les permissions write
- Consulter les logs du workflow

## 📞 Support

Pour toute question, voir la configuration dans `agents.md` ou créer une issue GitHub.
