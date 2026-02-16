# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

**AI Adoption Framework** — "Person → Project → Product" model, cloud-agnostic, pragmatic.

```
Person (Employee)    → Levels 1-2 → Personal AI usage    → Low risk     → $20-50/month
Project (Delivery)   → Levels 2-3 → Team AI integration  → Medium risk  → Few k$/month
Product (Automation) → Levels 3-4 → Production AI        → High risk    → Tens of k$/month
```

**Status**: Framework complete. 28/28 templates created. Coherence + density reviews applied.

## Structure

Each framework follows **Prepare → Build → Run**:

```
employee/     README + 01-prepare + 02-build + 03-run  (27KB)
delivery/     README + 01-prepare + 02-build + 03-run  (26KB)
automation/   README + 01-prepare + 02-build + 03-run  (50KB)
templates/    employee(3) + delivery(5) + automation(17) + shared(3) = 28
archive/      Old 6-phase files preserved (employee, delivery, automation)
```

**Core docs**: README.md (entry point), STRATEGY.md (model), SKILLS.md (assessment), TRAINING.md (paths), GLOSSARY.md (cloud equivalences)

## Conventions

### Tone & Style
- Concise, action-oriented: "Do X" not "You should consider doing X"
- Checklists, matrices, decision trees — no prose without actionable outcome
- Templates referenced with: `📋 **Tool**: [Name](../templates/.../template.md)`

### Template Pattern
1. Header (purpose, phase, update frequency)
2. Concept (2-3 paragraphs max)
3. Filled example (realistic data)
4. Blank template (copy-paste ready)
5. Related links

### Content Rules
- No generic advice ("test your code", "document your work")
- No repetition across documents (Responsible AI in README.md only, prerequisites stated once)
- Progressive complexity: Employee (simple) → Delivery (moderate) → Automation (comprehensive)
- Cloud-agnostic: reference GLOSSARY.md for AWS/GCP/Azure equivalences

## Files to Never Modify Without Consultation

- Core model in STRATEGY.md (Person→Project→Product)
- Maturity levels in SKILLS.md (1-4 definitions)
- Responsible AI principles in README.md
- Progressive prerequisites (cannot skip levels)

## Review Prompts

Three reusable review passes. Run individually or in sequence.

### 1. Coherence Review

```
Lis TOUS les fichiers .md du framework (core docs + employee/ + delivery/ + automation/ + templates/README.md).
Identifie :
- Contradictions : chiffres, niveaux, timelines, budgets qui se contredisent entre fichiers
- Ruptures narratives : prérequis manquants, liens cassés, références à du contenu inexistant
- Redondances : même contenu dupliqué dans plusieurs fichiers (hors références croisées volontaires)

Format de sortie : tableau avec colonnes [Sévérité (CRITICAL/MEDIUM/LOW), Type, Fichier(s), Description, Correction proposée].
Ne corrige rien, liste seulement.
```

### 2. Value Density Review

```
Lis TOUS les fichiers .md du framework.
Pour chaque fichier, identifie les sections à faible valeur :
- Conseils génériques ("test your code", "document your work", "communicate with stakeholders")
- Listes de ressources externes (liens Coursera, livres, communautés) qui vieillissent vite
- Sections "pourquoi c'est important" qui n'apportent pas d'action concrète
- Répétitions de contenu déjà présent dans un autre fichier
- Prose là où une checklist ou un tableau suffirait

Format de sortie : tableau avec colonnes [Fichier, Section, Lignes, % estimé de filler, Action proposée (CUT/CONDENSE/MERGE)].
Ne corrige rien, liste seulement.
```

### 3. Post-Edit Review

```
Lis TOUS les fichiers .md du framework (core docs + employee/ + delivery/ + automation/ + templates/).
Vérifie :
- Liens internes : tous les liens [texte](chemin) pointent vers des fichiers existants
- Compteurs : les totaux (nombre de templates, phases, niveaux) sont cohérents partout
- Markdown : séparateurs --- précédés d'une ligne vide, pas de headings collés au texte, code blocks correctement fermés
- Footers : chaque fichier a une navigation cohérente vers les fichiers liés
- Références croisées : les templates mentionnés dans les phases existent dans templates/

Format de sortie : tableau avec colonnes [Sévérité (CRITICAL/MEDIUM/LOW), Fichier, Ligne, Description, Correction proposée].
Ne corrige rien, liste seulement.
```
