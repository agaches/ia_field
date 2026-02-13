# Glossary - Cloud Equivalences & AI Concepts

> Quick reference to maintain cloud agnosticism and clarify AI concepts

## Cloud Services - Equivalences

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

### AI Services (Pre-trained)

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Vision** | Rekognition | Vision AI | Computer Vision |
| **NLP** | Comprehend | Natural Language AI | Language Service |
| **Speech** | Transcribe/Polly | Speech-to-Text/Text-to-Speech | Speech Service |
| **OCR** | Textract | Document AI | Form Recognizer |
| **Translation** | Translate | Translation AI | Translator |

### Storage

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Object Storage** | S3 | Cloud Storage | Blob Storage |
| **Block Storage** | EBS | Persistent Disk | Managed Disks |
| **File Storage** | EFS | Filestore | Azure Files |
| **Data Lake** | S3 + Lake Formation | Cloud Storage + BigQuery | Data Lake Storage Gen2 |

### Data & Analytics

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

### Security & Identity

| Concept | AWS | GCP | Azure |
|---------|-----|-----|-------|
| **Identity & Access** | IAM | IAM | Azure AD / Entra ID |
| **Secrets Management** | Secrets Manager | Secret Manager | Key Vault |
| **Encryption** | KMS | Cloud KMS | Key Vault |
| **DLP** | Macie | DLP API | Purview DLP |
| **SIEM** | Security Hub | Chronicle | Sentinel |
| **Compliance** | Config/Audit Manager | Security Command Center | Defender for Cloud |

### Governance

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

## AI Concepts - Acronyms

### Techniques & Approaches

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| **RAG** | Retrieval-Augmented Generation | Enriching LLM context with external data |
| **Fine-tuning** | Model Fine-tuning | Adapting a pre-trained model on specific data |
| **Prompt Engineering** | - | Optimizing prompts for better results |
| **Few-shot** | Few-shot Learning | Learning with few examples |
| **Zero-shot** | Zero-shot Learning | Inference without training examples |
| **Transfer Learning** | - | Reusing pre-trained models |

### AI Operations

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| **MLOps** | Machine Learning Operations | Operations for traditional ML |
| **GenAIOps** | Generative AI Operations | GenAI-specific operations (prompts, tokens) |
| **LLMOps** | Large Language Model Operations | Operations for LLMs |
| **DataOps** | Data Operations | Operations for data pipelines |
| **ModelOps** | Model Operations | Model lifecycle management |
| **FinOps** | Financial Operations | Cloud cost optimization |

### Frameworks & Standards

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| **NIST AI RMF** | NIST AI Risk Management Framework | AI risk management framework |
| **MITRE ATLAS** | Adversarial Threat Landscape for AI Systems | AI attack matrix |
| **OWASP** | Open Web Application Security Project | Application security standards |
| **GDPR** | General Data Protection Regulation | European data protection regulation |
| **CCPA** | California Consumer Privacy Act | California privacy law |
| **EU AI Act** | EU Artificial Intelligence Act | European AI regulation |

### Architecture & Design

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| **PoC** | Proof of Concept | Proof of concept |
| **MVP** | Minimum Viable Product | Minimum viable product |
| **SaaS** | Software as a Service | Software as a service |
| **PaaS** | Platform as a Service | Platform as a service |
| **IaaS** | Infrastructure as a Service | Infrastructure as a service |
| **API** | Application Programming Interface | Programming interface |
| **SDK** | Software Development Kit | Software development kit |
| **CI/CD** | Continuous Integration/Continuous Deployment | Continuous integration and deployment |

### Quality & Testing

| Acronym | Full Term | Description |
|---------|-----------|-------------|
| **DLP** | Data Loss Prevention | Data loss prevention |
| **SIEM** | Security Information and Event Management | Security event management |
| **SOAR** | Security Orchestration, Automation and Response | Security orchestration |
| **ETL** | Extract, Transform, Load | Extract, transform, load |
| **ELT** | Extract, Load, Transform | Extract, load, transform |

## Responsible AI Principles

Quick reference - See [README.md](README.md) for complete details.

1. **Fairness**: Treat all users equitably
2. **Reliability and Safety**: Safe and reliable operation
3. **Privacy and Security**: Respect for privacy
4. **Inclusiveness**: Accessible to all
5. **Transparency**: Understandable and explainable
6. **Accountability**: Clear accountability

## AI Consumption Models

| Model | Control | Customization | Complexity | Relative Cost |
|-------|---------|---------------|------------|---------------|
| **SaaS** | Low | Low | Low | $ |
| **PaaS** | Medium | Medium | Medium | $$ |
| **IaaS** | High | High | High | $$$ |

## AI Maturity Levels

See [SKILLS.md](SKILLS.md) for the detailed maturity grid and [TRAINING.md](TRAINING.md) for training paths.

## AI Roles

| Role | Main Responsibilities |
|------|----------------------|
| **ML Engineer** | Model development and deployment |
| **Data Scientist** | Analysis and modeling |
| **MLOps Engineer** | Infrastructure and operations |
| **AI Ethics Specialist** | Compliance and accountability |
| **Data Engineer** | Data pipelines and quality |
| **AI Architect** | AI systems architecture and design |

## Using This Glossary

- **Equivalence tables**: Reference instead of repeating triplets
- **Acronyms**: Explain once, then use the acronym
- **Concepts**: Point to this glossary for standard definitions
- **Principles**: Reference README for the 6 Responsible AI principles
