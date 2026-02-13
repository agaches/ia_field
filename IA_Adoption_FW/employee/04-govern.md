# Phase 4 : Govern - Gouvernance IA individuelle (LIGHT)

## Vue d'ensemble

La gouvernance pour l'usage individuel de l'IA se concentre sur les **bonnes pratiques personnelles** et le respect d'une **politique d'usage acceptable**. L'objectif est d'assurer un usage sûr et responsable sans créer de surcharge bureaucratique.

## 1. Comprendre les risques individuels

### Risques principaux pour l'usage personnel

| Risque | Description | Impact |
|--------|-------------|--------|
| **Fuite accidentelle de données** | Partager des données sensibles dans un prompt | Confidentialité compromise |
| **Prompt injection (awareness)** | Être conscient que les LLMs peuvent être manipulés | Résultats incorrects |
| **Overreliance** | Faire confiance aveuglément aux outputs IA | Erreurs, mauvaises décisions |
| **Violation de propriété intellectuelle** | Utiliser du code/contenu généré sans vérification | Risques légaux |

**Principe clé** : La responsabilité reste **individuelle**. Vous êtes responsable de ce que vous partagez et de comment vous utilisez les outputs IA.

## 2. Politique d'usage acceptable

### Règles essentielles

**À FAIRE** ✅ :
- Utiliser l'IA pour améliorer votre productivité personnelle
- Vérifier et valider tous les outputs IA avant utilisation
- Utiliser MFA sur tous vos comptes IA
- Signaler tout incident via le processus IT

**À NE PAS FAIRE** ❌ :
- Partager des données sensibles, secrets, credentials dans les prompts
- Partager des informations personnelles (PII) de collègues/clients
- Partager de la propriété intellectuelle confidentielle
- Utiliser l'IA pour créer du contenu trompeur ou nuisible
- Contourner les contrôles de sécurité de l'entreprise

### Données sensibles - Classification

| Type de donnée | Exemples | Partage avec IA |
|----------------|----------|-----------------|
| **Public** | Documentation publique, blog posts | ✅ OK |
| **Interne** | Emails internes, docs projets non-sensibles | ⚠️ Selon outil (vérifier politique) |
| **Confidentiel** | Contrats, financials, stratégie | ❌ INTERDIT |
| **Secret** | Credentials, API keys, mots de passe | ❌ JAMAIS |

## 3. Auto-application des bonnes pratiques

### Checklist quotidienne

- [ ] Avant chaque prompt : "Est-ce que je partage des données sensibles ?"
- [ ] Après chaque output : "Est-ce que je dois vérifier cette information ?"
- [ ] Utilisation de credentials : "Est-ce que j'utilise un gestionnaire de mots de passe ?"
- [ ] Fin de journée : "Ai-je suivi les bonnes pratiques aujourd'hui ?"

### Supervision managériale

Votre manager peut :
- Vérifier que vous avez suivi la formation awareness IA (2h)
- Demander des rapports d'usage si besoin (coûts, productivité)
- Escalader les incidents si détectés

**Pas d'approbation formelle requise** pour l'usage personnel d'outils IA standard (ChatGPT, Copilot, etc.).

## 4. Processus de signalement des incidents

### Si vous détectez un problème

1. **Identifier** : Reconnaître qu'un incident s'est produit
   - Données sensibles partagées accidentellement
   - Output IA problématique utilisé en production
   - Compte compromis

2. **Signaler** : Ouvrir un ticket IT immédiatement
   - Décrire l'incident (quoi, quand, quel outil)
   - Impact estimé
   - Actions déjà prises

3. **Suivre** : Collaborer avec l'IT pour la résolution
   - Fournir les informations demandées
   - Appliquer les mesures correctives
   - Documenter les learnings

**Temps de réponse attendu** : Ticket IT traité selon priorité (24-48h pour incidents non-critiques).

## 5. Formation et awareness

### Formation requise

**Formation IA Awareness (2h)** :
- Introduction aux concepts IA/ML/GenAI
- Risques OWASP LLM Top 10 (awareness)
- Politique d'usage acceptable
- Bonnes pratiques de sécurité
- Processus de signalement

**Fréquence** : Annuelle ou lors de changements majeurs

### Ressources d'auto-formation

- Documentation interne sur les outils approuvés
- [OWASP LLM Top 10](https://genai.owasp.org/) (lecture awareness)
- Guides d'utilisation des outils (ChatGPT, Copilot, etc.)

## Checklist Govern (Employee)

### 🚀 Startup / Individu

- [ ] Lire et accepter la politique d'usage acceptable
- [ ] Compléter la formation IA Awareness (2h)
- [ ] Configurer MFA sur les comptes IA
- [ ] Connaître le processus de signalement IT
- [ ] Appliquer la checklist quotidienne

## Prochaine étape

→ [Phase 5 : Secure](05-secure.md) - Sécuriser votre usage personnel de l'IA
