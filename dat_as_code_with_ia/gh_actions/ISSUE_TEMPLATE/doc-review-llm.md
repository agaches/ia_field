---
name: Documentation Auto-Review
about: Issue créée automatiquement par les GitHub Actions de review de documentation
title: '[DOC-AUTO] '
labels: documentation, auto-review, llm-fix
assignees: ''
---

# 🤖 Documentation Auto-Review

> **Note**: Cette issue a été créée automatiquement par une GitHub Action.
> Elle est destinée à être traitée par un agent LLM ou un développeur.

## 📋 Contexte

- **Date**: <!-- Rempli automatiquement -->
- **PR déclencheuse**: <!-- Rempli automatiquement -->
- **Workflow**: <!-- Rempli automatiquement -->
- **Repository**: `<org>/<project>`

---

## 🔍 Problèmes détectés

<!-- Détails du rapport seront insérés ici par l'action -->

---

## 🎯 Actions à réaliser

### Pour un agent LLM

Les informations suivantes sont structurées pour faciliter le traitement automatique:

```json
{
  "task": "<!-- Type de tâche -->",
  "repository": "<org>/<project>",
  "files_to_modify": [],
  "templates_source": "<org>/<templates-repo>/toolbox/tpl_docs",
  "confluence_sync_required": false,
  "priority": "medium"
}
```

### Instructions détaillées

1. **Analyser** le rapport ci-dessus
2. **Identifier** les fichiers à modifier
3. **Utiliser** les templates de référence si nécessaire
4. **Appliquer** les corrections
5. **Créer** une PR avec les changements
6. **Lier** cette issue à la PR

---

## 🔗 Ressources

- [Documentation Confluence](https://<your-org>.atlassian.net/wiki/spaces/CLOUD/pages/xxxxx)
- [Templates de documentation](https://github.com/<org>/<templates-repo>/tree/main/toolbox/tpl_docs)
- [Guide de contribution](./../CONTRIBUTING.md)

---

## ✅ Checklist de résolution

- [ ] Problèmes identifiés et compris
- [ ] Corrections appliquées
- [ ] Tests de validation effectués
- [ ] Documentation mise à jour
- [ ] PR créée et liée
- [ ] Confluence synchronisé (si applicable)

---

**🤖 Cette issue peut être traitée automatiquement par un agent LLM configuré avec les instructions du fichier `agents.md`**
