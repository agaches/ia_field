# AI Incident Runbooks

> **Purpose**: Common AI-specific incident response procedures
> **Used in**: Automation Phase 3 (Run) - Respond to AI failures
> **Update frequency**: Update after major incidents, review quarterly

---

## What are AI Incident Runbooks?

AI incident runbooks are step-by-step procedures for responding to AI-specific failures: hallucinations, bias, cost spikes, data leaks, model degradation. They complement general incident response with AI-specific diagnostics and mitigations.

**Key AI incidents**:
- Hallucination spike (LLM generating false information)
- Cost explosion (unexpected API/compute costs)
- Bias detected (unfair predictions across subgroups)
- Data leak (model outputs sensitive information)
- Model degradation (accuracy drop)
- Adversarial attack (prompt injection, model extraction)

---

## Incident Response Framework

### Incident Severity

**Severity 1 (Critical)**:
- Data leak or privacy violation
- Widespread hallucinations causing harm
- System completely non-functional
- **Response time**: <15 minutes
- **Action**: Disable AI immediately, page on-call

**Severity 2 (High)**:
- Major cost spike (>2× budget)
- Significant bias detected (>20% disparity)
- Major accuracy degradation (>20% drop)
- **Response time**: <1 hour
- **Action**: Investigate, mitigate, plan fix

**Severity 3 (Medium)**:
- Moderate cost increase (1.5-2× budget)
- Minor bias detected (10-20% disparity)
- Moderate accuracy degradation (10-20% drop)
- **Response time**: <24 hours
- **Action**: Investigate, schedule fix

**Severity 4 (Low)**:
- Informational alerts
- Minor anomalies
- **Response time**: Next sprint
- **Action**: Create ticket, monitor

---

## Runbook 1: Hallucination Spike

### Symptoms
- Users reporting incorrect or nonsensical AI responses
- Monitoring shows >50% "low confidence" predictions
- Increased "thumbs down" ratings
- Support tickets referencing "AI giving wrong answers"

### Impact
- User trust erodes (reputation damage)
- Potential legal liability (if advice causes harm)
- Business impact (users abandon AI feature)

### Diagnosis

**1. Confirm hallucination spike**:
```bash
# Check recent AI responses (sample 50)
aws logs filter-pattern "ai_response" \
  --log-group-name /aws/ecs/chatbot-api \
  --start-time $(date -d '1 hour ago' +%s)000 \
  | jq -r '.message' | head -50
```

**2. Identify patterns**:
- Are hallucinations in specific topic/category?
- Are they after a recent deployment?
- Are they from specific user queries (edge cases)?
- Is model confidence low for hallucinated responses?

**3. Check for root causes**:
- **Recent deployment**: Was model or prompt updated recently?
- **Data quality**: Is retrieval (RAG) returning irrelevant docs?
- **Prompt injection**: Are users intentionally breaking the system?
- **Model degradation**: Has accuracy dropped overall?

### Mitigation

**Immediate** (within 15 minutes):

**Option 1: Increase confidence threshold**
```bash
# Require higher confidence for AI responses (reduce false positives)
aws ssm put-parameter \
  --name /chatbot/confidence-threshold \
  --value 0.85 \
  --overwrite
# Restart service to pick up new config
kubectl rollout restart deployment/chatbot-api
```

**Option 2: Enable human review**
```bash
# Route all AI responses through human approval (slow, but safe)
aws ssm put-parameter \
  --name /chatbot/human-review-mode \
  --value true \
  --overwrite
```

**Option 3: Disable AI (fallback to human agents)**
```bash
# Disable AI feature entirely
aws ssm put-parameter \
  --name /chatbot/ai-enabled \
  --value false \
  --overwrite
```

**Short-term** (within 1 hour):

**Option 1: Rollback recent deployment**
```bash
# Rollback to previous model version
aws s3 cp \
  s3://models/chatbot-v2.3.tar.gz \
  s3://models/chatbot-current.tar.gz
kubectl rollout restart deployment/chatbot-api
```

**Option 2: Fix retrieval quality (RAG)**
```python
# Increase retrieval relevance threshold
# Only use docs with similarity score >0.7 (was 0.5)
def retrieve_docs(query, threshold=0.7):
    results = vector_db.search(query, k=10)
    filtered = [r for r in results if r['score'] > threshold]
    return filtered
```

**Option 3: Update prompts (add constraints)**
```python
# Add explicit instructions to prevent hallucinations
system_prompt = """
You are a customer support assistant. IMPORTANT RULES:
1. Only answer based on provided documentation. Do NOT make up information.
2. If information is not in the docs, say "I don't know" or "I don't have that information."
3. Never guess or infer answers not explicitly stated in docs.
4. Cite sources: "According to [doc name], ..."
"""
```

### Resolution

**1. Identify root cause**:
- If deployment: Rollback and investigate bug
- If data quality: Fix retrieval, retrain model
- If prompt injection: Improve input filtering

**2. Implement permanent fix**:
- Update model training data (if needed)
- Improve prompt engineering (add constraints)
- Enhance retrieval quality (better embeddings, filtering)
- Add adversarial testing to CI/CD

**3. Test thoroughly**:
- Test on previous hallucination examples
- Run regression tests (ensure fix doesn't break other queries)
- A/B test with control group (verify improvement)

**4. Deploy**:
- Deploy to staging first
- Canary deployment (10% → 50% → 100%)
- Monitor closely for 48 hours

### Prevention

- **Confidence thresholds**: Only answer high-confidence queries
- **Grounding**: Require citations (RAG: cite source docs)
- **Fact-checking**: Post-process responses (verify against knowledge base)
- **Adversarial testing**: Red team to find hallucination prompts
- **User feedback**: Collect "thumbs down" and review monthly

---

## Runbook 2: Cost Explosion

### Symptoms
- Cloud billing alert: Daily spend >2× average
- LLM API usage spike (10k calls/hr vs 1k calls/hr avg)
- Compute cost spike (GPU hours >>expected)

### Impact
- Budget overrun (potential thousands of dollars)
- Need to explain to finance/leadership
- May need to disable features to control cost

### Diagnosis

**1. Identify cost source**:
```bash
# AWS Cost Explorer (via CLI)
aws ce get-cost-and-usage \
  --time-period Start=2026-02-15,End=2026-02-16 \
  --granularity HOURLY \
  --metrics UnblendedCost \
  --group-by Type=SERVICE

# Check which service spiked (ECS, SageMaker, API Gateway, etc.)
```

**2. Check LLM API usage**:
```bash
# OpenAI API usage (from logs)
aws logs filter-pattern "openai_api_call" \
  --log-group-name /aws/ecs/chatbot-api \
  --start-time $(date -d '24 hours ago' +%s)000 \
  | jq -r '.tokens_used' | awk '{sum+=$1} END {print sum}'

# Tokens used in last 24h (compare to baseline)
```

**3. Identify abnormal patterns**:
- Specific user making excessive calls? (abuse?)
- Infinite loop in code? (retries gone wrong?)
- Unexpected traffic spike? (viral event, bot attack?)
- Longer-than-expected responses? (token usage per call increased)

### Mitigation

**Immediate** (within 15 minutes):

**Option 1: Implement rate limiting**
```python
# Add per-user rate limit (max 100 requests/hour)
from flask_limiter import Limiter

limiter = Limiter(
    app,
    key_func=lambda: request.headers.get('User-ID'),
    default_limits=["100 per hour"]
)

@app.route('/api/chat')
@limiter.limit("100 per hour")
def chat():
    # ...
```

**Option 2: Reduce LLM context window**
```python
# Limit input tokens (was 8k, now 2k)
def truncate_input(text, max_tokens=2000):
    tokens = tokenizer.encode(text)
    if len(tokens) > max_tokens:
        tokens = tokens[:max_tokens]
    return tokenizer.decode(tokens)
```

**Option 3: Switch to cheaper model**
```python
# Switch from GPT-4 to GPT-3.5-Turbo (10× cheaper)
# Temporary degradation, but cost-controlled
model = "gpt-3.5-turbo"  # was "gpt-4"
```

**Option 4: Disable non-essential features**
```bash
# Disable AI for free-tier users (keep for paid users only)
aws ssm put-parameter \
  --name /chatbot/ai-enabled-free-tier \
  --value false \
  --overwrite
```

**Short-term** (within 4 hours):

**1. Block abusive users**:
```bash
# Identify top users by API calls
cat api-logs.json | jq -r '.user_id' | sort | uniq -c | sort -nr | head -10

# Block top abuser (if malicious)
aws waf create-ip-set \
  --name blocked-users \
  --addresses [USER_IP]
```

**2. Optimize prompts** (reduce token usage):
```python
# Before: 500-token system prompt
# After: 100-token system prompt (remove fluff)
system_prompt = "You are a support assistant. Answer concisely."  # was 5 paragraphs
```

**3. Add caching** (reduce repeated API calls):
```python
# Cache common queries (Redis)
import redis
cache = redis.Redis()

def get_response(query):
    # Check cache first
    cached = cache.get(query)
    if cached:
        return cached

    # Call LLM API
    response = openai.ChatCompletion.create(...)

    # Cache for 1 hour
    cache.setex(query, 3600, response)
    return response
```

### Resolution

**1. Root cause**:
- Identify exact cause (abuse, bug, legitimate spike)
- Document findings

**2. Permanent fix**:
- Implement rate limiting (if not already)
- Add cost monitoring and alerts (budget alerts)
- Optimize prompt engineering (reduce tokens)
- Add caching layer (reduce redundant calls)
- Review pricing tier (reserved capacity for predictable savings)

**3. Cost recovery** (if abuse):
- Block malicious users
- Contact abusers (if legitimate users violating TOS)
- Request refund from LLM provider (if API bug caused overcharging)

### Prevention

- **Budget alerts**: Set daily/weekly budget alerts (AWS Budgets, CloudWatch)
- **Rate limiting**: Enforce per-user, per-IP limits from day one
- **Caching**: Cache common queries (reduce API calls)
- **Monitoring**: Real-time cost dashboard (cost per request, daily burn rate)
- **Reserved capacity**: Pre-purchase tokens/compute for predictable workloads

---

## Runbook 3: Bias Detected

### Symptoms
- Monitoring shows >10% accuracy disparity across subgroups (gender, race, age)
- User complaints about unfair treatment
- Regulatory inquiry (EEOC, FTC, EU regulator)
- Internal audit flags bias issue

### Impact
- Legal risk (discrimination lawsuits, fines)
- Reputation damage (PR crisis)
- User attrition (affected groups stop using product)
- Regulatory penalties (EU AI Act violations)

### Diagnosis

**1. Confirm bias**:
```python
# Calculate accuracy by subgroup
def calculate_subgroup_accuracy(predictions, labels, protected_attr):
    groups = {}
    for pred, label, attr in zip(predictions, labels, protected_attr):
        if attr not in groups:
            groups[attr] = {'correct': 0, 'total': 0}
        groups[attr]['total'] += 1
        if pred == label:
            groups[attr]['correct'] += 1

    for group, stats in groups.items():
        accuracy = stats['correct'] / stats['total']
        print(f"{group}: {accuracy:.1%} ({stats['total']} samples)")

# Example output:
# Male: 85% (500 samples)
# Female: 70% (500 samples)  # 15% disparity - BIAS DETECTED
```

**2. Identify bias source**:
- **Data bias**: Training data skewed (more male examples than female?)
- **Label bias**: Human labelers biased (gave different labels for similar cases?)
- **Model bias**: Model learned biased patterns (correlates protected attr with outcome?)
- **Measurement bias**: Test data not representative (different distributions?)

**3. Check compliance** (EU AI Act, EEOC, etc.):
- Is this a high-risk use case? (hiring, credit, etc.)
- Are we violating regulations? (disparate impact >10%?)
- Do we need to report to regulators?

### Mitigation

**Immediate** (within 1 hour):

**Option 1: Disable AI for high-risk decisions**
```bash
# If hiring/credit/high-stakes: Disable AI, revert to human process
aws ssm put-parameter \
  --name /hiring/ai-screening-enabled \
  --value false \
  --overwrite
```

**Option 2: Add human review for affected subgroup**
```python
# Route predictions for affected group through human review
def predict_with_bias_mitigation(input_data, protected_attr):
    prediction = model.predict(input_data)

    if protected_attr == 'female' and prediction == 'reject':
        # Send to human reviewer before finalizing
        return {'prediction': 'pending_review', 'reviewer_needed': True}

    return prediction
```

**Option 3: Adjust decision thresholds per subgroup**
```python
# Lower threshold for affected group (equalized odds approach)
def predict_with_threshold_adjustment(input_data, protected_attr):
    score = model.predict_proba(input_data)

    threshold = 0.5  # default
    if protected_attr == 'female':
        threshold = 0.4  # lower threshold for females (more approvals)

    return 'approve' if score > threshold else 'reject'
```

**Short-term** (within 1 week):

**1. Retrain with fairness constraints**:
```python
from fairlearn.reductions import ExponentiatedGradient, DemographicParity

# Retrain model with fairness constraint
mitigator = ExponentiatedGradient(
    estimator=model,
    constraints=DemographicParity()  # Equal approval rates across groups
)
mitigator.fit(X_train, y_train, sensitive_features=protected_attr_train)
```

**2. Rebalance training data**:
```python
# Oversample underrepresented group (SMOTE, random oversampling)
from imblearn.over_sampling import SMOTE

smote = SMOTE()
X_resampled, y_resampled = smote.fit_resample(X_train, y_train)
```

**3. Remove biased features**:
```python
# Remove proxy features (zip code → race, name → gender)
features_to_remove = ['zip_code', 'first_name', 'last_name']
X_train = X_train.drop(columns=features_to_remove)
```

### Resolution

**1. Root cause analysis**:
- Data audit: Is training data representative?
- Feature audit: Are proxy features present?
- Model audit: Is model learning biased patterns?

**2. Permanent fix**:
- Retrain with fairness constraints (Fairlearn, AIF360)
- Rebalance training data (oversample, undersample, reweight)
- Remove proxy features
- Add bias testing to CI/CD (automated fairness checks)

**3. Transparency**:
- Update model card (document bias, mitigation steps)
- Communicate to users (if high-stakes: hiring, credit)
- Report to regulators (if required)

**4. Ongoing monitoring**:
- Track fairness metrics (demographic parity, equalized odds)
- Alert if disparity >5% (early warning)
- Quarterly bias audits

### Prevention

- **Bias testing in CI/CD**: Automated fairness checks before deployment
- **Diverse training data**: Ensure representative samples across groups
- **Fairness constraints**: Use fairness-aware ML algorithms
- **Regular audits**: Quarterly bias audits by independent team
- **Transparency**: Publish model cards, fairness metrics

---

## Runbook 4: Data Leak

### Symptoms
- Model outputs PII (social security number, credit card, password)
- Model outputs proprietary information (trade secrets, internal data)
- Model outputs other users' data (privacy violation)
- Regex monitoring flags sensitive data in AI responses

### Impact
- **CRITICAL**: Legal liability (GDPR, CCPA violations)
- Regulatory fines (up to 4% global revenue for GDPR)
- Reputation damage (loss of customer trust)
- Class-action lawsuits (affected users)

### Diagnosis

**1. Confirm data leak**:
```bash
# Search logs for PII patterns (SSN, credit cards, etc.)
aws logs filter-pattern "[SSN_PATTERN]" \
  --log-group-name /aws/ecs/chatbot-api \
  --start-time $(date -d '7 days ago' +%s)000

# SSN_PATTERN example: \d{3}-\d{2}-\d{4}
```

**2. Identify scope**:
- How many users affected? (1 user? 1000 users?)
- What data leaked? (PII? Proprietary? Financial?)
- How long has leak been occurring? (1 day? 6 months?)
- Is data still in logs/backups? (compliance: must delete)

**3. Identify leak source**:
- **Training data contamination**: PII in training data → model memorized
- **Prompt injection**: Attacker extracted data via crafted prompts
- **Logging error**: PII logged in application logs (developer mistake)
- **Model inversion**: Attacker reconstructed training data from model

### Mitigation

**IMMEDIATE** (within 5 minutes):

**Step 1: DISABLE AI SYSTEM**
```bash
# Stop serving immediately
aws ecs update-service \
  --cluster prod \
  --service chatbot-api \
  --desired-count 0

# Or set feature flag
aws ssm put-parameter \
  --name /chatbot/ai-enabled \
  --value false \
  --overwrite
```

**Step 2: Notify security team and legal counsel**
- Page CISO (security)
- Notify legal counsel (compliance, breach notification)
- Create incident channel (#incident-data-leak)

**Step 3: Preserve evidence**
- Take snapshots of logs (for forensics)
- Document timeline and scope
- Do NOT delete logs yet (legal may need them)

**SHORT-TERM** (within 24 hours):

**Step 1: Purge PII from logs**
```bash
# Delete sensitive logs (after preserving evidence)
aws logs delete-log-group --log-group-name /aws/ecs/chatbot-api

# Or redact PII from logs (if must keep for compliance)
# This is complex - consult legal first
```

**Step 2: Identify affected users**
```python
# Parse logs to find affected users
affected_users = set()
for log in logs:
    if contains_pii(log['ai_response']):
        affected_users.add(log['user_id'])

print(f"{len(affected_users)} users affected")
```

**Step 3: Breach notification** (if required):
- **GDPR**: Notify regulator within 72 hours (DPA)
- **CCPA**: Notify affected users within reasonable time
- **Consult legal**: Breach notification laws vary by jurisdiction

**Step 4: Delete leaked data**
```bash
# Delete model if it memorized PII (retrain from scratch)
aws s3 rm s3://models/chatbot-v2.3.tar.gz

# Purge caches (Redis, CDN)
redis-cli FLUSHALL
```

### Resolution

**1. Root cause**:
- Training data audit: Remove PII from training data
- Code audit: Fix logging bugs (don't log PII)
- Security audit: Prevent prompt injection attacks

**2. Retrain model** (PII-free):
```python
# Scrub PII from training data before retraining
def scrub_pii(text):
    # Remove SSN, credit cards, emails, phone numbers, etc.
    text = re.sub(r'\d{3}-\d{2}-\d{4}', '[SSN]', text)  # SSN
    text = re.sub(r'\d{16}', '[CARD]', text)  # Credit card
    text = re.sub(r'[\w.-]+@[\w.-]+', '[EMAIL]', text)  # Email
    return text

training_data = [scrub_pii(doc) for doc in training_data]
model = retrain(training_data)
```

**3. Implement PII detection**:
```python
# Add output filtering (catch PII before sending to user)
import re

PII_PATTERNS = {
    'SSN': r'\d{3}-\d{2}-\d{4}',
    'Credit Card': r'\d{16}',
    'Email': r'[\w.-]+@[\w.-]+',
    'Phone': r'\d{3}-\d{3}-\d{4}',
}

def filter_pii(response):
    for pii_type, pattern in PII_PATTERNS.items():
        if re.search(pattern, response):
            log_security_alert(f"PII detected: {pii_type}")
            return "[Response filtered due to sensitive information]"
    return response
```

**4. Test thoroughly**:
- Red team: Try to extract PII via prompts
- Regression test: Verify no PII in outputs (sample 1000 responses)

**5. Redeploy**:
- Deploy PII-free model to staging
- Test extensively (no leaks?)
- Deploy to production with monitoring

### Prevention

- **PII scrubbing**: Remove PII from training data (automated pipeline)
- **Output filtering**: Regex check for PII in all AI responses (pre-deployment)
- **Differential privacy**: Add noise to training data (prevent memorization)
- **Prompt injection defense**: Input sanitization, output filtering
- **Logging hygiene**: Never log PII (even in debug logs)
- **Regular audits**: Monthly PII leak testing (red team)

---

## Runbook 5: Model Degradation

### Symptoms
- Accuracy dropped from 85% to 65% (>20% drop)
- User satisfaction dropped from 4.5 to 3.0 stars
- "I don't know" rate increased from 10% to 40%
- Support tickets referencing "AI not working"

### Impact
- User frustration (poor experience)
- Feature abandonment (users stop using AI)
- Business impact (conversions drop, support load increases)

### Diagnosis

**1. Confirm degradation**:
```python
# Calculate accuracy over last 7 days
recent_accuracy = calculate_accuracy(last_7_days_data)
baseline_accuracy = 0.85

if recent_accuracy < baseline_accuracy - 0.10:
    print(f"DEGRADATION DETECTED: {recent_accuracy:.1%} (baseline: {baseline_accuracy:.1%})")
```

**2. Check for recent changes**:
```bash
# Recent deployments (last 7 days)
git log --since="7 days ago" --oneline

# Recent config changes
aws ssm get-parameter-history --name /chatbot/config --max-results 10
```

**3. Identify root cause**:
- **Data drift**: Input distribution changed (new user behavior?)
- **Concept drift**: Relationship between inputs/outputs changed (new products launched?)
- **Bad deployment**: Recent code/model change broke functionality
- **Dependency failure**: External API degraded (OpenAI API slow? Database issues?)

### Mitigation

See **Runbook 1** (Hallucination Spike) and **Model Retraining Playbook** for detailed procedures.

**Quick actions**:
- Rollback recent deployment (if within 48 hours)
- Increase confidence threshold (reduce false positives)
- Retrain model (if drift detected)
- Scale up infrastructure (if latency/timeout issues)

---

## Incident Response Checklist

For all incidents, follow this checklist:

**Detect** (0-5 minutes):
- [ ] Incident detected (monitoring alert or user report)
- [ ] Severity assessed (P1/P2/P3/P4)
- [ ] On-call engineer notified

**Assess** (5-15 minutes):
- [ ] Symptoms confirmed (dashboards, logs, user reports)
- [ ] Scope identified (how many users affected?)
- [ ] Root cause hypothesized

**Mitigate** (15-60 minutes):
- [ ] Immediate mitigation applied (rollback, disable, throttle)
- [ ] Incident channel created (#incident-YYYY-MM-DD)
- [ ] Stakeholders notified (leadership, customer success)
- [ ] Status page updated (if user-facing)

**Resolve** (1 hour - 1 week):
- [ ] Root cause identified (logs, traces, code review)
- [ ] Permanent fix implemented (code, config, retrain)
- [ ] Fix tested in staging
- [ ] Fix deployed to production
- [ ] Monitoring confirms resolution

**Review** (within 48 hours for P1, 1 week for P2):
- [ ] Post-incident review completed
- [ ] Timeline documented
- [ ] Root cause confirmed
- [ ] Action items assigned (preventive measures)
- [ ] Runbooks updated

---

## Related Templates

- [Production Alerting Runbook](production-alerting-runbook.md) - Alert definitions and initial response
- [Model Performance Dashboard](model-performance-dashboard.md) - Monitor for degradation
- [Model Retraining Playbook](model-retraining-playbook.md) - Retrain after incidents
- [Disaster Recovery Plan](disaster-recovery-plan.md) - Recover from catastrophic failures
- [AI Governance Policy](ai-governance-policy.md) - Incident response policies
