# Plan de migration — Réorganisation des repos

## Situation actuelle

Deux repos GitHub, frontière floue IA/tech :

| Repo | Contenu |
|------|---------|
| `ia_field` | Framework adoption IA (28 templates), article DAT-as-code, article relecture critique, lab Otoroshi, skills Diataxis |
| `tech_field` | Pipeline éditorial (ideas→knowledge→outputs), 6 articles/posts, lab Scaleway+CleverCloud, templates |

## Organisation cible

```
agaches/
├── blog                          # Pipeline éditorial (ex tech_field)
├── ia-adoption-fw                # Framework dédié (ex ia_field/IA_Adoption_FW)
├── lab-cloud-souverain           # Labs Scaleway + CleverCloud groupés
├── lab-local-llm                 # Lab Ollama + Otoroshi
└── (futurs repos lab-* ou fw-*)
```

### 1. `blog` (renommage de tech_field)

Vocation : pipeline éditorial unique pour toutes les productions textuelles.

```
blog/
├── CLAUDE.md
├── .editorconfig
├── templates/
│   ├── knowledge.md
│   ├── output-narratif.md
│   └── output-diataxis.md
├── ideas/                         # Idées brutes (existantes + migrées)
│   ├── comparatif-agents-cli-git.md
│   ├── guide-decideur-ia-positionnement.md
│   ├── ia-exposition-directe-donnee.md
│   ├── reviewer-non-sollicite-avenir-tech.md
│   └── ...
├── knowledge/                     # Recherche structurée
│   └── ...
├── outputs/                       # Productions finales
│   ├── ai-fatigue-vampire-vendredi.md
│   ├── claude-code-git-intelligent.md
│   ├── formats-ouverts-souverainete-workspaces.md
│   ├── openai-decline-copilot-flop.md
│   ├── ordi-comprend-enfin-intention.md
│   ├── article-dat-as-code.md          # <-- migré depuis ia_field
│   ├── article-relecture-critique.md   # <-- migré depuis ia_field
│   └── ...
└── skills/                        # Skills Claude Code
    └── diataxis/
```

**Ce qui migre vers blog depuis ia_field :**
- `dat_as_code_with_ia/article_dat_as_code.md` → `outputs/`
- `dat_as_code_with_ia/catalogue_prompt.md` → `outputs/` ou `knowledge/` selon maturité
- `doc_negative_review/article_relecture_doc.md` → `outputs/`
- `doc_negative_review/catalogue_prompt.md` → `knowledge/`
- `diataxis_skills/` → `skills/diataxis/`

**Ce qui reste dans blog depuis tech_field :**
- `ideas/`, `knowledge/`, `templates/`, `.editorconfig`, `CLAUDE.md`
- Les 6 fichiers `outputs/` existants

**Ce qui sort de blog :**
- `labs/landing-zone-scaleway-clevercloud/` → repo `lab-cloud-souverain`
- `ideas/landing-zone-scaleway-clevercloud.md` reste dans `ideas/` (c'est une idée éditoriale, pas du code)

### 2. `ia-adoption-fw` (repo dédié)

Extraction de `ia_field/IA_Adoption_FW` tel quel dans son propre repo.

```
ia-adoption-fw/
├── CLAUDE.md                      # Existant (prompts de review)
├── README.md
├── STRATEGY.md
├── SKILLS.md
├── TRAINING.md
├── GLOSSARY.md
├── employee/
│   ├── 01-prepare.md
│   ├── 02-build.md
│   └── 03-run.md
├── delivery/
│   ├── 01-prepare.md
│   ├── 02-build.md
│   └── 03-run.md
├── automation/
│   ├── 01-prepare.md
│   ├── 02-build.md
│   └── 03-run.md
└── templates/
    ├── employee/       (3)
    ├── delivery/       (5)
    ├── automation/     (17)
    └── shared/         (3)
```

Aucune modification de structure. C'est un `git subtree split` ou un simple copier + `git init`.

### 3. `lab-cloud-souverain` (labs Scaleway + CleverCloud groupés)

Regroupe le lab existant et les futurs labs sur ces providers.

```
lab-cloud-souverain/
├── CLAUDE.md
├── README.md                      # Vue d'ensemble des labs
├── landing-zone/                  # Existant (depuis tech_field/labs/)
│   ├── README.md
│   ├── tofu/
│   ├── app/
│   └── scripts/
├── (futur-lab-2)/                 # Prochain lab Scaleway/CC
└── (futur-lab-3)/
```

**Ce qui migre :**
- `tech_field/labs/landing-zone-scaleway-clevercloud/` → `landing-zone/`

**Ce qui migre aussi (optionnel) :**
- `ia_field/dat_as_code_with_ia/tpl_docs/` → templates de doc infra, utiles ici
- `ia_field/dat_as_code_with_ia/agents.md` → CLAUDE.md ou agents.md du repo

### 4. `lab-local-llm` (lab Ollama + Otoroshi)

```
lab-local-llm/
├── CLAUDE.md
├── README.md
├── docker-compose.yml
├── docker-compose-cpu.yml
├── setup/
│   ├── setup_otoroshi.sh
│   ├── switch_mode.sh
│   └── fix_gpu_permissions.sh
└── test/
    ├── test_api.sh
    ├── test_gpu_inference.sh
    ├── benchmark.sh
    ├── check_gpu.sh
    └── monitor_resources.sh
```

**Ce qui migre :** `ia_field/local_llm_otoroshi/` → racine du repo.

---

## Étapes de migration

### Phase 1 — Créer les nouveaux repos (ordre sans dépendance)

```bash
# 1a. Créer ia-adoption-fw
gh repo create agaches/ia-adoption-fw --public --description "Framework d'adoption IA — Person → Project → Product"

# 1b. Créer lab-cloud-souverain
gh repo create agaches/lab-cloud-souverain --public --description "Labs infra cloud souverain (Scaleway, Clever Cloud)"

# 1c. Créer lab-local-llm
gh repo create agaches/lab-local-llm --public --description "Lab LLM local avec Ollama + Otoroshi"
```

### Phase 2 — Peupler les nouveaux repos

```bash
# 2a. ia-adoption-fw
cd /tmp && mkdir ia-adoption-fw && cd ia-adoption-fw
git init
cp -r ~/workspace/git/agaches/ia_field/IA_Adoption_FW/* .
cp ~/workspace/git/agaches/ia_field/IA_Adoption_FW/.claude . 2>/dev/null
cp ~/workspace/git/agaches/ia_field/LICENSE .
git add -A && git commit -m "init: extract IA Adoption Framework from ia_field"
git remote add origin git@github.com:agaches/ia-adoption-fw.git
git push -u origin main

# 2b. lab-cloud-souverain
cd /tmp && mkdir lab-cloud-souverain && cd lab-cloud-souverain
git init
mkdir landing-zone
cp -r ~/workspace/git/agaches/tech_field/labs/landing-zone-scaleway-clevercloud/* landing-zone/
# Optionnel : copier les templates doc infra
mkdir -p shared/tpl-docs
cp ~/workspace/git/agaches/ia_field/dat_as_code_with_ia/tpl_docs/* shared/tpl-docs/
cp ~/workspace/git/agaches/ia_field/LICENSE .
git add -A && git commit -m "init: landing zone Scaleway + CleverCloud via WireGuard"
git remote add origin git@github.com:agaches/lab-cloud-souverain.git
git push -u origin main

# 2c. lab-local-llm
cd /tmp && mkdir lab-local-llm && cd lab-local-llm
git init
cp -r ~/workspace/git/agaches/ia_field/local_llm_otoroshi/* .
cp ~/workspace/git/agaches/ia_field/LICENSE .
git add -A && git commit -m "init: lab LLM local Ollama + Otoroshi"
git remote add origin git@github.com:agaches/lab-local-llm.git
git push -u origin main
```

### Phase 3 — Transformer tech_field en blog

```bash
cd ~/workspace/git/agaches/tech_field

# Supprimer ce qui a migré
rm -rf labs/

# Migrer le contenu depuis ia_field
cp ~/workspace/git/agaches/ia_field/dat_as_code_with_ia/article_dat_as_code.md outputs/
cp ~/workspace/git/agaches/ia_field/doc_negative_review/article_relecture_doc.md outputs/
cp ~/workspace/git/agaches/ia_field/doc_negative_review/catalogue_prompt.md knowledge/
cp ~/workspace/git/agaches/ia_field/dat_as_code_with_ia/catalogue_prompt.md knowledge/catalogue-prompt-dat.md
cp -r ~/workspace/git/agaches/ia_field/diataxis_skills/.claude/skills skills/diataxis

# Supprimer le dossier legacy
rm -rf idees/

git add -A && git commit -m "refactor: migrate to blog — absorb articles, remove labs"

# Renommer le repo sur GitHub
gh repo rename blog --repo agaches/tech_field --yes
```

### Phase 4 — Archiver ia_field

Une fois tout migré :

```bash
# Vérifier que tout est bien parti
# Puis archiver
gh repo archive agaches/ia_field --yes
```

---

## Sync multi-PC

Aucune dépendance, aucun runtime. Un script suffit :

```bash
#!/bin/bash
# sync-all.sh — cloner ou pull tous les repos
REPOS=(blog ia-adoption-fw lab-cloud-souverain lab-local-llm)
BASE="$HOME/workspace/git/agaches"

mkdir -p "$BASE"
for repo in "${REPOS[@]}"; do
  if [ -d "$BASE/$repo/.git" ]; then
    echo "pull $repo"
    git -C "$BASE/$repo" pull --ff-only
  else
    echo "clone $repo"
    git clone "git@github.com:agaches/$repo.git" "$BASE/$repo"
  fi
done
```

---

## Résumé final

| Repo | Contenu | Taille estimée |
|------|---------|----------------|
| **blog** | Pipeline éditorial : ideas → knowledge → outputs (articles, posts, rex, talks) + skills | < 1 Mo |
| **ia-adoption-fw** | Framework adoption IA complet (3 frameworks, 28 templates) | < 1 Mo |
| **lab-cloud-souverain** | Labs Scaleway + CleverCloud (OpenTofu, Docker, WireGuard) | ~100 Mo |
| **lab-local-llm** | Lab Ollama + Otoroshi (Docker Compose) | < 1 Mo |

Chaque repo a son propre `CLAUDE.md` adapté à son contexte. Le repo `blog` reste le point d'entrée éditorial, les autres sont référencés depuis les articles via des liens GitHub.
