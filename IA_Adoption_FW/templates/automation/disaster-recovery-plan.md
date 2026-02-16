# Disaster Recovery Plan for AI Systems

> **Purpose**: DR/BC plan with RTO/RPO for production AI systems
> **Used in**: Automation Phase 2 (Build) - Prepare for failures and disasters
> **Update frequency**: Review quarterly, test semi-annually, update after incidents

---

## What is a Disaster Recovery Plan?

A Disaster Recovery (DR) plan defines how to recover AI systems after a disaster: data loss, infrastructure failure, cyber attack, or regional outage. Business Continuity (BC) ensures critical operations continue during disruptions.

**Key metrics**:
- **RTO** (Recovery Time Objective): How fast must system be restored? (e.g., 4 hours)
- **RPO** (Recovery Point Objective): How much data loss is acceptable? (e.g., 1 hour)

**DR tiers**:
- **Tier 1 (Critical)**: RTO <1 hour, RPO <15 min (multi-region active-active)
- **Tier 2 (High)**: RTO <4 hours, RPO <1 hour (multi-region active-passive)
- **Tier 3 (Medium)**: RTO <24 hours, RPO <24 hours (backups, manual failover)
- **Tier 4 (Low)**: RTO <1 week, RPO <1 week (rebuild from documentation)

---

## DR Planning Checklist

### 1. Business Impact Analysis

**Define criticality**:
- [ ] Business impact of system downtime assessed (revenue loss, reputation, SLA penalties)
- [ ] RTO defined (acceptable downtime: 1h, 4h, 24h, 1 week)
- [ ] RPO defined (acceptable data loss: 0, 15min, 1h, 24h)
- [ ] DR tier assigned (1-4 based on criticality)

**Example**:
- **System**: Customer support chatbot
- **Business impact**: Medium (customers can call human agents as fallback)
- **RTO**: 4 hours (Tier 2)
- **RPO**: 1 hour (can tolerate recent chat logs loss)

---

### 2. Backup Strategy

**What to backup**:
- [ ] **Models**: All production model artifacts (weights, configs, preprocessing pipelines)
- [ ] **Data**: Training data, feature data, embeddings (if feasible)
- [ ] **Code**: All application code, infrastructure code (IaC)
- [ ] **Configuration**: Environment variables, secrets (encrypted), feature flags
- [ ] **Logs**: Application logs, audit logs, model predictions (for compliance)

**Backup frequency**:
- [ ] **Critical data** (models, configs): Continuous replication + daily backups
- [ ] **Important data** (logs, training data): Daily backups
- [ ] **Code**: Git-based (automatic versioning)

**Backup locations**:
- [ ] **Primary region**: e.g., AWS us-east-1
- [ ] **Secondary region**: e.g., AWS us-west-2 (different availability zone or region)
- [ ] **Offline backup**: Separate cloud account or on-premises (ransomware protection)

**Backup validation**:
- [ ] Automated backup verification (weekly integrity checks)
- [ ] Restore testing (quarterly): Actually restore from backup and validate

---

### 3. Infrastructure Redundancy

**Compute redundancy**:
- [ ] Multi-AZ deployment (minimum: 2 availability zones)
- [ ] Auto-scaling configured (scale up on failure of instances)
- [ ] Load balancer with health checks (route traffic away from failed instances)
- [ ] Multi-region deployment (Tier 1-2 only)

**Data redundancy**:
- [ ] Database: Multi-AZ replication (RDS multi-AZ, PostgreSQL streaming replication)
- [ ] Object storage: Cross-region replication (S3 CRR, GCS multi-region)
- [ ] Vector database: Replication configured (pgvector read replicas, or managed solution)

**Network redundancy**:
- [ ] Multiple internet gateways or NAT gateways
- [ ] DNS failover configured (Route53 health checks, CloudFlare failover)

---

### 4. Failover Procedures

**Automated failover** (Tier 1-2):
- [ ] Health checks configured (API /health endpoint)
- [ ] Automatic DNS failover (Route53, CloudFlare)
- [ ] Auto-scaling replaces failed instances
- [ ] Database automatic failover (RDS multi-AZ, Aurora)

**Manual failover** (Tier 3-4):
- [ ] Failover runbook documented (step-by-step procedure)
- [ ] Decision tree: When to failover? (criteria: RTO exceeded, primary region down, data corruption)
- [ ] Responsible team assigned (who initiates failover)
- [ ] Communication plan (notify stakeholders, users)

**Failover testing**:
- [ ] Disaster recovery drills scheduled (semi-annually minimum)
- [ ] Failover tested in non-production environment first
- [ ] Post-drill review and runbook updates

---

### 5. Disaster Scenarios

**Scenario 1: Regional outage** (e.g., AWS us-east-1 down):
- [ ] Detection: Health checks fail, monitoring alerts fire
- [ ] Response: Failover to secondary region (us-west-2)
- [ ] RTO: <4 hours (manual DNS update + warm standby spin-up)
- [ ] RPO: <1 hour (last backup sync)

**Scenario 2: Data corruption** (e.g., bad model deployed):
- [ ] Detection: Model accuracy drops to <50%, user complaints
- [ ] Response: Rollback to previous model version
- [ ] RTO: <30 minutes (automated rollback)
- [ ] RPO: 0 (model versioning, no data loss)

**Scenario 3: Ransomware attack**:
- [ ] Detection: Files encrypted, ransom note appears
- [ ] Response: Isolate infected systems, restore from offline backups
- [ ] RTO: <24 hours (restore from immutable backups)
- [ ] RPO: <24 hours (daily backups)

**Scenario 4: Accidental deletion** (e.g., engineer deletes production database):
- [ ] Detection: Application errors, database connection failures
- [ ] Response: Restore from latest backup
- [ ] RTO: <2 hours (restore from snapshot)
- [ ] RPO: <1 hour (backup frequency)

**Scenario 5: Dependency failure** (e.g., OpenAI API down):
- [ ] Detection: High error rate from LLM API calls
- [ ] Response: Switch to fallback mode (cached responses, alternative LLM, or manual mode)
- [ ] RTO: <15 minutes (automatic fallback)
- [ ] RPO: 0 (no data loss, service degradation only)

---

## DR Plan Template

```markdown
# Disaster Recovery Plan - [AI System Name]

**System**: [Name]
**Owner**: [Team/Person]
**DR Tier**: [1 / 2 / 3 / 4]
**RTO**: [Time]
**RPO**: [Time]
**Last Updated**: [YYYY-MM-DD]
**Last Tested**: [YYYY-MM-DD]

---

## 1. System Overview

**Description**: [What the AI system does]
**Criticality**: [Critical / High / Medium / Low]
**Business Impact**: [Impact of downtime: revenue, reputation, compliance]

**Architecture**:
- Primary region: [e.g., AWS us-east-1]
- Secondary region: [e.g., AWS us-west-2]
- Dependencies: [Databases, APIs, third-party services]

---

## 2. Backup Strategy

**Models**:
- Location: [S3 bucket, Azure Blob, etc.]
- Frequency: [Continuous / Daily / Weekly]
- Retention: [30 days / 90 days / 1 year]
- Replication: [Cross-region replication enabled]

**Data**:
- Training data: [Location, frequency, retention]
- Application data: [Location, frequency, retention]
- Logs: [Location, frequency, retention]

**Code**:
- Repository: [GitHub URL]
- Branching: [main, staging, production branches]
- Backup: [Git-based, automatic versioning]

**Configuration**:
- Secrets: [AWS Secrets Manager, encrypted backups]
- Environment variables: [Stored in IaC, version controlled]

**Validation**:
- Backup integrity checks: [Weekly automated]
- Restore testing: [Quarterly manual test]

---

## 3. Recovery Procedures

### Scenario 1: Regional Outage

**Detection**:
- [How will you know? Monitoring alerts, health checks]

**Response**:
1. [Step 1: Verify primary region is down, not just transient issue]
2. [Step 2: Initiate failover to secondary region]
3. [Step 3: Update DNS to point to secondary region]
4. [Step 4: Verify system functional in secondary region]
5. [Step 5: Communicate to stakeholders]

**RTO**: [Time]
**RPO**: [Time]

---

### Scenario 2: Data Corruption

**Detection**: [How detected]
**Response**: [Steps to rollback/restore]
**RTO**: [Time]
**RPO**: [Time]

---

### Scenario 3: Ransomware Attack

**Detection**: [How detected]
**Response**: [Isolation, restore from offline backups]
**RTO**: [Time]
**RPO**: [Time]

---

### Scenario 4: Accidental Deletion

**Detection**: [How detected]
**Response**: [Restore from backup]
**RTO**: [Time]
**RPO**: [Time]

---

### Scenario 5: Dependency Failure

**Detection**: [How detected]
**Response**: [Fallback mode, alternative provider]
**RTO**: [Time]
**RPO**: [Time]

---

## 4. Roles and Responsibilities

**Incident Commander**: [Name, Phone, Email]
- Declares disaster, coordinates response

**Technical Lead**: [Name, Phone, Email]
- Executes recovery procedures

**Communications Lead**: [Name, Phone, Email]
- Updates stakeholders, status page, customers

**On-call Engineer**: [Rotation schedule]
- First responder, initiates escalation

---

## 5. Communication Plan

**Internal**:
- Incident channel: [Slack #incident-YYYY-MM-DD]
- Stakeholders: [VP Engineering, CTO, Customer Success]
- Update frequency: [Every 30 minutes during incident]

**External**:
- Status page: [https://status.company.com]
- Customer notifications: [Email, in-app banner]
- SLA notifications: [If SLA will be breached]

---

## 6. Testing Schedule

**DR Drills**:
- Frequency: [Semi-annually, April and October]
- Scope: [Full failover test, backup restore test]
- Participants: [Engineering team, management]

**Post-Drill**:
- Review meeting: [Within 1 week]
- Runbook updates: [Document learnings]
- Action items: [Assign improvements]

---

## 7. Success Criteria

**Recovery successful when**:
- [ ] System accessible and serving traffic
- [ ] Model predictions functional and accurate
- [ ] Data integrity verified (no corruption)
- [ ] All dependencies operational
- [ ] Monitoring and alerting functional
- [ ] RTO and RPO met

**Validation checklist**:
- [ ] Run smoke tests (critical user flows)
- [ ] Verify model accuracy (compare to baseline)
- [ ] Check data completeness (no missing records)
- [ ] Confirm backups resuming in new environment

---

## 8. Post-Recovery

**Immediate** (within 24 hours):
- [ ] Root cause analysis started
- [ ] Temporary fixes documented
- [ ] Monitoring for secondary failures

**Short-term** (within 1 week):
- [ ] Post-incident review completed
- [ ] Permanent fixes implemented
- [ ] DR plan updated based on learnings

**Long-term** (within 1 month):
- [ ] Preventive measures implemented
- [ ] DR testing schedule updated
- [ ] Training for team on new procedures

---

## Appendix: Runbook Commands

[Detailed step-by-step commands for recovery procedures]

### Failover to Secondary Region

```bash
# 1. Update Route53 to point to secondary region
aws route53 change-resource-record-sets \
  --hosted-zone-id Z1234567890ABC \
  --change-batch file://failover-dns.json

# 2. Scale up secondary region instances
aws ecs update-service \
  --cluster prod-us-west-2 \
  --service chatbot-api \
  --desired-count 5

# 3. Verify health
curl https://api-secondary.company.com/health
```

### Restore Database from Backup

```bash
# 1. Identify latest backup
aws rds describe-db-snapshots \
  --db-instance-identifier chatbot-db \
  --query 'reverse(sort_by(DBSnapshots, &SnapshotCreateTime))[0]'

# 2. Restore from snapshot
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier chatbot-db-restored \
  --db-snapshot-identifier rds:chatbot-db-2026-02-15-00-00

# 3. Wait for restore (takes ~10-30 minutes)
aws rds wait db-instance-available \
  --db-instance-identifier chatbot-db-restored

# 4. Update application to use restored database
# (Update connection string in Secrets Manager)
```

### Rollback Model

```bash
# 1. List model versions
aws s3 ls s3://company-models/chatbot/

# 2. Rollback to previous version
aws s3 cp \
  s3://company-models/chatbot/model-v1.5.tar.gz \
  s3://company-models/chatbot/model-current.tar.gz

# 3. Restart model serving
kubectl rollout restart deployment/model-api

# 4. Verify model version
curl https://api.company.com/model/version
```
```

---

## Example DR Plan: Customer Support Chatbot

**System**: Customer Support Chatbot (RAG-based)
**Owner**: ML Team (Bob)
**DR Tier**: Tier 2 (High)
**RTO**: 4 hours
**RPO**: 1 hour
**Last Tested**: 2026-01-15

### System Overview
- **Description**: RAG-based chatbot for customer product questions
- **Criticality**: High (but humans can handle as fallback)
- **Business Impact**: $5k/hour revenue loss (slower support), reputation risk

**Architecture**:
- Primary: AWS us-east-1 (ECS + RDS + S3)
- Secondary: AWS us-west-2 (warm standby, scaled down)
- Dependencies: OpenAI API, pgvector on RDS

### Backup Strategy
**Models**:
- Embeddings + prompts in S3 (us-east-1)
- Cross-region replication to S3 (us-west-2)
- Versioned (keep last 30 versions)
- Tested monthly

**Data**:
- RDS PostgreSQL: Automated daily snapshots (7-day retention)
- Cross-region snapshot copy to us-west-2
- Product docs in S3 (versioned, replicated)

**Code**:
- GitHub (main, staging, prod branches)
- Automated backups to GitHub

**Configuration**:
- Secrets in AWS Secrets Manager (replicated to us-west-2)
- IaC in Terraform (Git versioned)

### Recovery Procedures

**Regional Outage** (us-east-1 down):
1. Detect: Route53 health checks fail, PagerDuty alert
2. Verify: Check AWS status page, confirm outage
3. Failover: Scale up us-west-2 ECS tasks (1 → 5)
4. DNS: Update Route53 to point to us-west-2 ALB
5. Verify: Run smoke tests, check logs
6. Communicate: Update status page, notify customers
- **RTO**: 4 hours (manual process, warm standby)
- **RPO**: 1 hour (last RDS snapshot sync)

**Bad Model Deployed**:
1. Detect: Accuracy drops from 85% → 50%, user complaints
2. Rollback: S3 copy previous model version to current
3. Restart: ECS tasks pick up new model
4. Verify: Accuracy returns to baseline
- **RTO**: 15 minutes (automated rollback)
- **RPO**: 0 (model versioning)

**Database Corruption**:
1. Detect: Query errors, data inconsistencies
2. Stop writes: Set DB to read-only mode
3. Restore: Create new RDS from latest snapshot
4. Update: Point application to restored DB
5. Verify: Data integrity checks
- **RTO**: 2 hours (restore + validation)
- **RPO**: 1 hour (daily snapshot, plus 1hr of changes)

**OpenAI API Down**:
1. Detect: High error rate (>50% API failures)
2. Fallback: Enable cached responses mode
3. Notify: Users see banner "AI in limited mode"
4. Monitor: Check OpenAI status page
- **RTO**: 5 minutes (automatic fallback)
- **RPO**: 0 (service degradation, no data loss)

### Roles
- **Incident Commander**: Alice (VP Eng) - 555-1234
- **Technical Lead**: Bob (ML Lead) - 555-5678
- **Communications**: Carol (Customer Success) - 555-9012

### Testing
- **Next DR Drill**: 2026-04-15 (full regional failover test)
- **Frequency**: Semi-annually

---

## Blank DR Plan Template

Copy for your project:

```markdown
# Disaster Recovery Plan - [System]

**System**: [Name]
**DR Tier**: [1/2/3/4]
**RTO**: [Time]
**RPO**: [Time]

## 1. System Overview
[Description, criticality, business impact, architecture]

## 2. Backup Strategy
[Models, data, code, configuration, validation]

## 3. Recovery Procedures
### Scenario 1: [Disaster type]
- Detection: [How]
- Response: [Steps]
- RTO/RPO: [Time]

## 4. Roles
[Incident Commander, Technical Lead, Communications]

## 5. Communication Plan
[Internal, external, status page]

## 6. Testing Schedule
[Frequency, scope, post-drill review]

## 7. Success Criteria
[Checklist for recovery completion]

## 8. Appendix: Runbook Commands
[Detailed commands for recovery]
```

---

## Related Templates

- [Production Alerting Runbook](production-alerting-runbook.md) - Incident detection and response
- [AI Incident Runbooks](ai-incident-runbooks.md) - AI-specific incident procedures
- [AI Landing Zone Checklist](ai-landing-zone-checklist.md) - Infrastructure redundancy setup
- [Production Health Dashboard](production-health-dashboard.md) - Monitoring for DR triggers
- [Architecture Decision Record](architecture-decision-record.md) - Document DR architecture decisions
