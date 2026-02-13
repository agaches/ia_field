# 05 - Secure (Delivery)

> Pragmatic security - Implement what you can, manage what you can't

## 1. OWASP LLM Top 10 (Pragmatic)

### Priority Risks (Team Focus: LLM01, LLM06, LLM09)

| Risk | Team Implementation | Tools/Approach |
|------|---------------------|----------------|
| **LLM01: Prompt Injection** | ✅ Input validation for AI code review, sanitization | Pre-commit hooks |
| **LLM02: Insecure Output** | ✅ Output validation in workflows, code scanning | CI checks |
| **LLM03: Data Poisoning** | ⚠️ Manage (provider responsibility) | N/A |
| **LLM04: Model DoS** | ⚠️ Awareness (rate limiting, usage monitoring) | Alerts |
| **LLM05: Supply Chain** | ✅ Vendor validation for new tools | Approval process |
| **LLM06: Info Disclosure** | 🚨 **CRITICAL** - DLP monitoring, data masking, secrets detection | Gitleaks, pre-commit |
| **LLM07: Insecure Plugins** | ✅ Plugin validation, allowlist | Policy |
| **LLM08: Excessive Agency** | ✅ Approval for agent actions, least privilege | Workflows |
| **LLM09: Overreliance** | 🚨 **CRITICAL** - Mandatory validation (code review, tests) | Branch protection |
| **LLM10: Model Theft** | ⚠️ Manage (not applicable, no custom models) | N/A |

## 2. Team Security Controls

### Access Controls (Least Privilege)

| Role | Tools | Permissions |
|------|-------|-------------|
| **Junior Dev** | GitHub Copilot | Autocomplete only |
| **Mid Dev** | Copilot + ChatGPT Team | Code review, docs |
| **Senior Dev** | Copilot + ChatGPT + Claude Code | Full access |
| **Tech Lead** | All tools + admin | Team config |

**Implementation**: GitHub Teams by role, licenses by need, quarterly review.

### DLP Monitoring (Basic)

**What teams CAN do**:
1. **Secrets Detection (local)**: Pre-commit hooks (Gitleaks, TruffleHog)
2. **Data Masking (manual)**: Guidelines, examples, reviews
3. **Usage Monitoring (basic)**: Monthly logs, cost dashboard, escalate if suspicious

**What teams CAN'T do** (and it's OK): Enterprise DLP, real-time monitoring, encryption at use.

### Content Filtering

**For SaaS tools**: Use provider guardrails (enabled by default), configure team settings.

## 3. Code Scanning

### Secrets Detection (CI/CD)

**GitHub Actions**:
```yaml
name: Security Scan
on: [push, pull_request]
jobs:
  secrets:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: gitleaks/gitleaks-action@v2
```

### Static Analysis

**Linters**: pylint, ESLint, golangci-lint
**SAST**: Semgrep (open-source), Snyk (freemium), SonarQube (community)

## 4. Validation Process

### Code Review Checklist (AI Code)

**Security**:
- [ ] No hardcoded secrets
- [ ] No obvious vulnerabilities (SQLi, XSS)
- [ ] Input validation
- [ ] Error handling

**Quality**:
- [ ] Correct logic
- [ ] Adequate tests (coverage > threshold)
- [ ] Team standards
- [ ] Documentation if needed

**AI-specific**:
- [ ] AI code marked in PR
- [ ] Prompt documented (if relevant)
- [ ] Output validated (no hallucinations)

### Testing Requirements

**For critical AI-generated code**:
- Unit tests: 80% coverage minimum, edge cases mandatory
- Integration tests: Full workflows, error cases
- Manual validation: Test locally, smoke tests in staging

## 5. Vendor Validation

### New Tool Process (1-2 weeks)

**Step 1: Tech Lead Evaluation** (1-2 days)
- Security: MFA? SOC2? ISO27001?
- Privacy: Data used for training?
- Cost: Within budget?
- Support: Documentation? Available support?

**Step 2: Trial** (1-2 weeks): 2-3 people test, feedback on security/quality/UX, decide adopt/abandon

**Step 3: Rollout**: Training (1h), internal documentation, monitor adoption

### Vendor Security Checklist

- [ ] SOC2 Type II or ISO27001
- [ ] Appropriate data residency (EU, US, etc.)
- [ ] Clear privacy policy
- [ ] No training data usage (or opt-out)
- [ ] MFA available
- [ ] SSO possible (if required)
- [ ] Audit logs available

## 6. Team Incident Response

### Escalation Process

```
Incident detected → Report to Tech Lead (<1h) → Tech Lead assesses impact → Team level: Resolve internally | Org level: Escalate to IT/Security
```

**Team incidents**: bugs, accidental non-critical sharing
**Org incidents**: secret leaks, compromise, compliance violations

### Basic Playbooks

**Incident: Secret exposed in AI code**
1. <5min: Revoke secret immediately
2. <30min: Check if used (logs)
3. <1h: Notify Tech Lead + IT Security
4. <2h: Quick team post-mortem
5. <24h: Document learnings, adjust process

**Incident: Defective AI code in production**
1. <5min: Immediate rollback
2. <30min: Identify root cause
3. <1h: Fix + tests
4. <2h: Validated redeployment
5. <24h: Post-mortem, improve validation

## 7. Usage Monitoring

### Basic Tracking

**Metrics**: Active users, usage volume (requests, tokens), monthly costs
**Per person**: Daily/weekly usage, anomalies (10x average)
**Dashboard**: Google Sheets/Excel, monthly update, team meeting review

### Basic Alerts

**Trigger if**: Monthly cost >120% budget, individual usage >3x average, unapproved tool used
**Action**: Tech Lead investigates and adjusts

## Secure Checklist

- [ ] Implement secrets detection (pre-commit + CI)
- [ ] Establish AI code review process
- [ ] Configure access controls by role
- [ ] Implement vendor validation process
- [ ] Train team on OWASP LLM Top 10 (focus LLM01, 06, 09)
- [ ] Create team incident response playbook
- [ ] Monitor monthly usage

## Next Step

→ [Phase 6: Manage](06-manage.md) - Manage team AI operations
