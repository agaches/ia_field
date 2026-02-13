# Phase 3 : Ready - Configuration environnement personnel IA

## Vue d'ensemble

Configurez votre environnement de travail pour utiliser efficacement les outils IA.

## 1. Politique d'usage acceptable

**Actions** :
- Lire la politique IA de votre entreprise (intranet, RH/IT, manager)
- Clarifier : outils approuvés, données autorisées, obligations sécurité
- Signer l'attestation si requis

## 2. Réseau et fiabilité

**SaaS = Pas de config réseau nécessaire**

Vérifications :
- Accès internet et HTTPS fonctionnels
- Outils non bloqués par proxy entreprise
- Si bloqué : contacter IT support

## 3. Setup outils

### Pour développeurs

**IDE + Extension** :
- VS Code + GitHub Copilot / Codeium
- Cursor (IA intégrée)
- JetBrains IDEs + AI Assistant

**Installation** : Suivre doc officielle de chaque outil

### Sécurité

**Obligatoire** :
- MFA sur tous les comptes IA
- Gestionnaire mots de passe (1Password, Bitwarden)
- Jamais de credentials en dur dans le code (utiliser .env)
- Vérifier .gitignore (.env, *.key, secrets.json)

## Checklist Ready

- [ ] Lire et accepter politique IA entreprise
- [ ] Installer IDE + extension IA (si dev)
- [ ] Créer comptes outils (ChatGPT/Claude) avec MFA
- [ ] Installer gestionnaire mots de passe
- [ ] Vérifier .gitignore (si dev)
- [ ] Tester setup

## Prochaine étape

→ [Phase 4 : Govern](04-govern.md) - Gouverner votre usage IA
