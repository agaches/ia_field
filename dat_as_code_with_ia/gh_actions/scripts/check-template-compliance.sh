#!/bin/bash
set -e

# Configuration - À personnaliser selon votre organisation
PROJECT_REPO="${PROJECT_REPO:-<org>/<project>}"
TEMPLATES_REPO="${TEMPLATES_REPO:-<org>/<templates-repo>}"
TEMPLATES_PATH="${TEMPLATES_PATH:-toolbox/tpl_docs}"

REPORT_FILE="/tmp/compliance-report.md"
ISSUES_FOUND=0

echo "# 🔍 Rapport de conformité des templates" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "**Date**: $(date -u +"%Y-%m-%d %H:%M:%S UTC")" >> "$REPORT_FILE"
echo "**PR**: #${{ github.event.pull_request.number }}" >> "$REPORT_FILE"
echo "**Branch**: ${{ github.event.pull_request.head.ref }}" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Template attendus et leurs fichiers
declare -A EXPECTED_DOCS=(
    ["README.md"]="TPL_README.md"
    ["docs/README_DEX.md"]="TPL_README_DEX.md"
    ["docs/README_FW.md"]="TPL_README_FW.md"
    ["docs/README_IAM.md"]="TPL_README_IAM.md"
    ["docs/README_SIZING.md"]="TPL_README_SIZING.md"
)

# Sections obligatoires par template
declare -A REQUIRED_SECTIONS=(
    ["README.md"]="## 📋 Vue d'ensemble|## 🏗️ Architecture|## 📦 Modules|## 🔗 Liens utiles"
    ["docs/README_DEX.md"]="## 🎯 Objectif|## 📊 Monitoring|## 🚨 Incidents|## 📞 Contacts"
    ["docs/README_FW.md"]="## 🔥 Règles Firewall|## 📍 Adressage|## 🔒 Sécurité"
    ["docs/README_IAM.md"]="## 👥 Rôles IAM|## 🔑 Service Accounts|## 🛡️ Permissions"
    ["docs/README_SIZING.md"]="## 💰 Coûts|## 📊 Dimensionnement|## 📈 Évolution"
)

echo "## ❌ Problèmes détectés" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Vérifier chaque fichier de documentation
for doc_file in "${!EXPECTED_DOCS[@]}"; do
    if [ -f "$doc_file" ]; then
        template="${EXPECTED_DOCS[$doc_file]}"
        required="${REQUIRED_SECTIONS[$doc_file]}"
        
        echo "### 📄 \`$doc_file\`" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
        echo "**Template de référence**: \`$template\`" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
        
        # Vérifier les sections obligatoires
        IFS='|' read -ra SECTIONS <<< "$required"
        missing_sections=()
        
        for section in "${SECTIONS[@]}"; do
            if ! grep -q "$section" "$doc_file"; then
                missing_sections+=("$section")
            fi
        done
        
        if [ ${#missing_sections[@]} -gt 0 ]; then
            ISSUES_FOUND=$((ISSUES_FOUND + 1))
            echo "**⚠️ Sections manquantes**:" >> "$REPORT_FILE"
            for section in "${missing_sections[@]}"; do
                echo "- \`$section\`" >> "$REPORT_FILE"
            done
            echo "" >> "$REPORT_FILE"
        else
            echo "✅ Toutes les sections requises présentes" >> "$REPORT_FILE"
            echo "" >> "$REPORT_FILE"
        fi
    else
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
        echo "### ❌ \`$doc_file\` - **FICHIER MANQUANT**" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
        echo "**Action**: Créer le fichier à partir du template \`${EXPECTED_DOCS[$doc_file]}\`" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
    fi
done

echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "## 🤖 Instructions pour le LLM" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo '```json' >> "$REPORT_FILE"
echo '{' >> "$REPORT_FILE"
echo '  "task": "fix_template_compliance",' >> "$REPORT_FILE"
echo '  "repository": "'"$PROJECT_REPO"'",' >> "$REPORT_FILE"
echo '  "templates_source": "'"$TEMPLATES_REPO/$TEMPLATES_PATH"'",' >> "$REPORT_FILE"
echo '  "issues_count": '$ISSUES_FOUND',' >> "$REPORT_FILE"
echo '  "action_required": "Analyser le rapport ci-dessus et corriger les non-conformités en utilisant les templates de référence"' >> "$REPORT_FILE"
echo '}' >> "$REPORT_FILE"
echo '```' >> "$REPORT_FILE"

if [ $ISSUES_FOUND -gt 0 ]; then
    echo "❌ $ISSUES_FOUND problème(s) de conformité détecté(s)"
    exit 1
else
    echo "✅ Tous les documents sont conformes aux templates"
    exit 0
fi
