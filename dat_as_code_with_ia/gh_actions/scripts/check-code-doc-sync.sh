#!/bin/bash
set -e

# Configuration - À personnaliser selon votre organisation
PROJECT_REPO="${PROJECT_REPO:-<org>/<project>}"

REPORT_FILE="/tmp/sync-report.md"
ISSUES_FOUND=0

echo "# 🔄 Rapport de synchronisation Code ↔ Documentation" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "**Date**: $(date -u +"%Y-%m-%d %H:%M:%S UTC")" >> "$REPORT_FILE"
echo "**PR**: #${{ github.event.pull_request.number }}" >> "$REPORT_FILE"
echo "**Branch**: ${{ github.event.pull_request.head.ref }}" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Extraire les ressources Terraform principales
echo "## 📦 Analyse des ressources Terraform" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Compter les ressources par type
declare -A RESOURCE_COUNTS
while IFS= read -r line; do
    resource_type=$(echo "$line" | awk '{print $2}' | tr -d '"')
    RESOURCE_COUNTS[$resource_type]=$((${RESOURCE_COUNTS[$resource_type]:-0} + 1))
done < <(find . -name "*.tf" -exec grep -h "^resource " {} \;)

# Vérifier si les ressources sont documentées
for resource in "${!RESOURCE_COUNTS[@]}"; do
    count=${RESOURCE_COUNTS[$resource]}
    echo "### 🔹 \`$resource\` (x$count)" >> "$REPORT_FILE"
    
    # Chercher la mention dans la doc
    if grep -rq "$resource" docs/ README.md 2>/dev/null; then
        echo "✅ Documenté" >> "$REPORT_FILE"
    else
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
        echo "❌ **NON DOCUMENTÉ**" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
        echo "**Action**: Ajouter une description de \`$resource\` dans la documentation" >> "$REPORT_FILE"
    fi
    echo "" >> "$REPORT_FILE"
done

# Vérifier les modules
echo "## 🧩 Analyse des modules Terraform" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ -d "modules" ]; then
    for module_dir in modules/*/; do
        module_name=$(basename "$module_dir")
        echo "### 📦 Module \`$module_name\`" >> "$REPORT_FILE"
        
        # Vérifier si le module a un README
        if [ ! -f "$module_dir/README.md" ]; then
            ISSUES_FOUND=$((ISSUES_FOUND + 1))
            echo "❌ **README.md manquant**" >> "$REPORT_FILE"
            echo "" >> "$REPORT_FILE"
        else
            echo "✅ README.md présent" >> "$REPORT_FILE"
            echo "" >> "$REPORT_FILE"
        fi
        
        # Vérifier si les variables sont documentées
        if [ -f "$module_dir/variables.tf" ]; then
            vars_count=$(grep -c "^variable " "$module_dir/variables.tf" || echo "0")
            echo "**Variables**: $vars_count" >> "$REPORT_FILE"
            
            # Vérifier les descriptions
            vars_with_desc=$(grep -A 2 "^variable " "$module_dir/variables.tf" | grep -c "description" || echo "0")
            if [ "$vars_with_desc" -lt "$vars_count" ]; then
                ISSUES_FOUND=$((ISSUES_FOUND + 1))
                echo "⚠️ Certaines variables n'ont pas de description ($vars_with_desc/$vars_count)" >> "$REPORT_FILE"
            else
                echo "✅ Toutes les variables sont documentées" >> "$REPORT_FILE"
            fi
        fi
        echo "" >> "$REPORT_FILE"
    done
fi

# Vérifier les outputs
echo "## 📤 Analyse des outputs" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

for env in DEV PREP REC PROD; do
    if [ -f "$env/outputs.tf" ]; then
        outputs_count=$(grep -c "^output " "$env/outputs.tf" || echo "0")
        echo "### 🌍 Environnement \`$env\`" >> "$REPORT_FILE"
        echo "**Outputs**: $outputs_count" >> "$REPORT_FILE"
        
        if [ "$outputs_count" -gt 0 ]; then
            # Vérifier si documenté dans README
            if ! grep -q "output" docs/README_DEX.md 2>/dev/null && ! grep -q "output" README.md 2>/dev/null; then
                ISSUES_FOUND=$((ISSUES_FOUND + 1))
                echo "⚠️ Les outputs ne sont pas documentés" >> "$REPORT_FILE"
            else
                echo "✅ Outputs documentés" >> "$REPORT_FILE"
            fi
        fi
        echo "" >> "$REPORT_FILE"
    fi
done

echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "## 🤖 Instructions pour le LLM" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo '```json' >> "$REPORT_FILE"
echo '{' >> "$REPORT_FILE"
echo '  "task": "sync_code_documentation",' >> "$REPORT_FILE"
echo '  "repository": "'"$PROJECT_REPO"'",' >> "$REPORT_FILE"
echo '  "issues_count": '$ISSUES_FOUND',' >> "$REPORT_FILE"
echo '  "action_required": "Mettre à jour la documentation pour refléter les ressources, modules et outputs Terraform du code",' >> "$REPORT_FILE"
echo '  "targets": ["README.md", "docs/README_IAM.md", "docs/README_FW.md", "docs/README_SIZING.md"]' >> "$REPORT_FILE"
echo '}' >> "$REPORT_FILE"
echo '```' >> "$REPORT_FILE"

if [ $ISSUES_FOUND -gt 0 ]; then
    echo "❌ $ISSUES_FOUND désynchronisation(s) détectée(s)"
    exit 1
else
    echo "✅ Code et documentation sont synchronisés"
    exit 0
fi
