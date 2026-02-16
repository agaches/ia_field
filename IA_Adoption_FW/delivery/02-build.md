# Phase 2: Build

> **Goal**: Deploy infrastructure, establish team policies, implement security controls
> **Time**: 2-3 weeks
> **Output**: Team environment ready + Policies documented + Security configured

---

## 1. Deploy Team Infrastructure

### Tool Deployment

**Team AI Platforms**:
- [ ] Upgrade to team plans (ChatGPT Team, Claude Team)
- [ ] Add all team members
- [ ] Configure shared workspaces
- [ ] Set up team libraries (prompts, workflows)

**Code AI Tools**:
- [ ] Deploy GitHub Copilot Business (or alternative)
- [ ] Configure IDE extensions team-wide
- [ ] Set organization policies
- [ ] Test on sample projects

**API Access** (for integrations):
- [ ] Create team API accounts
- [ ] Set spending limits
- [ ] Configure rate limiting
- [ ] Secure API keys (secrets manager)

### Integration Setup

**CI/CD Integration**:
```yaml
# Example: AI-powered code review in GitHub Actions
name: AI Code Review
on: [pull_request]
jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: AI Review
        run: |
          # Call AI API for code analysis
          # Post results as PR comment
```

- [ ] AI code review automation
- [ ] Test generation in CI
- [ ] Documentation generation on merge
- [ ] Security scanning (OWASP LLM risks)

**Documentation Integration**:
- [ ] Confluence/Notion AI enabled
- [ ] Auto-generate meeting notes
- [ ] Template library setup
- [ ] Search enhancement configured

---

## 2. Establish Team Data Policy

📋 **Template**: [Team Policy Template](../templates/delivery/team-policy-template.md)
### Team Data Classification

Extend individual [Data Classification](../templates/shared/data-classification-guide.md) for team context:

**🟢 SAFE** (Team level):
- Open-source code in team repos
- Public documentation
- Anonymized architecture diagrams
- General technical questions

**🟡 CAUTION** (Requires anonymization):
- Internal code (remove business logic, URLs, secrets)
- Meeting notes (remove names, customer references)
- Architecture diagrams (generalize company specifics)
- Performance metrics (anonymize real numbers)

**🔴 FORBIDDEN** (Never share):
- Customer data or PII
- Credentials, API keys, secrets
- Proprietary algorithms or trade secrets
- Unreleased product information
- Competitive intelligence

### Code Sharing Rules

**Allowed**:
```python
# ✅ Generic code patterns
def process_data(df):
    return df.dropna().sort_values('timestamp')
```

**Requires anonymization**:
```python
# ⚠️ Before sharing
# Remove: company URLs, service names, business logic
# if user.subscription == "enterprise":
#     grant_access(premium_features)

# After anonymization:
if user.tier == PREMIUM_TIER:
    grant_access(premium_features)
```

**Never share**:
```python
# ❌ Proprietary algorithms, secrets, customer data
API_KEY = "sk-abc123..."
customer_email = "john@client.com"
```

---

## 3. Implement Team Security Controls

### Access Controls

- [ ] **Team admin** assigned (AI champion + backup)
- [ ] **Role-based access**: Admin, Member, Viewer
- [ ] **Shared workspace** permissions configured
- [ ] **API key rotation** schedule (quarterly minimum)

### Secrets Management

**For team integrations**:
```bash
# Use secrets manager (AWS Secrets Manager, HashiCorp Vault, etc.)
# NEVER hardcode API keys in code or CI/CD

# Good: Environment variables from secrets manager
API_KEY=$(aws secretsmanager get-secret-value --secret-id ai-api-key)

# Bad: Hardcoded
# API_KEY="sk-abc123..."  ❌
```

- [ ] All AI API keys in secrets manager
- [ ] No keys in code or config files
- [ ] Rotate keys quarterly (calendar reminder)
- [ ] Audit access logs monthly

### Code Repository Security

**.gitignore additions**:
```
# AI-specific ignores
.ai-cache/
.copilot/
*.ai-session
.cursor/
ai-prompts-private/

# Existing critical ignores
.env
.env.*
*.key
*.pem
secrets/
```

**Pre-commit hooks**:
```bash
# Add secret detection
pip install detect-secrets
detect-secrets scan --baseline .secrets.baseline
```

- [ ] `.gitignore` updated team-wide
- [ ] Pre-commit hooks installed
- [ ] Secret scanning automated
- [ ] Branch protection rules enabled

---

## 4. Team Training & Onboarding

### Training Program (1 week, ~10h)

| Day | Duration | Content |
|-----|----------|---------|
| 1 | 2h | Framework overview, policies, tool setup |
| 2-3 | 4h | Hands-on: prompting, code AI, workflow integration |
| 4 | 2h | First experiment launch, buddy assignments |
| 5 | 1h | Early wins sharing, Q&A |

📋 **Resources**: [TRAINING.md](../TRAINING.md) - Level 2→3 path

### Buddy System

Pair Level 2+ with Level 1 team members:
- [ ] Buddy pairs assigned
- [ ] Weekly 30min sync scheduled
- [ ] Knowledge sharing encouraged
- [ ] Progress tracked

---

## 5. Establish Team Governance

### Decision-Making

**AI Tool Approval**:
- **Champion** can approve: Free trials, team tools <$50/mo
- **Tech Lead** must approve: Enterprise tools, integrations
- **Manager** must approve: Annual contracts, >$500/mo

**Experiment Approval**:
- **Low risk**: Champion approves (read-only, no production impact)
- **Medium risk**: Tech Lead approves (dev/staging only)
- **High risk**: Team vote required (production changes)

### Incident Response

Extend individual [Incident Response](../templates/shared/incident-response-process.md) for team:

**Team-specific incidents**:
- Shared API key leaked → Champion rotates immediately, notifies team
- Customer data shared → Escalate to Legal/Security, team-wide alert
- Costly API abuse → Champion pauses API access, investigates

**Team notification**:
```
Team incident notification (Slack/Teams):

⚠️ AI SECURITY INCIDENT ⚠️
Type: [API key leak / Data exposure / etc.]
Severity: [CRITICAL/HIGH/MEDIUM]
Status: [Contained / Investigating / Resolved]
Actions: [What team should do]
Contact: @ai-champion for questions
```

---

## 6. Setup Monitoring & Cost Tracking

### Cost Dashboard

Track team AI spending:

| Tool | Users | Cost/User | Monthly Total | Budget | Variance |
|------|-------|-----------|---------------|--------|----------|
| ChatGPT Team | 10 | $30 | $300 | $350 | ✅ |
| Copilot Business | 10 | $19 | $190 | $200 | ✅ |
| API Credits |  |  | $450 | $400 | ⚠️ +13% |
| **Total** |  |  | **$940** | **$950** | ✅ |

- [ ] Monthly cost review scheduled
- [ ] Spending alerts configured (80%, 100%)
- [ ] Per-user usage tracked
- [ ] ROI calculated monthly

### Usage Monitoring

- [ ] API usage dashboard (requests, tokens, errors)
- [ ] Team adoption metrics (daily active users)
- [ ] Feature usage (which AI tools used most)
- [ ] Anomaly detection (unusual spikes)

---

## Phase 2 Checklist

Complete before moving to Phase 3:

### Infrastructure ✅
- [ ] Team tools deployed and tested
- [ ] All team members have access
- [ ] Integrations configured (CI/CD, docs, etc.)
- [ ] API keys secured in secrets manager

### Policies ✅
- [ ] Team data policy documented and shared
- [ ] Code sharing rules clear
- [ ] Governance process established
- [ ] Incident response plan ready

### Security ✅
- [ ] Access controls configured
- [ ] `.gitignore` and pre-commit hooks deployed
- [ ] Secret scanning automated
- [ ] Quarterly rotation scheduled

### Team Readiness ✅
- [ ] Training completed (all members)
- [ ] Buddy system active
- [ ] AI champion available (office hours)
- [ ] Knowledge base established

### Operations ✅
- [ ] Cost tracking dashboard setup
- [ ] Usage monitoring active
- [ ] Monthly review scheduled
- [ ] Spending alerts configured

**Estimated time**: 2-3 weeks total

---

**Next**: [Phase 3: Run](03-run.md) - Collective operations and continuous improvement
