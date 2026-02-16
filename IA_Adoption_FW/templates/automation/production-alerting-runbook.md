# Production Alerting Runbook

> **Purpose**: Alert definitions, severity levels, and response procedures for production AI
> **Used in**: Automation Phase 2 (Build) - Configure monitoring and alerting
> **Update frequency**: Review quarterly, update after incidents or system changes

---

## What is an Alerting Runbook?

An alerting runbook defines what to monitor, when to alert, and how to respond for production AI systems. It ensures consistent incident response and reduces mean time to resolution (MTTR).

**Key components**:
- Alert definitions (what triggers an alert)
- Severity levels (critical, high, medium, low)
- Response procedures (who does what, when)
- Escalation paths (when to escalate)

**Benefits**:
- Faster incident response (clear procedures)
- Reduced alert fatigue (proper severity classification)
- Better on-call experience (runbooks for each alert)
- Improved system reliability

---

## Alert Severity Levels

### Severity 1: Critical (P1)

**Definition**: System down, major functionality broken, or severe business impact.

**Examples**:
- API returning 5xx errors for >5 minutes
- Model inference endpoint down
- Data pipeline complete failure (no data processed in 6 hours)
- Security breach or data leak detected
- Hallucination spike (>50% gibberish responses)

**Response**:
- **Immediate action required** (within 15 minutes)
- Page on-call engineer (PagerDuty, phone call)
- Notify incident commander
- Create incident channel (Slack #incident-YYYY-MM-DD)
- Consider disabling AI system if causing harm

**Escalation**:
- If not resolved in 1 hour → Escalate to VP Engineering
- If not resolved in 4 hours → Escalate to CTO

---

### Severity 2: High (P2)

**Definition**: Significant degradation, but system still functional. Major feature broken.

**Examples**:
- API latency >5 seconds P95 (SLA: 2 seconds)
- Model accuracy dropped by >20% (e.g., 85% → 65%)
- Data drift detected (input distribution changed significantly)
- Cost spike (>50% increase in 1 hour)
- Partial service outage (one region down, others OK)

**Response**:
- **Action required within 1 hour**
- Alert on-call engineer (Slack, email)
- Investigate and implement mitigation
- Update status page

**Escalation**:
- If not resolved in 4 hours → Escalate to on-call manager
- If customer-facing → Notify customer success team

---

### Severity 3: Medium (P3)

**Definition**: Minor degradation or potential issue. No immediate business impact.

**Examples**:
- API latency elevated (3-4 seconds, SLA: 2 seconds)
- Model accuracy dropped by 10-20%
- Disk usage >80%
- Unusual error rate increase (5% → 10%, still acceptable)

**Response**:
- **Action required within 24 hours**
- Create ticket (Jira, GitHub)
- Investigate during business hours
- Schedule fix in next sprint if needed

**Escalation**:
- If degradation worsens → Re-classify as Severity 2

---

### Severity 4: Low (P4)

**Definition**: Informational alert. No action required immediately.

**Examples**:
- Scheduled job completed (success notification)
- Model retrained successfully
- Certificate expiring in 30 days
- Non-critical warning in logs

**Response**:
- **No immediate action required**
- Review during weekly team sync
- Schedule maintenance if needed

---

## Alert Categories

### 1. Infrastructure Alerts

**API Health**:
- **Alert**: API error rate >5% for 5 minutes
- **Severity**: P1 (Critical)
- **Response**: Check API logs, restart service if needed, rollback recent deployment
- **Escalation**: If not resolved in 30 minutes → page senior engineer

**API Latency**:
- **Alert**: P95 latency >2x SLA for 10 minutes (e.g., >4s when SLA is 2s)
- **Severity**: P2 (High)
- **Response**: Check database query performance, scaling status, external API dependencies
- **Escalation**: If latency >5x SLA → upgrade to P1

**Compute Resources**:
- **Alert**: CPU >90% for 10 minutes
- **Severity**: P3 (Medium)
- **Response**: Check for runaway processes, scale up if needed
- **Alert**: Disk usage >90%
- **Severity**: P2 (High)
- **Response**: Clean up logs, temporary files, or scale storage

---

### 2. Model Performance Alerts

**Accuracy Degradation**:
- **Alert**: Model accuracy dropped by >20% (e.g., 85% → 65%)
- **Severity**: P1 (Critical)
- **Response**: Disable AI, rollback to previous model, investigate data quality or drift
- **Alert**: Model accuracy dropped by 10-20%
- **Severity**: P2 (High)
- **Response**: Investigate, schedule retraining if needed

**Confidence Threshold**:
- **Alert**: >20% of predictions below confidence threshold (e.g., model uncertain)
- **Severity**: P2 (High)
- **Response**: Check input data quality, investigate concept drift, consider retraining

**Error Rate**:
- **Alert**: Model inference errors >5% for 5 minutes
- **Severity**: P1 (Critical)
- **Response**: Check model endpoint, input validation, rollback if recent deployment

---

### 3. Data Quality Alerts

**Data Drift**:
- **Alert**: Input distribution changed significantly (KL divergence >0.5)
- **Severity**: P2 (High)
- **Response**: Investigate data source changes, validate data pipeline, schedule retraining

**Missing Data**:
- **Alert**: >10% of required features missing in input data
- **Severity**: P2 (High)
- **Response**: Check data pipeline, upstream services, data source health

**Data Pipeline Failure**:
- **Alert**: No data processed in expected window (e.g., 6 hours for daily job)
- **Severity**: P1 (Critical)
- **Response**: Check pipeline logs, restart failed jobs, validate data sources

**Schema Violation**:
- **Alert**: Input data schema mismatch (unexpected fields, wrong types)
- **Severity**: P2 (High)
- **Response**: Validate upstream changes, update schema validation, coordinate with data team

---

### 4. Business Metrics Alerts

**User Satisfaction**:
- **Alert**: User satisfaction score dropped by >20% (e.g., 4.5/5 → 3.5/5)
- **Severity**: P2 (High)
- **Response**: Review recent changes, check for quality issues, analyze user feedback

**Conversion Impact**:
- **Alert**: AI-assisted conversions dropped by >30%
- **Severity**: P1 (Critical if business-critical feature)
- **Response**: Investigate model quality, A/B test comparison, consider disabling AI

**Usage Drop**:
- **Alert**: API requests dropped by >50% (not during expected low-traffic period)
- **Severity**: P2 (High)
- **Response**: Check for client-side issues, API availability, service health

---

### 5. Cost Alerts

**Cost Spike**:
- **Alert**: Hourly cost >2x average (e.g., $100/hr vs $50/hr avg)
- **Severity**: P2 (High)
- **Response**: Check for runaway processes, unusual traffic, API abuse, model inefficiencies
- **Alert**: Daily budget exceeded by >50%
- **Severity**: P1 (Critical if budget constrained)
- **Response**: Investigate immediately, implement rate limiting, disable non-essential features

**Token/Inference Spike**:
- **Alert**: LLM API calls >2x expected rate
- **Severity**: P2 (High)
- **Response**: Check for abuse, loops, unintended usage patterns, implement throttling

---

### 6. Security Alerts

**Unusual Access Patterns**:
- **Alert**: API calls from unexpected IPs or geolocations
- **Severity**: P2 (High)
- **Response**: Review access logs, verify legitimate use, block if malicious

**Prompt Injection Detected**:
- **Alert**: Input filtering blocked >10 suspicious inputs in 5 minutes
- **Severity**: P3 (Medium, P2 if sustained)
- **Response**: Review blocked inputs, tune filters, investigate if coordinated attack

**Data Leak Risk**:
- **Alert**: Model output contains PII or secrets (regex match on API keys, SSNs, etc.)
- **Severity**: P1 (Critical)
- **Response**: Disable AI immediately, investigate leak source, review all recent outputs, notify security team

**Authentication Failures**:
- **Alert**: >100 failed auth attempts in 5 minutes (brute force attack)
- **Severity**: P2 (High)
- **Response**: Block offending IPs, review auth logs, enable rate limiting

---

## Alert Response Procedures

### Step 1: Acknowledge
- Acknowledge alert within **15 minutes** (P1), **1 hour** (P2), **24 hours** (P3)
- Update incident status (PagerDuty, Jira, status page)

### Step 2: Assess
- Check dashboards (see [Production Health Dashboard](production-health-dashboard.md))
- Review recent changes (deployments, config changes, data updates)
- Determine root cause (logs, metrics, traces)

### Step 3: Mitigate
- Implement immediate mitigation (rollback, disable feature, scale resources)
- Communicate to stakeholders (incident channel, status page)

### Step 4: Resolve
- Implement permanent fix
- Validate fix in staging before production
- Monitor for recurrence

### Step 5: Post-Incident
- Write post-incident review (within 48 hours for P1, 1 week for P2)
- Update runbooks based on learnings
- Implement preventive measures

---

## Example Alert Configurations

### Prometheus Alert Rules

```yaml
groups:
  - name: ai_model_alerts
    interval: 60s
    rules:
      # Critical: API error rate
      - alert: HighAPIErrorRate
        expr: rate(api_errors_total[5m]) > 0.05
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "API error rate above 5%"
          description: "{{ $value | humanizePercentage }} errors in last 5 minutes"
          runbook: "https://wiki.company.com/runbooks/api-errors"

      # Critical: Model accuracy drop
      - alert: ModelAccuracyDrop
        expr: (model_accuracy_current / model_accuracy_baseline) < 0.8
        for: 10m
        labels:
          severity: critical
        annotations:
          summary: "Model accuracy dropped by >20%"
          description: "Current: {{ $value }}, Baseline: {{ model_accuracy_baseline }}"
          runbook: "https://wiki.company.com/runbooks/model-accuracy"

      # High: API latency
      - alert: HighAPILatency
        expr: histogram_quantile(0.95, rate(api_latency_seconds_bucket[5m])) > 2.0
        for: 10m
        labels:
          severity: high
        annotations:
          summary: "P95 API latency above 2 seconds"
          description: "P95 latency: {{ $value }}s"
          runbook: "https://wiki.company.com/runbooks/api-latency"

      # High: Data drift
      - alert: DataDriftDetected
        expr: data_drift_kl_divergence > 0.5
        for: 1h
        labels:
          severity: high
        annotations:
          summary: "Significant data drift detected"
          description: "KL divergence: {{ $value }}"
          runbook: "https://wiki.company.com/runbooks/data-drift"

      # High: Cost spike
      - alert: CostSpike
        expr: rate(cost_dollars_total[1h]) > (avg_over_time(cost_dollars_total[7d]) * 2)
        for: 1h
        labels:
          severity: high
        annotations:
          summary: "Cost 2x above 7-day average"
          description: "Current rate: ${{ $value }}/hr"
          runbook: "https://wiki.company.com/runbooks/cost-spike"

      # Medium: Disk usage
      - alert: HighDiskUsage
        expr: (node_filesystem_avail_bytes / node_filesystem_size_bytes) < 0.2
        for: 30m
        labels:
          severity: medium
        annotations:
          summary: "Disk usage above 80%"
          description: "{{ $value | humanizePercentage }} free space remaining"
          runbook: "https://wiki.company.com/runbooks/disk-usage"
```

---

## Runbook Template

Create a runbook for each alert type:

```markdown
# Runbook: [Alert Name]

**Alert**: [Alert name from monitoring system]
**Severity**: [P1 / P2 / P3 / P4]
**Trigger**: [What condition triggers this alert]

---

## Symptoms
[What users or systems experience when this alert fires]

---

## Impact
[Business/technical impact of this issue]

---

## Diagnosis
[How to investigate and identify root cause]

1. Check [dashboard link]
2. Review logs: `kubectl logs [pod-name]` or CloudWatch filter
3. Check recent deployments: `kubectl rollout history deployment/[name]`
4. Verify data quality: [SQL query or dashboard]

---

## Mitigation
[Immediate actions to reduce impact]

1. [Step 1: e.g., Rollback deployment]
   ```bash
   kubectl rollout undo deployment/model-api
   ```

2. [Step 2: e.g., Scale up resources]
   ```bash
   kubectl scale deployment/model-api --replicas=10
   ```

3. [Step 3: e.g., Disable feature flag]
   ```bash
   aws ssm put-parameter --name /feature/ai-model --value false --overwrite
   ```

---

## Resolution
[Permanent fix]

1. [Step 1: e.g., Fix code bug]
2. [Step 2: e.g., Deploy fix to staging]
3. [Step 3: e.g., Validate fix]
4. [Step 4: e.g., Deploy to production]

---

## Prevention
[How to prevent this in the future]

- [Action 1: e.g., Add automated test]
- [Action 2: e.g., Improve monitoring]
- [Action 3: e.g., Update deployment process]

---

## Related Alerts
- [Related alert 1]
- [Related alert 2]

---

## Escalation
- **1 hour**: Escalate to [Manager / Senior Engineer]
- **4 hours**: Escalate to [VP Engineering]
- **Contact**: [Name], [Phone], [Email]
```

---

## Example Runbook: High API Error Rate

```markdown
# Runbook: High API Error Rate

**Alert**: HighAPIErrorRate
**Severity**: P1 (Critical)
**Trigger**: API error rate >5% for 5 minutes

---

## Symptoms
- Users seeing 500 errors or timeouts
- Monitoring dashboard shows elevated error rate
- PagerDuty alert fired

---

## Impact
- Users cannot access chatbot
- Customer support tickets increasing
- Potential revenue loss if e-commerce integration affected

---

## Diagnosis

1. **Check error types in dashboard**: https://grafana.company.com/api-errors
   - Are errors 500 (server), 502 (bad gateway), 503 (unavailable), or 504 (timeout)?

2. **Review logs** (CloudWatch):
   ```bash
   aws logs tail /aws/ecs/chatbot-api --follow --filter-pattern "ERROR"
   ```

3. **Check recent deployments**:
   ```bash
   aws ecs list-tasks --cluster prod --service-name chatbot-api
   ```
   - Was there a recent deployment in last 30 minutes?

4. **Verify dependencies**:
   - OpenAI API status: https://status.openai.com
   - Database: Check RDS metrics in CloudWatch
   - Vector DB (pgvector): Check RDS connection count, CPU

5. **Check for traffic spike**:
   - Is request rate significantly higher than normal?
   - Potential DDoS or bot traffic?

---

## Mitigation

### If recent deployment (within 30 minutes):
**Rollback immediately**:
```bash
aws ecs update-service \
  --cluster prod \
  --service chatbot-api \
  --task-definition chatbot-api:PREVIOUS_VERSION \
  --force-new-deployment
```
Monitor for 5 minutes. If error rate drops, deployment was the cause.

### If OpenAI API down:
**Switch to fallback responses**:
```bash
aws ssm put-parameter \
  --name /chatbot/fallback-mode \
  --value true \
  --overwrite
```
This will return pre-written fallback responses instead of calling OpenAI.

### If database overload:
**Scale up RDS**:
```bash
aws rds modify-db-instance \
  --db-instance-identifier chatbot-db \
  --db-instance-class db.r6g.2xlarge \
  --apply-immediately
```

### If traffic spike:
**Enable rate limiting**:
```bash
aws ssm put-parameter \
  --name /chatbot/rate-limit \
  --value 100 \
  --overwrite
```
This limits requests to 100/min per user.

---

## Resolution

1. **Identify root cause** from diagnosis
2. **Implement permanent fix** (code fix, config change, scaling)
3. **Test in staging**: Deploy to staging environment first
4. **Deploy to production**: Use gradual rollout (canary)
5. **Monitor**: Watch error rate for 1 hour after deployment

---

## Prevention

- **Add pre-deployment testing**: Load test before production deployment
- **Improve dependency monitoring**: Alert if OpenAI API latency elevated
- **Add circuit breaker**: Auto-fallback if OpenAI errors >10%
- **Improve database query performance**: Index optimization
- **Add rate limiting by default**: Prevent traffic spikes from causing outages

---

## Related Alerts
- HighAPILatency (often co-occurs)
- DatabaseConnectionPoolExhausted
- OpenAIDependencyDown

---

## Escalation
- **30 minutes**: Escalate to Senior Engineer (Bob) - 555-1234
- **1 hour**: Escalate to VP Engineering (Alice) - 555-5678
- **Update status page**: https://status.company.com (set to "Major Outage")
```

---

## On-Call Schedule and Escalation

**On-call rotation**:
- Primary: ML Engineer (weekly rotation)
- Secondary: Senior Engineer (backup)
- Manager: On-call manager (escalations)

**Escalation matrix**:

| Severity | Initial Response | Escalation (1 hour) | Escalation (4 hours) |
|----------|------------------|---------------------|----------------------|
| P1       | On-call engineer | Senior engineer     | VP Engineering       |
| P2       | On-call engineer | On-call manager     | VP Engineering       |
| P3       | Ticket assigned  | Manager (next day)  | N/A                  |
| P4       | Ticket backlog   | N/A                 | N/A                  |

---

## Alert Tuning Guidelines

**Avoid alert fatigue**:
- Alert only on actionable issues (don't alert if no action needed)
- Use appropriate thresholds (tune to reduce false positives)
- Use duration conditions (don't alert on transient spikes)
- Consolidate related alerts (group into single incident)

**Review alerts quarterly**:
- Are alerts actionable? (If not, remove or downgrade)
- Are thresholds correct? (Too sensitive? Too lax?)
- Are runbooks up-to-date? (Update after incidents)
- Are alerts firing frequently with no action? (Remove or tune)

---

## Related Templates

- [Production Health Dashboard](production-health-dashboard.md) - Monitoring dashboards
- [Model Performance Dashboard](model-performance-dashboard.md) - Model-specific monitoring
- [AI Incident Runbooks](ai-incident-runbooks.md) - Incident response procedures
- [Disaster Recovery Plan](disaster-recovery-plan.md) - DR procedures
- [MLOps Maturity Assessment](mlops-maturity-assessment.md) - Improve monitoring maturity
