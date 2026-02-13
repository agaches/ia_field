# Phase 5 : Secure - Sécurité IA

## Vue d'ensemble

Les systèmes IA présentent des risques de sécurité uniques au-delà des menaces traditionnelles : prompt injection, data poisoning, model theft, et hallucinations. Cette phase structure la protection des actifs IA à travers découverte, protection et détection.

## 1. Découvrir les risques de sécurité IA

### OWASP Top 10 pour LLM (2025)

Le [OWASP Generative AI](https://genai.owasp.org/) documente les risques spécifiques aux LLMs.

| Rang | Risque | Description | Impact | Mitigation principale |
|------|--------|-------------|--------|----------------------|
| **LLM01** | Prompt Injection | Manipulation du comportement via prompts malveillants | Élevé | Validation inputs, sandboxing, guardrails |
| **LLM02** | Insecure Output Handling | Traitement non sécurisé des outputs LLM | Élevé | Validation outputs, encoding, sanitization |
| **LLM03** | Training Data Poisoning | Injection de données malveillantes dans training | Moyen | Validation sources, data provenance, audits |
| **LLM04** | Model Denial of Service | Surcharge ressources via inputs coûteux | Moyen | Rate limiting, quotas, monitoring |
| **LLM05** | Supply Chain Vulnerabilities | Dépendances non sécurisées (modèles, datasets) | Élevé | Vérification provenance, scanning vulnérabilités |
| **LLM06** | Sensitive Information Disclosure | Fuite données sensibles via outputs/modèles | Élevé | DLP, anonymisation, filtering |
| **LLM07** | Insecure Plugin Design | Plugins tiers non sécurisés | Moyen | Validation plugins, sandboxing, least privilege |
| **LLM08** | Excessive Agency | Permissions excessives pour agents IA | Élevé | Least privilege, human-in-the-loop, approval gates |
| **LLM09** | Overreliance | Confiance excessive sans validation | Moyen | Human validation, fact-checking, disclaimers |
| **LLM10** | Model Theft | Vol de modèles propriétaires | Moyen | Contrôles d'accès, watermarking, API rate limits |

### MITRE ATLAS - Adversarial Threat Landscape

Le [MITRE ATLAS](https://atlas.mitre.org/) cartographie les tactiques et techniques d'attaque IA.

**Phases d'attaque principales** :
1. **Reconnaissance** : Découverte architecture IA, modèles, données
2. **Resource Development** : Préparation datasets adversariaux, outils
3. **Initial Access** : Exploitation vulnérabilités, phishing
4. **Execution** : Prompt injection, model poisoning
5. **Persistence** : Backdoors dans modèles, accès maintenu
6. **Exfiltration** : Vol modèles, datasets, propriété intellectuelle

### Matrice menaces IA et contre-mesures

| Menace | Vecteur d'attaque | Impact potentiel | Contre-mesures techniques | Contre-mesures organisationnelles |
|--------|------------------|------------------|---------------------------|----------------------------------|
| **Prompt Injection** | Inputs utilisateur malveillants | Exécution commandes non autorisées | Input filtering, guardrails, sandboxing | Formation utilisateurs, monitoring |
| **Data Poisoning** | Manipulation datasets training | Modèle biaisé/compromis | Validation provenance, anomaly detection | Revue données, audits pipeline |
| **Model Extraction** | Requêtes API répétées | Vol IP, réplication modèle | Rate limiting, watermarking, output obfuscation | Accès restreint, contrats NDA |
| **Membership Inference** | Analyse outputs modèle | Fuite confidentialité training data | Differential privacy, output filtering | Anonymisation datasets, DLP |
| **Adversarial Examples** | Inputs craftés pour tromper modèle | Décisions incorrectes | Adversarial training, input sanitization | Human validation critique |
| **Backdoor Attacks** | Modèles/datasets compromis supply chain | Comportement malveillant caché | Model scanning, provenance verification | Fournisseurs validés, audits |

## 2. Protéger les ressources et données

### Architecture de sécurité en profondeur

```
┌─────────────────────────────────────────────────────┐
│               User / Application Layer               │
│  - Authentication (MFA)                             │
│  - Input validation & filtering                     │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│                  API Gateway Layer                   │
│  - Rate limiting / Quotas                           │
│  - Request/Response filtering                       │
│  - WAF (Web Application Firewall)                   │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│              Application / AI Service                │
│  - Guardrails (content filtering)                   │
│  - DLP (sensitive data detection)                   │
│  - Prompt engineering (safety)                      │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│                   Model Layer                        │
│  - Model access controls (IAM)                      │
│  - Versioning & approval (gates)                    │
│  - Watermarking (optional)                          │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│                    Data Layer                        │
│  - Encryption at rest (KMS)                         │
│  - Encryption in transit (TLS)                      │
│  - Data classification & masking                    │
│  - Access controls (IAM)                            │
│  - Audit logging (immutable)                        │
└─────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────┐
│              Infrastructure Layer                    │
│  - Network isolation (VPC/VNet)                     │
│  - Bastion access only                              │
│  - Security groups / Firewalls                      │
└─────────────────────────────────────────────────────┘
```

### Chiffrement des données IA

| Type de données | Chiffrement at rest | Chiffrement in transit | Chiffrement in use (optionnel) |
|-----------------|---------------------|------------------------|-------------------------------|
| **Training datasets** | KMS-encrypted storage | TLS 1.2+ | Confidential Computing (TEE) |
| **Models** | KMS-encrypted registry | TLS 1.2+ | Secure Enclaves |
| **Inference inputs/outputs** | Encrypted cache/logs | TLS 1.2+ | Ephemeral, PII masking |
| **Vector databases (RAG)** | Encrypted storage | TLS 1.2+ | Field-level encryption |

Voir [GLOSSARY.md](GLOSSARY.md) pour services de chiffrement (KMS) par cloud.

### IAM pour IA - Least Privilege

**Principe** : Accorder uniquement les permissions nécessaires pour chaque rôle.

**Rôles et permissions recommandées** :

| Rôle | Permissions | Justification |
|------|-------------|---------------|
| **Data Scientist** | Read datasets, Read/Write models (dev), Submit training jobs | Développement et expérimentation |
| **ML Engineer** | Read datasets, Read/Write models (staging/prod), Deploy endpoints | Déploiement et opérations |
| **MLOps Engineer** | Manage infrastructure, Configure monitoring, Manage CI/CD | Infrastructure et automation |
| **Data Engineer** | Read/Write datasets, Manage data pipelines | Gestion données |
| **Business User** | Invoke inference endpoints (read-only) | Consommation prédictions |
| **Auditor** | Read-only all resources, Read logs | Audit et conformité |

**Contrôles additionnels** :
- **MFA obligatoire** pour accès console cloud
- **Temporary credentials** (STS, Workload Identity) vs static keys
- **Conditional access** : Restreindre par IP/VPN pour admin
- **Break-glass accounts** : Accès urgence, logged et reviewé

### DLP pour IA

**Détection données sensibles** :
- **PII** : Noms, emails, numéros téléphone, SSN, etc.
- **PHI** : Données santé (HIPAA)
- **PCI** : Données cartes bancaires
- **Secrets** : API keys, credentials, tokens

**Points de contrôle DLP** :
1. **Inputs utilisateur** : Bloquer prompts avec PII
2. **Training datasets** : Scanner et anonymiser avant usage
3. **Model outputs** : Filtrer PII dans réponses LLM
4. **Logs et monitoring** : Redact données sensibles

**Outils DLP par cloud** : Voir [GLOSSARY.md](GLOSSARY.md)

### Guardrails et Content Filtering

**Guardrails GenAI** :
- **Input guardrails** : Bloquer prompts toxiques, jailbreak attempts
- **Output guardrails** : Filtrer contenu inapproprié, hallucinations
- **Topical guardrails** : Restreindre sujets autorisés (ex: pas de conseil médical)

**Services cloud-native** :
- **AWS** : Bedrock Guardrails
- **GCP** : Vertex AI safety filters
- **Azure** : Azure OpenAI Content Filters

**Configuration type** :
```
Content Filter Policy:
  - Hate speech: Block (threshold: medium)
  - Violence: Block (threshold: high)
  - Sexual content: Block (threshold: low)
  - Self-harm: Block (threshold: low)
  - PII detection: Block & log
  - Prompt injection patterns: Block
```

### Flux de données sécurisé (exemple RAG)

```
User Input
    ↓
[Input Validation] → Block malicious patterns
    ↓
[DLP Check] → Redact/Block PII
    ↓
[Guardrails - Input] → Block inappropriate content
    ↓
Vector DB Query (encrypted TLS)
    ↓
[RAG Context] → Retrieved from encrypted storage
    ↓
LLM Inference (authenticated API)
    ↓
[Guardrails - Output] → Filter unsafe content
    ↓
[DLP Check] → Redact PII in response
    ↓
[Output Validation] → Verify format & safety
    ↓
User Response (logged, encrypted at rest)
```

## 3. Détecter les menaces

### Monitoring de sécurité pour IA

**Métriques de sécurité à surveiller** :

| Métrique | Seuil d'alerte | Fréquence | Action |
|----------|---------------|-----------|--------|
| **Tentatives prompt injection** | > 10/heure | Temps réel | Bloquer IP, investigate |
| **Taux de blocage guardrails** | > 15% requests | Quotidien | Revue patterns, ajuster filtres |
| **Accès non autorisé modèles** | > 0 | Temps réel | Bloquer accès, alert security |
| **Anomalies dans outputs** | Drift > 20% | Hebdo | Investigate data poisoning |
| **Volume inference inhabituel** | > 3x baseline | Temps réel | Check DoS attack |
| **Fuite PII détectée** | > 0 | Temps réel | Block, investigate, incident P0 |
| **Échecs authentication** | > 5/minute | Temps réel | Rate limit, block IP |
| **Modifications non approuvées** | > 0 | Temps réel | Rollback, investigate |

### Logging et audit pour IA

**Logs à collecter (immutables)** :
- **Access logs** : Qui accède à quoi, quand
- **Inference logs** : Inputs/outputs (avec DLP redaction)
- **Training logs** : Datasets utilisés, hyperparamètres, résultats
- **Deployment logs** : Changements modèles, configurations
- **Security events** : Tentatives injection, blocages, violations

**Rétention recommandée** :
- Security events : 1 an minimum (conformité GDPR/CCPA)
- Inference logs : 90 jours (hot) + archivage 1 an (cold)
- Audit logs : 7 ans (réglementations sectorielles)

Voir [GLOSSARY.md](GLOSSARY.md) pour services de logging par cloud.

### Incident Response pour IA

**Playbooks spécifiques IA** :

**1. Prompt Injection Détecté** :
- [ ] Bloquer IP source
- [ ] Analyser pattern d'attaque
- [ ] Vérifier autres tentatives similaires
- [ ] Renforcer guardrails si nécessaire
- [ ] Documenter et communiquer

**2. Data Leak / PII Exposure** :
- [ ] Incident P0 - Escalade immédiate
- [ ] Identifier portée : Combien de records exposés
- [ ] Notification légal/privacy officer < 2h
- [ ] Bloquer endpoint si nécessaire
- [ ] Notification utilisateurs affectés (GDPR 72h)
- [ ] Root cause analysis et remédiation

**3. Model Drift Suspect (Poisoning)** :
- [ ] Rollback vers version précédente
- [ ] Investiguer datasets récents
- [ ] Vérifier provenance et intégrité
- [ ] Retrain si nécessaire avec données validées
- [ ] Renforcer validation pipeline

**4. DoS Attack sur Inference API** :
- [ ] Activer rate limiting agressif
- [ ] Bloquer IPs malveillantes
- [ ] Scale infrastructure si nécessaire
- [ ] Investigate origine attaque
- [ ] Renforcer WAF rules

### Outils de détection

**SIEM pour IA** :
- Centraliser logs multi-sources (application, cloud, modèles)
- Corrélation événements pour détection patterns
- Alerting automatique sur seuils
- Voir [GLOSSARY.md](GLOSSARY.md) pour outils SIEM

**Anomaly Detection** :
- Détection comportements inhabituels dans inference patterns
- Monitoring drift modèle (voir [Phase Manage](06-manage.md))
- Baseline comportement normal, alerte sur déviations

**Threat Intelligence** :
- Abonnement feeds de menaces IA (MITRE ATLAS, OWASP)
- Partage incidents secteur (ISAC)
- Veille CVE modèles et frameworks

### Pentesting et Red Teaming pour IA

**Tests de sécurité spécifiques IA** :
- **Prompt injection testing** : Tentatives jailbreak, manipulation
- **Model extraction** : Tentatives de vol via API
- **Data inference** : Tentatives de découvrir training data
- **Adversarial examples** : Inputs craftés pour tromper modèle

**Fréquence recommandée** :
- Pentest manuel : Annuel ou avant déploiement majeur
- Automated scanning : Continu (intégré CI/CD)
- Red team exercise : Semestriel (entreprises matures)

## Checklist Secure

### 🚀 Startup
- [ ] Activer chiffrement données (at rest + in transit)
- [ ] Configurer IAM least privilege
- [ ] Activer guardrails et content filtering
- [ ] Mettre en place DLP basique (PII detection)

### 🏢 Enterprise
- [ ] Implémenter architecture sécurité en profondeur (toutes couches)
- [ ] Déployer DLP avancé (inputs, outputs, logs)
- [ ] Configurer monitoring sécurité temps réel avec alertes
- [ ] Établir incident response playbooks pour IA
- [ ] Activer audit logging immutable (rétention conforme)
- [ ] Conduire pentesting et red teaming IA (annuel)
- [ ] Intégrer threat intelligence IA

## Prochaine étape

→ [Phase 6 : Manage](06-manage.md) - Gérer l'IA
