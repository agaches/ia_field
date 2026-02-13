# Phase 5 : Secure - Sécuriser votre usage personnel de l'IA (AWARENESS)

## Vue d'ensemble

La sécurité pour l'usage individuel de l'IA se concentre sur la **sensibilisation aux risques** et l'application de **bonnes pratiques personnelles**. Vous êtes responsable de protéger vos comptes, vos données et de valider les outputs.

## 1. OWASP LLM Top 10 - Awareness

### Comprendre les risques principaux

| Risque | Ce que c'est | Ce que VOUS devez faire |
|--------|--------------|-------------------------|
| **LLM01: Prompt Injection** | Quelqu'un peut manipuler le LLM via un prompt malveillant | ⚠️ **Awareness** : Sachez que c'est possible, soyez critique |
| **LLM02: Insecure Output** | Le LLM génère du contenu dangereux (XSS, code malveillant) | ⚠️ **Validation** : Toujours vérifier avant d'utiliser |
| **LLM03: Data Poisoning** | Les données d'entraînement sont corrompues | ℹ️ **N/A** : Responsabilité du provider (ChatGPT, etc.) |
| **LLM04: Model DoS** | Attaque par déni de service sur le modèle | ℹ️ **N/A** : Les providers SaaS ont des rate limits |
| **LLM05: Supply Chain** | Vulnérabilités dans la chaîne d'approvisionnement | ℹ️ **N/A** : Responsabilité du provider |
| **LLM06: Info Disclosure** | ❗ **CRITIQUE** : Fuite de données sensibles | 🚨 **NE JAMAIS** partager de données sensibles dans prompts |
| **LLM07: Insecure Plugins** | Plugins tiers non sécurisés | ⚠️ **Validation** : N'installer que des plugins approuvés |
| **LLM08: Excessive Agency** | Le LLM a trop de permissions | ℹ️ **N/A** : Usage personnel, pas d'agents autonomes |
| **LLM09: Overreliance** | ❗ **IMPORTANT** : Confiance aveugle dans les outputs | 🚨 **TOUJOURS** valider et vérifier les outputs |
| **LLM10: Model Theft** | Vol du modèle | ℹ️ **N/A** : Responsabilité du provider |

### Focus critique pour vous

**LLM06 - Information Disclosure** :
- ❌ **Ne JAMAIS** mettre : credentials, API keys, passwords
- ❌ **Ne JAMAIS** mettre : données clients, PII de collègues
- ❌ **Ne JAMAIS** mettre : propriété intellectuelle confidentielle
- ✅ **OK de mettre** : données publiques, vos notes personnelles

**LLM09 - Overreliance** :
- ⚠️ Le LLM peut se tromper (hallucinations)
- ⚠️ Le LLM peut générer du code avec bugs
- ⚠️ Le LLM peut donner des conseils incorrects
- ✅ **TOUJOURS** : vérifier, tester, valider

## 2. Bonnes pratiques de sécurité personnelles

### Contrôles essentiels

**1. Multi-Factor Authentication (MFA)** 🔐
- ✅ Activer MFA sur TOUS vos comptes IA
- ✅ Utiliser une app authenticator (pas SMS)
- ✅ Sauvegarder les recovery codes

**2. Gestion des mots de passe** 🔑
- ✅ Utiliser un gestionnaire de mots de passe (1Password, Bitwarden, etc.)
- ✅ Mots de passe uniques pour chaque compte
- ❌ Jamais de mot de passe dans les prompts

**3. Classification des données** 📊
Avant chaque prompt, demandez-vous :
```
┌─────────────────────────────┐
│ Est-ce public ?             │
└─────────────────────────────┘
        ↓
    ┌───┴───┐
    │       │
  OUI       NON
    │       │
    ↓       ↓
  ✅ OK    ❌ NE PAS PARTAGER
```

**4. Pas de secrets dans les prompts** 🔒
- ❌ API keys → Utiliser variables d'environnement
- ❌ Passwords → Utiliser gestionnaire
- ❌ Tokens → Utiliser configuration locale
- ✅ Demander à l'IA comment structurer sans les valeurs réelles

### Checklist avant chaque utilisation

- [ ] Mon compte a-t-il MFA activé ?
- [ ] Vais-je partager des données sensibles dans ce prompt ?
- [ ] Ai-je vérifié que cet outil est approuvé par l'entreprise ?
- [ ] Vais-je valider l'output avant de l'utiliser ?

## 3. Guardrails des providers

### Protection par défaut (SaaS)

Les outils que vous utilisez (ChatGPT, Copilot, Claude) ont déjà des protections intégrées :

**Content Filtering** :
- Refus de générer du contenu illégal/dangereux
- Détection de tentatives de jailbreak
- Filtrage de contenu inapproprié

**Data Protection (selon provider)** :
- ChatGPT Enterprise : données non utilisées pour entraînement
- GitHub Copilot for Business : code non partagé
- Vérifier les settings de confidentialité

### Vérifier les paramètres de votre compte

**Pour ChatGPT** :
1. Settings → Data Controls
2. Désactiver "Improve model" si option disponible
3. Activer "Chat History & Training" selon préférence

**Pour GitHub Copilot** :
1. Settings → Copilot
2. Vérifier "Public code suggestions" selon besoins
3. Activer "Copilot Chat" si disponible

## 4. DLP - Data Loss Prevention (Awareness)

### Qu'est-ce que le DLP ?

**DLP** = Outils qui empêchent la fuite de données sensibles

**Ce que l'IT peut faire** :
- Monitoring des uploads vers outils IA
- Blocage automatique si secrets détectés
- Alertes si patterns suspects

**Ce que VOUS devez faire** :
- Être conscient que vos actions peuvent être monitorées
- Respecter les politiques même si pas de DLP technique
- Signaler si vous voyez des collègues partager des données sensibles

### Auto-DLP : Votre responsabilité

**Règle simple** : Si vous hésitez, ne partagez pas.

Questions à vous poser :
1. Est-ce que je montrerais ceci sur Twitter ?
   - OUI → OK
   - NON → Ne pas partager
2. Est-ce que mon manager approuverait ?
   - OUI → OK
   - NON → Demander permission
3. Est-ce que cela pourrait nuire à l'entreprise si publié ?
   - OUI → NE PAS PARTAGER
   - NON → OK

## 5. Incident Response

### Si vous commettez une erreur

**Scénario** : J'ai accidentellement partagé un API key dans ChatGPT

**Actions immédiates** :
1. ⏱️ **Immédiatement** : Révoquer/changer le secret
2. 📞 **< 1h** : Ouvrir un ticket IT (incident de sécurité)
3. 📝 **< 2h** : Documenter :
   - Quelle donnée a été partagée ?
   - Quel outil (ChatGPT, Copilot, etc.) ?
   - Quand (date/heure) ?
   - Actions déjà prises
4. 🔍 **< 24h** : Suivre avec IT pour résolution

**Pas de panique** : Les erreurs arrivent. L'important est de réagir vite.

### Process de signalement IT

```
Incident détecté
      ↓
Ouvrir ticket IT (Priorité: Security)
      ↓
IT évalue l'impact
      ↓
   ┌──┴──┐
   │     │
Faible  Élevé
   │     │
   ↓     ↓
24-48h  Immédiat
```

## 6. Formation continue

### Ressources recommandées

**OWASP LLM Top 10** (lecture 1h) :
- 🔗 [https://genai.owasp.org/](https://genai.owasp.org/)
- Comprendre les 10 risques principaux
- Focus sur LLM06 et LLM09

**Guides des providers** :
- ChatGPT Safety Best Practices
- GitHub Copilot Security Guidelines
- Documentation de votre outil

**Formation interne** :
- Formation IA Awareness (2h) - obligatoire
- Sessions de partage d'équipe (optionnel)

### Mise à jour des connaissances

- **Trimestriel** : Relire OWASP LLM Top 10 (mises à jour fréquentes)
- **Annuel** : Renouveler la formation IA Awareness
- **Continu** : Suivre les annonces de votre provider (security updates)

## Checklist Secure (Employee)

### 🚀 Startup / Individu

- [ ] Activer MFA sur tous les comptes IA
- [ ] Utiliser un gestionnaire de mots de passe
- [ ] Lire OWASP LLM Top 10 (focus LLM06, LLM09)
- [ ] Vérifier les paramètres de confidentialité des outils
- [ ] Connaître le processus de signalement IT
- [ ] Appliquer la checklist avant chaque utilisation

## Prochaine étape

→ [Phase 6 : Manage](06-manage.md) - Gérer votre productivité personnelle avec l'IA
