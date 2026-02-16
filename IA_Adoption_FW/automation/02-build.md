# Phase 2: Build

> **Goal**: Production infrastructure, governance framework, security controls
> **Time**: 6-8 weeks
> **Output**: Production-ready AI landing zone + Governance policies + Security validated

---

## 1. Deploy AI Landing Zone

### Infrastructure Components

📋 **Tool**: [AI Landing Zone Checklist](../templates/automation/ai-landing-zone-checklist.md)
**Core infrastructure**:
- [ ] **Compute**: Kubernetes cluster or serverless platform (AWS EKS, GCP GKE, Azure AKS)
- [ ] **Networking**: VPC, subnets, security groups, load balancers
- [ ] **Storage**: Object storage (S3, GCS, Azure Blob), databases
- [ ] **Secrets**: Secrets manager (AWS Secrets Manager, Vault)
- [ ] **Monitoring**: Observability stack (Datadog, Grafana, CloudWatch)
- [ ] **CI/CD**: Deployment pipelines (GitHub Actions, GitLab CI, Jenkins)

**AI-specific infrastructure**:
- [ ] **Model registry**: MLflow, W&B, Azure ML Registry
- [ ] **Vector database**: Pinecone, Weaviate, pgvector, Qdrant
- [ ] **Feature store**: Feast, Tecton, AWS SageMaker Feature Store
- [ ] **Experiment tracking**: MLflow, W&B, Comet
- [ ] **Data versioning**: DVC, Pachyderm, lakeFS

**Deployment pattern** (example: Kubernetes):
```yaml
# Namespace isolation
apiVersion: v1
kind: Namespace
metadata:
  name: ai-production

---
# Model serving
apiVersion: apps/v1
kind: Deployment
metadata:
  name: llm-api
  namespace: ai-production
spec:
  replicas: 3  # HA
  template:
    spec:
      containers:
      - name: llm-service
        image: company/llm-api:v1.2.3
        resources:
          limits:
            memory: "8Gi"
            cpu: "4"
        env:
        - name: API_KEY
          valueFrom:
            secretKeyRef:
              name: llm-secrets
              key: api-key
```

---

## 2. Implement AI Governance Framework

### NIST AI Risk Management Framework

📋 **Tool**: [NIST AI RMF Implementation Guide](../templates/automation/nist-ai-rmf-implementation.md)
**Core functions**:

**1. GOVERN** - Establish policies, roles, responsibilities
- [ ] AI governance policies documented
- [ ] AI Center of Excellence (CoE) established
- [ ] Roles and responsibilities assigned (AI Ethics Lead, ML Engineers, Legal, Security)
- [ ] Decision-making processes defined

**2. MAP** - Understand AI risks in context
- [ ] AI system use cases documented
- [ ] Risks assessed (bias, privacy, security, safety)
- [ ] Stakeholders identified (users, affected parties, regulators)
- [ ] Legal/regulatory requirements mapped

**3. MEASURE** - Analyze and track risks
- [ ] Bias/fairness testing implemented
- [ ] Performance metrics tracked
- [ ] Security testing automated
- [ ] Risk scoring methodology established

**4. MANAGE** - Prioritize and respond to risks
- [ ] Risk mitigation plans documented
- [ ] Incident response procedures defined
- [ ] Regular audits scheduled (quarterly minimum)
- [ ] Continuous monitoring active

---

### AI Center of Excellence (CoE)

**Purpose**: Centralized AI governance, standards, and best practices.

**Composition** (recommended):
- **AI Ethics Lead**: Ensure responsible AI, bias prevention
- **Senior ML Engineers** (2-3): Technical architecture, model review
- **Legal/Compliance**: Regulatory requirements, policy enforcement
- **Security Engineer**: AI security, OWASP LLM Top 10, DLP
- **Product/Business**: Use case validation, ROI tracking
- **Executive Sponsor**: Budget authority, organizational priority

**Responsibilities**:
- Model approval (3-gate process: Concept → Development → Production)
- Policy creation and enforcement
- Risk assessment and audits
- Training and knowledge sharing
- Regulatory monitoring and compliance

---

### AI Governance Policies

📋 **Tool**: [AI Governance Policy Template](../templates/automation/ai-governance-policy.md)
**Essential policies**:

**1. Acceptable AI Use Policy**
- Authorized use cases (approved by CoE)
- Prohibited use cases (discrimination, surveillance without consent, etc.)
- Data restrictions (no PII in training without anonymization)
- Human oversight requirements for high-risk decisions

**2. Model Development & Approval Policy**
- **3-Gate approval process**:
  - **Gate 1 (Concept)**: Use case, data, risks, business case → Go/No-Go
  - **Gate 2 (Development)**: Model performance, bias testing, security review → Go/No-Go
  - **Gate 3 (Production)**: Final validation, monitoring, DR/BC → Go/No-Go
- Model documentation requirements (model cards)
- Performance thresholds (accuracy, fairness, latency)
- Security requirements (OWASP LLM Top 10 compliance)

**3. Data Governance Policy**
- Data classification (public, internal, confidential, restricted)
- Retention policies (GDPR compliance: right to be forgotten)
- Access controls (RBAC, least privilege)
- Data lineage and provenance tracking
- Anonymization requirements for training data

**4. Incident Response Policy**
- Severity definitions (Critical, High, Medium, Low)
- Response timelines (Critical: <15 min, High: <1h, Medium: <4h, Low: <24h)
- Escalation procedures
- Communication templates (internal, customer, regulatory)
- Post-incident review requirements

---

## 3. Implement Security Controls

📋 **Reference**: [OWASP LLM Top 10](../templates/shared/owasp-llm-top10.md) - Automation section

### Defense-in-Depth Strategy

**Layer 1: Perimeter Security**
- [ ] **WAF** (Web Application Firewall): Block malicious requests, rate limiting
- [ ] **API Gateway**: Authentication (OAuth 2.0, API keys), authorization (RBAC)
- [ ] **DDoS protection**: CloudFlare, AWS Shield, Azure DDoS Protection
- [ ] **TLS/SSL**: Encrypt all traffic (TLS 1.3+)

**Layer 2: Application Security**
- [ ] **Input validation**: Prompt injection prevention (sanitize, escape, validate)
- [ ] **Output validation**: DLP (Data Loss Prevention) - scan for secrets, PII
- [ ] **Guardrails**: Content moderation (Llama Guard, OpenAI Moderation API)
- [ ] **Rate limiting**: Per-user quotas, cost controls
- [ ] **Secrets management**: Never hardcode keys, use secrets manager

**Layer 3: Data Security**
- [ ] **Encryption at rest**: Database, object storage, backups (AES-256)
- [ ] **Encryption in transit**: TLS 1.3+ for all communications
- [ ] **Access controls**: RBAC, least privilege, audit logs
- [ ] **Data anonymization**: PII removed/masked before training
- [ ] **Zero data retention**: LLM provider doesn't store prompts/outputs (configure)

**Layer 4: Model Security**
- [ ] **Model signing**: Verify model integrity (checksums, signatures)
- [ ] **Dependency scanning**: SBOM, vulnerability scanning (Snyk, Dependabot)
- [ ] **Model watermarking**: Track model outputs if leaked
- [ ] **Adversarial testing**: Red team exercises, prompt injection tests

**Layer 5: Monitoring & Response**
- [ ] **Anomaly detection**: Unusual prompts, API usage spikes
- [ ] **Security alerts**: Real-time notifications (PagerDuty, Slack)
- [ ] **Audit logs**: All access logged and retained (compliance)
- [ ] **Incident response**: Automated runbooks, on-call rotation

---

### OWASP LLM Top 10 Compliance

| Risk | Mitigation | Status |
|------|------------|--------|
| **LLM01: Prompt Injection** | Input validation, prompt firewall, role separation | ⬜ |
| **LLM02: Insecure Output Handling** | Output encoding, DLP, secrets detection | ⬜ |
| **LLM03: Training Data Poisoning** | Data provenance, quality checks | ⬜ |
| **LLM04: Model DoS** | Rate limiting, quotas, timeouts | ⬜ |
| **LLM05: Supply Chain** | SBOM, dependency scanning, model signing | ⬜ |
| **LLM06: Sensitive Information Disclosure** | DLP, zero retention, access controls | ⬜ |
| **LLM07: Insecure Plugin Design** | Plugin sandboxing, least privilege | ⬜ |
| **LLM08: Excessive Agency** | Approval workflows, action limits | ⬜ |
| **LLM09: Overreliance** | Validation gates, human oversight | ⬜ |
| **LLM10: Model Theft** | API rate limits, watermarking | ⬜ |

**Validation**: All 10 risks must be addressed with documented mitigations before production deployment.

---

## 4. Establish Compliance Framework

### EU AI Act Compliance (if applicable)

📋 **Tool**: [EU AI Act Compliance Checklist](../templates/automation/eu-ai-act-compliance.md)
**High-risk AI systems** (require strict compliance):
- Biometric identification (facial recognition)
- Critical infrastructure (healthcare, transportation)
- Education/employment decisions (hiring, admissions)
- Law enforcement (predictive policing)
- Credit scoring and insurance

**Requirements for high-risk systems**:
- [ ] Risk management framework (NIST AI RMF compliant)
- [ ] Data governance (quality, lineage, bias prevention)
- [ ] Technical documentation (model cards, architecture)
- [ ] Transparency (user disclosure: "This is AI")
- [ ] Human oversight (human-in-the-loop for critical decisions)
- [ ] Accuracy and robustness testing
- [ ] Logging and auditability (all decisions logged)
- [ ] Conformity assessment (third-party audit)

---

### GDPR Compliance

**Key requirements**:
- [ ] **Data minimization**: Collect only necessary data
- [ ] **Purpose limitation**: Use data only for stated purpose
- [ ] **Right to explanation**: AI decisions must be explainable
- [ ] **Right to be forgotten**: Delete user data on request
- [ ] **Data portability**: Export user data on request
- [ ] **Breach notification**: Notify within 72 hours
- [ ] **Data Protection Impact Assessment (DPIA)**: Required for high-risk AI

---

### Sector-Specific Compliance

Implement the sector-specific requirements identified in [Phase 1: Prepare](01-prepare.md#sector-specific-regulations) (Healthcare/HIPAA, Finance/SOX/PCI-DSS, Insurance).

- [ ] All sector-specific controls implemented
- [ ] Compliance validated with legal/compliance team
- [ ] Audit procedures documented

---

## 5. Implement MLOps Platform

📋 **Tool**: [MLOps Maturity Assessment](../templates/automation/mlops-maturity-assessment.md)
**MLOps maturity levels**:
- **Level 0**: Manual (scripts, notebooks) - Not production-ready ❌
- **Level 1**: Automated training - CI/CD for model training ⚠️
- **Level 2**: Automated deployment - CI/CD for model serving ✅
- **Level 3**: Full MLOps - Monitoring, retraining, A/B testing ✅ (target)

---

### MLOps Components

**1. Model Training Pipeline**
- [ ] Automated data ingestion (ETL/ELT)
- [ ] Feature engineering (reproducible, versioned)
- [ ] Model training (hyperparameter tuning, experiment tracking)
- [ ] Model evaluation (automated testing, bias detection)
- [ ] Model registration (versioning, metadata, lineage)

**2. Model Deployment Pipeline**
- [ ] Model packaging (containerization: Docker)
- [ ] Model serving (REST API, gRPC, batch)
- [ ] Canary deployment (gradual rollout, A/B testing)
- [ ] Rollback capability (instant revert to previous version)
- [ ] Blue-green deployment (zero-downtime updates)

**3. Model Monitoring**
- [ ] Performance metrics (latency, throughput, errors)
- [ ] Model drift detection (data drift, concept drift)
- [ ] Data quality monitoring (outliers, missing values)
- [ ] Bias monitoring (fairness metrics over time)
- [ ] Cost tracking (API costs, infrastructure costs)

**4. Model Retraining**
- [ ] Drift detection triggers retraining
- [ ] Automated retraining pipeline
- [ ] Human approval gate for production deployment
- [ ] Continuous improvement loop

---

### Example MLOps Stack

| Component | Tool Options |
|-----------|-------------|
| **Orchestration** | Airflow, Prefect, Dagster, Kubeflow |
| **Experiment Tracking** | MLflow, Weights & Biases, Comet |
| **Feature Store** | Feast, Tecton, AWS SageMaker Feature Store |
| **Model Registry** | MLflow, W&B, Azure ML Registry |
| **Model Serving** | KServe, Seldon Core, AWS SageMaker, BentoML |
| **Monitoring** | Evidently AI, WhyLabs, Arize, Fiddler |
| **Data Versioning** | DVC, Pachyderm, lakeFS |

---

## 6. Setup Monitoring & Observability

### Monitoring Stack

**Infrastructure monitoring**:
- [ ] CPU, memory, disk, network metrics
- [ ] Container/pod health (Kubernetes)
- [ ] Resource utilization and scaling

**Application monitoring**:
- [ ] Request rate, latency (P50, P95, P99)
- [ ] Error rate and types
- [ ] Throughput and concurrency

**AI-specific monitoring**:
- [ ] Model inference latency
- [ ] Model quality metrics (accuracy, relevance)
- [ ] Hallucination rate (for LLMs)
- [ ] User satisfaction scores
- [ ] Cost per request (LLM API costs)

**Security monitoring**:
- [ ] Authentication failures
- [ ] Unusual API usage patterns (anomaly detection)
- [ ] DLP alerts (sensitive data detected)
- [ ] OWASP LLM Top 10 violations

---

### Alerting Rules

📋 **Tool**: [Production AI Alerting Runbook](../templates/automation/production-alerting-runbook.md)
**Critical alerts** (immediate response, <15 min):
- 🚨 Service down (availability <99%)
- 🚨 P99 latency >10s (SLA breach)
- 🚨 Error rate >1% (quality degradation)
- 🚨 DLP alert (PII/secrets exposed)
- 🚨 Cost spike >2x normal (runaway costs)

**Warning alerts** (respond within 1-4 hours):
- ⚠️ Model drift detected (performance degradation)
- ⚠️ Unusual traffic pattern (potential attack)
- ⚠️ Disk space >80% (capacity planning)
- ⚠️ API rate limit approaching (scale up)

---

## 7. Prepare Disaster Recovery

### Backup & Recovery

**Data backups**:
- [ ] Automated daily backups (databases, object storage)
- [ ] Retention policy (30 days minimum, 7 years for compliance)
- [ ] Backup testing (quarterly restore tests)
- [ ] Cross-region replication (for DR)

**Model versioning**:
- [ ] All models versioned in registry
- [ ] Ability to roll back to any previous version (<5 min)
- [ ] Model artifacts backed up (weights, configs, code)

**Infrastructure as Code (IaC)**:
- [ ] All infrastructure in code (Terraform, CloudFormation)
- [ ] Version controlled (Git)
- [ ] Automated deployment (can rebuild from scratch)

---

### Business Continuity Plan

📋 **Tool**: [AI System DR/BC Plan](../templates/automation/disaster-recovery-plan.md)
**Recovery objectives**:
- **RTO** (Recovery Time Objective): Maximum downtime tolerated
  - Critical systems: <15 min
  - High priority: <1 hour
  - Medium priority: <4 hours
- **RPO** (Recovery Point Objective): Maximum data loss tolerated
  - Financial systems: 0 (zero data loss)
  - User-facing: <1 hour
  - Analytics: <24 hours

**Failover scenarios**:
- [ ] Primary region failure → automatic failover to secondary region
- [ ] Model serving failure → rollback to previous version
- [ ] Data corruption → restore from backup
- [ ] Security breach → isolate, investigate, remediate

**Testing**:
- [ ] DR drill quarterly (simulate failures)
- [ ] Validate RTO/RPO met
- [ ] Update runbooks based on learnings

---

## Phase 2 Checklist

Complete before moving to Phase 3:

### Infrastructure ✅
- [ ] AI landing zone deployed and tested
- [ ] MLOps platform operational
- [ ] Monitoring and observability active
- [ ] CI/CD pipelines functional

### Governance ✅
- [ ] NIST AI RMF implemented
- [ ] AI CoE established and staffed
- [ ] Governance policies documented and approved
- [ ] 3-gate approval process defined

### Security ✅
- [ ] Defense-in-depth controls deployed
- [ ] OWASP LLM Top 10 mitigations implemented
- [ ] DLP and secrets detection active
- [ ] Security testing automated

### Compliance ✅
- [ ] Regulatory requirements addressed (EU AI Act, GDPR, etc.)
- [ ] Compliance framework documented
- [ ] Audit procedures defined
- [ ] Legal review completed

### Operations ✅
- [ ] DR/BC plan documented and tested
- [ ] Alerting rules configured
- [ ] On-call rotation established
- [ ] Runbooks created for common incidents

**Estimated time**: 6-8 weeks total

---

**Next**: [Phase 3: Run](03-run.md) - Production operations and continuous improvement
