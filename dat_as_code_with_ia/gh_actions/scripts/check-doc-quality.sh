#!/bin/bash
set -e

# Configuration - À personnaliser selon votre organisation
PROJECT_REPO="${PROJECT_REPO:-<org>/<project>}"

REPORT_FILE="/tmp/quality-report.md"
ISSUES_FOUND=0

echo "# 🔍 Rapport de qualité de la documentation" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "**Date**: $(date -u +"%Y-%m-%d %H:%M:%S UTC")" >> "$REPORT_FILE"
echo "**PR**: #${{ github.event.pull_request.number }}" >> "$REPORT_FILE"
echo "**Branch**: ${{ github.event.pull_request.head.ref }}" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 1. Vérifier les TODOs et FIXME
echo "## 📝 TODOs et FIXME détectés" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

TODO_COUNT=0
while IFS= read -r line; do
    TODO_COUNT=$((TODO_COUNT + 1))
    echo "- $line" >> "$REPORT_FILE"
done < <(grep -rn "TODO\|FIXME\|XXX\|HACK" --include="*.md" --include="*.tf" . 2>/dev/null || true)

if [ $TODO_COUNT -gt 0 ]; then
    ISSUES_FOUND=$((ISSUES_FOUND + TODO_COUNT))
    echo "" >> "$REPORT_FILE"
    echo "**Total**: $TODO_COUNT TODO(s) trouvé(s)" >> "$REPORT_FILE"
else
    echo "✅ Aucun TODO trouvé" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 2. Vérifier les liens cassés
echo "## 🔗 Vérification des liens" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

BROKEN_LINKS=0
while IFS= read -r file; do
    # Extraire les liens markdown
    while IFS= read -r link; do
        # Vérifier les liens locaux (relatifs)
        if [[ "$link" =~ ^\.\./|^\./ ]]; then
            target=$(dirname "$file")/"$link"
            if [ ! -f "$target" ] && [ ! -d "$target" ]; then
                BROKEN_LINKS=$((BROKEN_LINKS + 1))
                echo "❌ \`$file\`: Lien cassé \`$link\`" >> "$REPORT_FILE"
            fi
        fi
    done < <(grep -oP '\[.*?\]\(\K[^)]+' "$file" 2>/dev/null || true)
done < <(find . -name "*.md" -type f)

if [ $BROKEN_LINKS -gt 0 ]; then
    ISSUES_FOUND=$((ISSUES_FOUND + BROKEN_LINKS))
    echo "" >> "$REPORT_FILE"
    echo "**Total**: $BROKEN_LINKS lien(s) cassé(s)" >> "$REPORT_FILE"
else
    echo "✅ Aucun lien cassé détecté" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 3. Vérifier les fichiers référencés manquants
echo "## 📂 Fichiers référencés manquants" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

MISSING_FILES=0
# Chercher les références à des fichiers dans la doc
while IFS= read -r file; do
    while IFS= read -r referenced_file; do
        # Nettoyer le chemin
        clean_path=$(echo "$referenced_file" | sed 's/`//g' | sed 's/"//g' | sed "s/'//g")
        if [[ "$clean_path" =~ \.(tf|md|sh|yaml|yml|json)$ ]]; then
            if [ ! -f "$clean_path" ]; then
                MISSING_FILES=$((MISSING_FILES + 1))
                echo "❌ \`$file\`: Référence un fichier manquant \`$clean_path\`" >> "$REPORT_FILE"
            fi
        fi
    done < <(grep -oP '`[^`]+\.(tf|md|sh|yaml|yml|json)`' "$file" 2>/dev/null || true)
done < <(find . -name "*.md" -type f)

if [ $MISSING_FILES -gt 0 ]; then
    ISSUES_FOUND=$((ISSUES_FOUND + MISSING_FILES))
    echo "" >> "$REPORT_FILE"
    echo "**Total**: $MISSING_FILES fichier(s) référencé(s) manquant(s)" >> "$REPORT_FILE"
else
    echo "✅ Tous les fichiers référencés existent" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 4. Vérifier la cohérence des titres
echo "## 📑 Cohérence des titres" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

TITLE_ISSUES=0
while IFS= read -r file; do
    # Vérifier que le fichier commence par un titre de niveau 1
    first_line=$(head -n 1 "$file")
    if [[ ! "$first_line" =~ ^#\  ]]; then
        TITLE_ISSUES=$((TITLE_ISSUES + 1))
        echo "⚠️ \`$file\`: Ne commence pas par un titre de niveau 1 (\`# Titre\`)" >> "$REPORT_FILE"
    fi
    
    # Vérifier la hiérarchie des titres
    prev_level=0
    while IFS= read -r heading; do
        level=$(echo "$heading" | awk '{print gsub(/#/, "")}')
        if [ $level -gt $((prev_level + 1)) ]; then
            TITLE_ISSUES=$((TITLE_ISSUES + 1))
            echo "⚠️ \`$file\`: Saut de niveau de titre (de H$prev_level à H$level)" >> "$REPORT_FILE"
        fi
        prev_level=$level
    done < <(grep "^#" "$file" 2>/dev/null || true)
done < <(find . -name "*.md" -type f)

if [ $TITLE_ISSUES -gt 0 ]; then
    ISSUES_FOUND=$((ISSUES_FOUND + TITLE_ISSUES))
    echo "" >> "$REPORT_FILE"
    echo "**Total**: $TITLE_ISSUES problème(s) de titres" >> "$REPORT_FILE"
else
    echo "✅ Hiérarchie des titres correcte" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 5. Vérifier les blocs de code
echo "## 💻 Blocs de code" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

CODE_ISSUES=0
while IFS= read -r file; do
    # Compter les backticks triples
    backticks=$(grep -c '```' "$file" || echo "0")
    if [ $((backticks % 2)) -ne 0 ]; then
        CODE_ISSUES=$((CODE_ISSUES + 1))
        echo "❌ \`$file\`: Bloc de code non fermé (nombre impair de \`\`\`)" >> "$REPORT_FILE"
    fi
done < <(find . -name "*.md" -type f)

if [ $CODE_ISSUES -gt 0 ]; then
    ISSUES_FOUND=$((ISSUES_FOUND + CODE_ISSUES))
    echo "" >> "$REPORT_FILE"
    echo "**Total**: $CODE_ISSUES bloc(s) de code mal formaté(s)" >> "$REPORT_FILE"
else
    echo "✅ Tous les blocs de code sont correctement fermés" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "## 📊 Résumé" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "| Catégorie | Problèmes |" >> "$REPORT_FILE"
echo "|-----------|-----------|" >> "$REPORT_FILE"
echo "| TODOs/FIXME | $TODO_COUNT |" >> "$REPORT_FILE"
echo "| Liens cassés | $BROKEN_LINKS |" >> "$REPORT_FILE"
echo "| Fichiers manquants | $MISSING_FILES |" >> "$REPORT_FILE"
echo "| Titres | $TITLE_ISSUES |" >> "$REPORT_FILE"
echo "| Blocs de code | $CODE_ISSUES |" >> "$REPORT_FILE"
echo "| **TOTAL** | **$ISSUES_FOUND** |" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "## 🤖 Instructions pour le LLM" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo '```json' >> "$REPORT_FILE"
echo '{' >> "$REPORT_FILE"
echo '  "task": "fix_documentation_quality",' >> "$REPORT_FILE"
echo '  "repository": "'"$PROJECT_REPO"'",' >> "$REPORT_FILE"
echo '  "issues_count": '$ISSUES_FOUND',' >> "$REPORT_FILE"
echo '  "categories": {' >> "$REPORT_FILE"
echo '    "todos": '$TODO_COUNT',' >> "$REPORT_FILE"
echo '    "broken_links": '$BROKEN_LINKS',' >> "$REPORT_FILE"
echo '    "missing_files": '$MISSING_FILES',' >> "$REPORT_FILE"
echo '    "title_issues": '$TITLE_ISSUES',' >> "$REPORT_FILE"
echo '    "code_blocks": '$CODE_ISSUES >> "$REPORT_FILE"
echo '  },' >> "$REPORT_FILE"
echo '  "action_required": "Corriger les problèmes de qualité détectés dans la documentation en suivant les bonnes pratiques Markdown"' >> "$REPORT_FILE"
echo '}' >> "$REPORT_FILE"
echo '```' >> "$REPORT_FILE"

if [ $ISSUES_FOUND -gt 0 ]; then
    echo "❌ $ISSUES_FOUND problème(s) de qualité détecté(s)"
    exit 1
else
    echo "✅ Documentation de qualité conforme"
    exit 0
fi
