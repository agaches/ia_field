# Phase 3: Run

> **Goal**: Reliable production operations, continuous monitoring, model lifecycle management
> **Time**: Ongoing
> **Output**: ≥99.9% SLA + Continuous improvement + Mature MLOps

---

## 1. Production Operations

### Daily Operations Checklist

- [ ] Review overnight alerts, SLA compliance, model performance
- [ ] Monitor dashboards (Grafana, Datadog) — respond per severity
- [ ] Review cost dashboard (no unexpected spikes)
- [ ] Check security alerts (DLP, anomalies)
- [ ] Daily standup: incidents, learnings, blockers
- [ ] Handoff to next shift (if 24/7 operations)

---

### Weekly Operations

**Monday: Planning**
- [ ] Review last week's SLA compliance
- [ ] Plan week's deployments and maintenance
- [ ] Review model retraining queue
- [ ] Check capacity planning (scaling needs)

**Wednesday: Mid-week Check**
- [ ] Review half-week metrics (on track?)
- [ ] Address escalated issues
- [ ] Update stakeholders on incidents

**Friday: Retrospective**
- [ ] Week's incident review (root causes, actions)
- [ ] Cost analysis (vs budget, optimization opportunities)
- [ ] Update documentation and runbooks
- [ ] Deploy approved model updates (lower risk on Friday)

---

### Monthly Operations

📋 **Tool**: [Production AI Health Dashboard](../templates/automation/production-health-dashboard.md)
- [ ] **SLA Report**: Availability, latency, error rate vs targets
- [ ] **Model Performance Review**: Accuracy, drift, retraining needs
- [ ] **Cost Analysis**: Actual vs budget, optimization opportunities
- [ ] **Security Audit**: Review logs, access patterns, incidents
- [ ] **Compliance Check**: Regulatory requirements, policy violations
- [ ] **Capacity Planning**: Growth trends, scaling needs
- [ ] **Stakeholder Update**: Business metrics, technical health, roadmap

---

## 2. SLA Monitoring & Enforcement

### Service Level Objectives (SLOs)

Track and enforce these production SLOs:

| Metric | SLO Target | Measurement | Alert Threshold |
|--------|------------|-------------|-----------------|
| **Availability** | ≥99.9% | Uptime monitoring | <99.5% |
| **Latency (P95)** | <2s | APM traces | >3s |
| **Latency (P99)** | <5s | APM traces | >7s |
| **Error Rate** | <0.1% | Logs, metrics | >0.5% |
| **Throughput** | Handle peak +50% | Load metrics | >80% capacity |

**SLA breach response**:
1. **Immediate** (<15 min): Alert on-call engineer, start incident response
2. **Investigate** (<30 min): Root cause analysis, escalate if needed
3. **Remediate** (<1 hour): Fix or rollback, restore SLA compliance
4. **Post-mortem** (<24 hours): Document root cause, preventive actions
5. **Follow-up** (<1 week): Implement preventive measures, update runbooks

---

### Error Budget Management

**Concept**: SLA 99.9% = 0.1% error budget = 43.2 minutes downtime/month

**Error budget tracking**:

| Month | Downtime | Error Budget Used | Remaining | Status |
|-------|----------|-------------------|-----------|--------|
| January | 12 min | 27.8% | 31.2 min | ✅ Healthy |
| February | 38 min | 87.9% | 5.2 min | ⚠️ Warning |
| March | 8 min | 18.5% | 35.2 min | ✅ Healthy |

**Actions based on error budget**:
- **>50% remaining**: Velocity mode - Ship new features, take calculated risks
- **20-50% remaining**: Caution mode - Prioritize reliability, limit risky deployments
- **<20% remaining**: Freeze mode - Only critical fixes, defer new features, focus on stability

---

## 3. Model Performance Monitoring

### Model Quality Metrics

📋 **Tool**: [Model Performance Dashboard](../templates/automation/model-performance-dashboard.md)
**For LLMs/RAG systems**:

| Metric | Target | Measurement | Alert |
|--------|--------|-------------|-------|
| **Relevance** | ≥80% | Human eval (sample) | <75% |
| **Hallucination Rate** | <5% | Grounding checks | >8% |
| **Response Quality** | ≥4/5 | User ratings | <3.5/5 |
| **Retrieval Accuracy** (RAG) | ≥85% | Hit rate in vector DB | <80% |
| **Latency** | <2s (P95) | APM | >3s |

**For ML models** (classification, prediction):

| Metric | Target | Measurement | Alert |
|--------|--------|-------------|-------|
| **Accuracy** | ≥90% | Ground truth comparison | <85% |
| **Precision/Recall** | ≥85% | Confusion matrix | <80% |
| **F1 Score** | ≥0.85 | Harmonic mean | <0.80 |
| **AUC-ROC** | ≥0.90 | ROC curve | <0.85 |
| **Fairness** | No significant bias | Demographic parity | Bias detected |

**Monitoring frequency**:
- Real-time: Latency, error rate, throughput
- Hourly: Response quality trends
- Daily: Detailed quality metrics, user satisfaction
- Weekly: Fairness/bias testing
- Monthly: Comprehensive model audit

---

### Model Drift Detection

**Types of drift**:

**1. Data Drift** - Input distribution changes
- **Example**: Chatbot trained on English, now receiving Spanish queries
- **Detection**: Monitor input feature distributions (KL divergence, PSI)
- **Action**: Retrain with new data, update training set

**2. Concept Drift** - Relationship between input and output changes
- **Example**: Fraud patterns evolve, model no longer detects new tactics
- **Detection**: Monitor prediction accuracy over time
- **Action**: Retrain with recent data, update features

**3. Prediction Drift** - Output distribution changes
- **Example**: Model suddenly predicts more "high risk" classifications
- **Detection**: Monitor prediction distributions
- **Action**: Investigate root cause (data drift? bug? attack?)

**Drift monitoring**:
- [ ] Automated drift detection (Evidently AI, WhyLabs)
- [ ] Alerts when drift exceeds threshold (e.g., PSI >0.2)
- [ ] Automatic retraining trigger (or human approval)
- [ ] A/B test new model vs current before full deployment

---

## 4. Model Lifecycle Management

### Model Retraining Strategy

📋 **Tool**: [Model Retraining Playbook](../templates/automation/model-retraining-playbook.md)
**Retraining triggers**:
- **Scheduled**: Every N days/weeks (e.g., weekly for fast-changing data)
- **Drift-based**: When drift exceeds threshold (PSI >0.2, accuracy drop >5%)
- **Performance-based**: When accuracy falls below SLO
- **Data-based**: When new data volume exceeds threshold (e.g., +10k new samples)

**Retraining workflow**:
1. **Trigger**: Automated or manual
2. **Data**: Collect new data, merge with existing (or replace)
3. **Train**: Run training pipeline (automated)
4. **Evaluate**: Test new model vs current (A/B test)
5. **Approve**: Human review (AI CoE gate 3)
6. **Deploy**: Canary → gradual rollout → full deployment
7. **Monitor**: Watch for regressions, ready to rollback

**Retraining best practices**:
- Never deploy directly to 100% traffic (canary first)
- Always keep previous N versions (easy rollback)
- Log all model changes (audit trail)
- Validate fairness/bias on new model (no regressions)

---

### Model Versioning

**Semantic versioning** for models:
- **Major** (v2.0.0): Architecture change, breaking API changes
- **Minor** (v1.3.0): Retraining with new data, performance improvements
- **Patch** (v1.2.1): Bug fixes, config changes

**Model registry**:
- [ ] All models versioned in MLflow/W&B/Azure ML
- [ ] Metadata: training date, dataset version, hyperparameters, metrics
- [ ] Lineage: track data → features → model → deployment
- [ ] Rollback: Can deploy any previous version in <5 minutes

---

### Sunset & Decommissioning

**When to retire a model**:
- Business case no longer valid (use case obsolete)
- Model consistently underperforming (cannot meet SLOs)
- Replaced by better model/approach
- Compliance risk (regulatory changes)

**Decommissioning checklist**:
- [ ] Communicate to stakeholders (30-90 days notice)
- [ ] Migrate users to alternative (if applicable)
- [ ] Archive model and data (compliance retention)
- [ ] Decommission infrastructure (cost savings)
- [ ] Document learnings (post-mortem)

---

## 5. Incident Response

📋 **Reference**: [Incident Response Process](../templates/shared/incident-response-process.md) adapted for production AI

### Incident Severity Levels

| Severity | Impact | Response Time | Examples |
|----------|--------|---------------|----------|
| **P0 - Critical** | Service down, major data breach | <15 min | API unavailable, PII leak |
| **P1 - High** | Degraded service, minor breach | <1 hour | High latency, bias detected |
| **P2 - Medium** | Limited impact, isolated issue | <4 hours | Single user issue, cost spike |
| **P3 - Low** | Minimal impact, cosmetic | <24 hours | Logging error, UI glitch |

---

### Incident Response Workflow

**1. Detection** (automated alerts, user reports):
- Alert triggered or issue reported
- On-call engineer notified (PagerDuty, Opsgenie)

**2. Triage** (<5 min):
- Assess severity (P0-P3)
- Notify stakeholders (Slack incident channel)
- Assign incident commander

**3. Investigate** (<15-60 min depending on severity):
- Check logs, metrics, traces
- Identify root cause or hypothesis
- Document timeline in incident ticket

**4. Mitigate** (<30 min - 4 hours depending on severity):
- **Quick fix**: Rollback, scale up, patch
- **Workaround**: Redirect traffic, manual intervention
- **Full fix**: Code change, model retrain, architecture update

**5. Verify** (<15 min):
- Confirm SLA restored
- Validate fix (smoke tests)
- Monitor for regressions

**6. Post-Mortem** (<24 hours):
- Document root cause, timeline, actions
- Identify preventive measures
- Update runbooks, improve alerts
- Share learnings with team

---

### Common AI Incident Scenarios

📋 **Tool**: [AI Incident Runbooks](../templates/automation/ai-incident-runbooks.md)
**Scenario 1: Model Hallucination Spike**
- **Symptoms**: User complaints, low satisfaction scores, high "unhelpful" ratings
- **Investigation**: Review recent prompts, check for adversarial inputs
- **Mitigation**: Strengthen guardrails, add examples to few-shot prompts, retrain if persistent
- **Prevention**: Hallucination monitoring, automated grounding checks

**Scenario 2: Cost Spike**
- **Symptoms**: LLM API costs 2x-10x normal
- **Investigation**: Check API logs, identify heavy users or inefficient queries
- **Mitigation**: Implement rate limits, optimize prompts (reduce tokens), cache common queries
- **Prevention**: Cost alerts, per-user quotas, prompt optimization

**Scenario 3: Bias Detected**
- **Symptoms**: Fairness monitoring alert, user complaints, media attention
- **Investigation**: Reproduce bias, test on diverse demographics
- **Mitigation**: Immediate: Add human review for affected decisions. Long-term: Retrain with balanced data
- **Prevention**: Regular fairness audits, diverse training data, bias testing in CI/CD

**Scenario 4: Data Leak (PII Exposed)**
- **Symptoms**: DLP alert, user reports, security scan finding
- **Investigation**: Identify what data leaked, how many users affected
- **Mitigation**: IMMEDIATE: Disable API, delete leaked data, rotate keys. Notify affected users (<72h GDPR)
- **Prevention**: Stronger DLP, output scanning, regular security audits

---

## 6. Cost Optimization

### Cost Monitoring Dashboard

📋 **Tool**: [Production AI Cost Dashboard](../templates/automation/production-cost-dashboard.md)
| Cost Category | Budget | Actual | Variance | Optimization |
|---------------|--------|--------|----------|--------------|
| **LLM API** | $15,000 | $18,200 | +21% ⚠️ | Prompt optimization, caching |
| **Infrastructure** | $5,000 | $4,200 | -16% ✅ | Right-sized |
| **Vector DB** | $500 | $480 | -4% ✅ | Optimized |
| **Monitoring** | $1,000 | $1,100 | +10% ✅ | Acceptable |
| **Storage** | $500 | $420 | -16% ✅ | Right-sized |
| **Total** | **$22,000** | **$24,400** | **+11% ⚠️** | Action needed |

**Decision criteria**:
- **Variance <10%**: On track, no action needed ✅
- **Variance 10-20%**: Investigate optimization opportunities ⚠️
- **Variance >20%**: Immediate action required, escalate to management 🚨

---

### Cost Optimization Strategies

**LLM API costs** (typically largest):
- [ ] **Prompt optimization**: Reduce token count (shorter prompts, concise system messages)
- [ ] **Caching**: Cache common queries (Redis, CDN)
- [ ] **Model selection**: Use cheaper models for simple queries (GPT-4 → GPT-3.5 → Haiku)
- [ ] **Streaming**: Stream responses (better UX, lower perceived latency, same cost)
- [ ] **Rate limiting**: Prevent abuse, implement per-user quotas
- [ ] **Batch processing**: Group requests where latency allows (lower cost per request)

**Infrastructure costs**:
- [ ] **Auto-scaling**: Scale down during low-traffic periods
- [ ] **Reserved instances**: Commit to 1-3 years for 30-50% savings (if predictable)
- [ ] **Spot instances**: Use for non-critical workloads (60-80% savings)
- [ ] **Right-sizing**: Monitor actual usage, downsize over-provisioned resources

**Vector DB costs**:
- [ ] **Compression**: Use quantization (int8) for embeddings (2-4x size reduction)
- [ ] **Pruning**: Remove low-quality or outdated vectors
- [ ] **Sharding**: Separate by tenant/use case (optimize per shard)

---

### ROI Tracking

**Monthly ROI calculation**:

| Metric | Value |
|--------|-------|
| **Investment** (AI system costs) | $120k/month |
| **Return** (business value) | $350k/month |
| **Net Return** | $230k/month |
| **ROI** | ($350k - $120k) / $120k = **192%** ✅ |
| **Payback Period** | <1 month ✅ |

**Business value sources**:
- Cost savings (support tickets: -40% = $200k/month)
- Revenue increase (conversion rate: +15% = $100k/month)
- Efficiency gains (time saved: 500 hours/month × $100/hour = $50k/month)

**Operational threshold**: Production AI requires ≥100% ROI (2x return) to justify sustained operations. Initial investment approval requires ≥20% projected ROI (see [Phase 1: Prepare](01-prepare.md)).

---

## 7. Continuous Improvement

### Quarterly Review

📋 **Tool**: [Quarterly AI System Review](../templates/automation/quarterly-system-review.md)
**Review scope**:
- [ ] **SLA performance**: Availability, latency, error rate (met targets?)
- [ ] **Model performance**: Accuracy, drift, retraining frequency
- [ ] **Security**: Incidents, OWASP compliance, vulnerabilities
- [ ] **Compliance**: Regulatory changes, audit findings
- [ ] **Cost**: Budget vs actual, optimization opportunities
- [ ] **Team**: Skills gaps, training needs, process improvements
- [ ] **Roadmap**: New features, architecture changes, tech debt

**Output**: Prioritized action items for next quarter

---

### Regular Audits

**Security Audit** (quarterly):
- [ ] Review access logs (unusual patterns?)
- [ ] Vulnerability scanning (dependencies, infrastructure)
- [ ] Penetration testing (red team exercises)
- [ ] OWASP LLM Top 10 compliance check
- [ ] Incident review (root causes, preventive actions)

**Compliance Audit** (quarterly or per regulation):
- [ ] GDPR/privacy compliance (data retention, user rights)
- [ ] EU AI Act compliance (high-risk systems)
- [ ] Sector-specific regulations (HIPAA, SOX, etc.)
- [ ] Policy violations (documented, resolved?)
- [ ] Model documentation (model cards up to date?)

**Fairness Audit** (quarterly):
- [ ] Bias testing on diverse demographics
- [ ] Fairness metrics (demographic parity, equal opportunity)
- [ ] User feedback on bias (complaints, reports)
- [ ] Mitigation actions (if bias detected)

---

### Continuous Learning

- **Monthly**: Lunch & Learn, document incidents, update runbooks
- **Quarterly**: Advanced training (MLOps, fine-tuning), evaluate new models/patterns
- **Annually**: Conferences, certifications, technology refresh planning

---

## Phase 3 Checklist

### Operations ✅
- [ ] Daily/weekly/monthly operations established
- [ ] SLA monitoring and enforcement active
- [ ] On-call rotation staffed and trained
- [ ] Incident response tested (DR drill)

### Model Management ✅
- [ ] Model performance monitoring automated
- [ ] Drift detection active (alerts configured)
- [ ] Retraining pipeline operational
- [ ] Model versioning and rollback tested

### Optimization ✅
- [ ] Cost monitoring and optimization active
- [ ] ROI tracked monthly (≥100% target)
- [ ] Error budget management in place
- [ ] Capacity planning performed

### Governance ✅
- [ ] Regular audits scheduled (security, compliance, fairness)
- [ ] AI CoE meetings quarterly
- [ ] Policy compliance monitored
- [ ] Continuous improvement cycle active

### Maturity ✅
- [ ] ≥99.9% SLA achieved for 3+ months
- [ ] Zero critical security incidents
- [ ] Model retraining automated
- [ ] Team mature (Levels 3-4)

---

**Congratulations!** Your organization has successfully deployed and operated production AI systems.

**Next steps**:
- Scale to additional use cases
- Establish AI Center of Excellence (if not already)
- Contribute to AI governance standards
- Innovate with advanced AI patterns (multi-agent, compound AI systems)

---

**Questions?** Check [TRAINING.md](../TRAINING.md) for advanced topics or [SKILLS.md](../SKILLS.md) for Level 4 expert path.
