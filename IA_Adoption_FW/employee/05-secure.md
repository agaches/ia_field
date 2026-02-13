# Phase 5 : Secure - Sécuriser votre usage IA (AWARENESS)

## Vue d'ensemble

Sensibilisation aux risques et bonnes pratiques personnelles.

## 1. Risques critiques OWASP LLM Top 10

**Focus sur 2 risques majeurs** :

**LLM06 - Information Disclosure** 🚨 :

**❌ Jamais (tous outils)** : credentials, API keys, passwords, secrets

**Données internes** (selon type outil) :

| Type outil | Données publiques | Données internes | Données confidentielles |
|------------|-------------------|------------------|------------------------|
| **Outils personnels** (ChatGPT perso, Claude perso) | ✅ OK | ❌ Interdit | ❌ Interdit |
| **Outils corporate** (ChatGPT Team, Copilot Business) | ✅ OK | ⚠️ Selon politique entreprise | ❌ Interdit sauf autorisation |

**Règle** : Toujours vérifier la politique de votre entreprise avant de partager des données internes

**LLM09 - Overreliance** ⚠️ :
- L'IA peut halluciner, générer du code buggé, donner conseils incorrects
- **Toujours** vérifier, tester, valider

**Autres risques** (awareness) : Prompt injection, insecure output, insecure plugins
**Ressource** : [OWASP LLM Top 10](https://genai.owasp.org/)

## 2. Bonnes pratiques essentielles

**MFA** : Activer sur tous comptes IA (app authenticator, pas SMS)
**Mots de passe** : Gestionnaire (1Password, Bitwarden), mots de passe uniques
**Secrets** : Jamais dans les prompts (utiliser .env, gestionnaire)

**Checklist avant utilisation** :
- Données sensibles dans ce prompt ?
- Outil approuvé par l'entreprise ?
- Vais-je valider l'output ?

## 3. Paramètres confidentialité

**ChatGPT** : Settings → Data Controls, désactiver "Improve model"
**GitHub Copilot** : Settings → Vérifier "Public code suggestions"

## 4. Incident Response

**Si erreur (ex: API key partagée)** :
1. Immédiatement : Révoquer/changer le secret
2. < 1h : Ouvrir ticket IT (incident sécurité)
3. Documenter : Quelle donnée, quel outil, quand, actions prises

**Règle** : Erreurs arrivent, réagir vite.

## 5. Formation

**Formation IA Awareness (2h)** - obligatoire
**Ressource** : [OWASP LLM Top 10](https://genai.owasp.org/) (lecture 1h)

## Checklist Secure

- [ ] MFA activé sur tous comptes IA
- [ ] Gestionnaire mots de passe utilisé
- [ ] OWASP LLM Top 10 lu (focus LLM06, LLM09)
- [ ] Paramètres confidentialité vérifiés
- [ ] Processus signalement IT connu

## Prochaine étape

→ [Phase 6 : Manage](06-manage.md) - Gérer votre productivité avec l'IA
