# Glossaire - Équivalences Cloud & Concepts IA

> Référence rapide pour maintenir l'agnosticisme cloud et clarifier les concepts IA

## Services Cloud - Équivalences

### Compute

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **VMs** | EC2 | Compute Engine | Virtual Machines |
| **Serverless Functions** | Lambda | Cloud Functions | Azure Functions |
| **Containers** | ECS/EKS | GKE | AKS |
| **GPU Instances** | EC2 P/G instances | A2/A3 instances | NC/ND series |

### ML & AI Platforms

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **ML Platform** | SageMaker | Vertex AI | Azure Machine Learning |
| **GenAI Platform** | Bedrock | Vertex AI GenAI | Azure AI Foundry |
| **OpenAI API** | - | - | Azure OpenAI |
| **AutoML** | SageMaker Autopilot | Vertex AI AutoML | Azure AutoML |
| **Model Registry** | SageMaker Model Registry | Vertex AI Model Registry | Azure ML Model Registry |
| **Low-code AI** | - | - | Copilot Studio |

### AI Services (Pré-entraînés)

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Vision** | Rekognition | Vision AI | Computer Vision |
| **NLP** | Comprehend | Natural Language AI | Language Service |
| **Speech** | Transcribe/Polly | Speech-to-Text/Text-to-Speech | Speech Service |
| **OCR** | Textract | Document AI | Form Recognizer |
| **Translation** | Translate | Translation AI | Translator |

### Stockage

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Object Storage** | S3 | Cloud Storage | Blob Storage |
| **Block Storage** | EBS | Persistent Disk | Managed Disks |
| **File Storage** | EFS | Filestore | Azure Files |
| **Data Lake** | S3 + Lake Formation | Cloud Storage + BigQuery | Data Lake Storage Gen2 |

### Données & Analytics

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Data Warehouse** | Redshift | BigQuery | Synapse Analytics |
| **ETL/ELT** | Glue | Dataflow | Data Factory |
| **Streaming** | Kinesis | Dataflow | Stream Analytics |
| **Data Catalog** | Glue Catalog | Data Catalog | Purview |
| **Data Quality** | Glue Data Quality | Data Quality | Data Quality (Purview) |

### Networking

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Virtual Network** | VPC | VPC | Virtual Network (VNet) |
| **Load Balancer** | ELB/ALB | Cloud Load Balancing | Load Balancer |
| **CDN** | CloudFront | Cloud CDN | Front Door |
| **DNS** | Route 53 | Cloud DNS | DNS |
| **DDoS Protection** | Shield | Cloud Armor | DDoS Protection |
| **Private Connectivity** | Direct Connect | Cloud Interconnect | ExpressRoute |
| **VPN** | Site-to-Site VPN | Cloud VPN | VPN Gateway |
| **Bastion** | EC2 Instance Connect | Identity-Aware Proxy | Azure Bastion |

### Sécurité & Identité

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Identity & Access** | IAM | IAM | Azure AD / Entra ID |
| **Secrets Management** | Secrets Manager | Secret Manager | Key Vault |
| **Encryption** | KMS | Cloud KMS | Key Vault |
| **DLP** | Macie | DLP API | Purview DLP |
| **SIEM** | Security Hub | Chronicle | Sentinel |
| **Compliance** | Config/Audit Manager | Security Command Center | Defender for Cloud |

### Gouvernance

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Organization** | Organizations | Organization | Management Groups |
| **Policies** | SCPs + IAM Policies | Organization Policy | Azure Policy |
| **Cost Management** | Cost Explorer | Cloud Billing | Cost Management |
| **Tagging** | Tags | Labels | Tags |
| **Landing Zone** | Control Tower | Setup Checklist | Landing Zones |

### Monitoring & Logging

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Logging** | CloudWatch Logs | Cloud Logging | Monitor Logs |
| **Metrics** | CloudWatch Metrics | Cloud Monitoring | Monitor Metrics |
| **Tracing** | X-Ray | Cloud Trace | Application Insights |
| **Alerting** | CloudWatch Alarms | Cloud Monitoring Alerts | Monitor Alerts |
| **Dashboards** | CloudWatch Dashboards | Cloud Monitoring Dashboards | Monitor Dashboards |

## Concepts IA - Acronymes

### Techniques & Approches

| Acronyme | Terme complet | Description |
|----------|---------------|-------------|
| **RAG** | Retrieval-Augmented Generation | Enrichissement du contexte LLM avec données externes |
| **Fine-tuning** | Model Fine-tuning | Ajustement d'un modèle pré-entraîné sur données spécifiques |
| **Prompt Engineering** | - | Optimisation des prompts pour meilleurs résultats |
| **Few-shot** | Few-shot Learning | Apprentissage avec peu d'exemples |
| **Zero-shot** | Zero-shot Learning | Inférence sans exemples d'entraînement |
| **Transfer Learning** | - | Réutilisation de modèles pré-entraînés |

### Opérations IA

| Acronyme | Terme complet | Description |
|----------|---------------|-------------|
| **MLOps** | Machine Learning Operations | Opérations pour ML traditionnel |
| **GenAIOps** | Generative AI Operations | Opérations spécifiques GenAI (prompts, tokens) |
| **LLMOps** | Large Language Model Operations | Opérations pour LLMs |
| **DataOps** | Data Operations | Opérations pour pipelines de données |
| **ModelOps** | Model Operations | Gestion cycle de vie des modèles |
| **FinOps** | Financial Operations | Optimisation coûts cloud |

### Frameworks & Standards

| Acronyme | Terme complet | Description |
|----------|---------------|-------------|
| **NIST AI RMF** | NIST AI Risk Management Framework | Framework gestion risques IA |
| **MITRE ATLAS** | Adversarial Threat Landscape for AI Systems | Matrice attaques IA |
| **OWASP** | Open Web Application Security Project | Standards sécurité applications |
| **GDPR** | General Data Protection Regulation | Règlement européen protection données |
| **CCPA** | California Consumer Privacy Act | Loi californienne confidentialité |
| **EU AI Act** | EU Artificial Intelligence Act | Règlement européen IA |

### Architecture & Design

| Acronyme | Terme complet | Description |
|----------|---------------|-------------|
| **PoC** | Proof of Concept | Preuve de concept |
| **MVP** | Minimum Viable Product | Produit minimum viable |
| **SaaS** | Software as a Service | Logiciel en tant que service |
| **PaaS** | Platform as a Service | Plateforme en tant que service |
| **IaaS** | Infrastructure as a Service | Infrastructure en tant que service |
| **API** | Application Programming Interface | Interface de programmation |
| **SDK** | Software Development Kit | Kit de développement logiciel |
| **CI/CD** | Continuous Integration/Continuous Deployment | Intégration et déploiement continus |

### Qualité & Tests

| Acronyme | Terme complet | Description |
|----------|---------------|-------------|
| **DLP** | Data Loss Prevention | Prévention perte de données |
| **SIEM** | Security Information and Event Management | Gestion événements sécurité |
| **SOAR** | Security Orchestration, Automation and Response | Orchestration sécurité |
| **ETL** | Extract, Transform, Load | Extraction, transformation, chargement |
| **ELT** | Extract, Load, Transform | Extraction, chargement, transformation |

## Principes IA Responsable

Référence rapide - Voir [README.md](README.md) pour détails complets.

1. **Équité** : Traiter tous les utilisateurs de manière équitable
2. **Fiabilité et sécurité** : Fonctionnement sûr et fiable
3. **Confidentialité et sécurité** : Respect de la vie privée
4. **Inclusivité** : Accessible à tous
5. **Transparence** : Compréhensible et explicable
6. **Responsabilité** : Responsabilité claire

## Modèles de consommation IA

| Modèle | Contrôle | Personnalisation | Complexité | Coût relatif |
|--------|----------|------------------|------------|--------------|
| **SaaS** | Faible | Faible | Faible | $ |
| **PaaS** | Moyen | Moyen | Moyen | $$ |
| **IaaS** | Élevé | Élevé | Élevé | $$$ |

## Niveaux de maturité IA

Voir [SKILLS.md](SKILLS.md) pour la grille de maturité détaillée et [TRAINING.md](TRAINING.md) pour les parcours de formation.

## Rôles IA

| Rôle | Responsabilités principales |
|------|----------------------------|
| **ML Engineer** | Développement et déploiement de modèles |
| **Data Scientist** | Analyse et modélisation |
| **MLOps Engineer** | Infrastructure et opérations |
| **AI Ethics Specialist** | Conformité et responsabilité |
| **Data Engineer** | Pipelines et qualité des données |
| **AI Architect** | Architecture et design systèmes IA |

## Usage de ce glossaire

- **Tableaux d'équivalences** : Référencer au lieu de répéter les triplets
- **Acronymes** : Expliquer une fois, puis utiliser l'acronyme
- **Concepts** : Pointer vers ce glossaire pour définitions standards
- **Principes** : Référencer README pour les 6 principes IA responsable
