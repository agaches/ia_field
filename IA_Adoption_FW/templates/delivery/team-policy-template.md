# Team AI Policy Template

> **Purpose**: Establish team-wide guidelines for AI tool usage
> **Used in**: Delivery Phase 2 (Build) - Establish team data policy
> **Update frequency**: Quarterly review, update as needed

---

## Team AI Usage Policy

**Team**: [Team Name]
**Effective Date**: [Date]
**Owner**: [AI Champion + Tech Lead]
**Last Review**: [Date]
**Next Review**: [Date + 3 months]

---

## 1. Data Classification (Team Level)

Extends individual [Data Classification Guide](../shared/data-classification-guide.md) with team context.

### 🟢 SAFE - Always OK to share

**Team context**:
- [ ] Open-source code in team repositories
- [ ] Public documentation and READMEs
- [ ] Anonymized architecture diagrams (no internal URLs/IPs)
- [ ] General technical questions ("How to optimize SQL queries?")
- [ ] Public API endpoints and documentation

**Examples**:
```python
# ✅ Generic code patterns
def calculate_average(numbers):
    return sum(numbers) / len(numbers)
```

---

### 🟡 CAUTION - Requires anonymization

**Team context**:
- [ ] Internal code (remove: URLs, service names, business logic secrets)
- [ ] Meeting notes (remove: names, customer references, financial data)
- [ ] Architecture diagrams (generalize: "Database" not "customer-orders-prod-db")
- [ ] Performance metrics (anonymize real numbers: "50k req/s" → "high traffic")
- [ ] Error messages (remove: stack traces with internal paths)

**Before/After examples**:

```python
# ❌ BEFORE (contains internal specifics)
# if user.subscription == "enterprise_acme_2024":
#     grant_access(premium_features)
#     log_event("acme_access", user_id)

# ✅ AFTER (anonymized for AI sharing)
if user.tier == PREMIUM_TIER:
    grant_access(premium_features)
    log_event("premium_access", user_id)
```

**Architecture diagram rules**:
- ❌ "api.company.internal:8080" → ✅ "Internal API"
- ❌ "customer-orders-prod-db" → ✅ "Orders Database"
- ❌ "10.0.1.5" → ✅ "Private subnet"

---

### 🔴 FORBIDDEN - Never share

**Team context**:
- [ ] Customer data or PII (names, emails, addresses, payment info)
- [ ] Credentials (API keys, passwords, tokens, certificates)
- [ ] Proprietary algorithms or trade secrets
- [ ] Unreleased product information or roadmaps
- [ ] Competitive intelligence or pricing data
- [ ] Legal/HR/Financial sensitive information
- [ ] Security vulnerabilities (before patched)

**Examples**:
```python
# ❌ NEVER SHARE
API_KEY = "sk-abc123..."
customer_email = "john@acme.com"
SECRET_ALGORITHM = "proprietary_logic_here"
PRICING_TIER = {"enterprise": 50000}  # Confidential pricing
```

---

## 2. Code Sharing Rules

### For Code Reviews

**Allowed**:
- ✅ Code snippets with business logic removed/generalized
- ✅ "Review this function for performance issues" (after anonymization)
- ✅ "Suggest better error handling for this pattern"

**Requires anonymization**:
- ⚠️ Remove company-specific service names
- ⚠️ Replace real URLs with placeholders
- ⚠️ Generalize business rules

**Never**:
- ❌ Full files with customer data processing logic
- ❌ Authentication/authorization code with secrets
- ❌ Proprietary algorithms or IP

---

### For Test Generation

**Allowed**:
- ✅ "Generate unit tests for this pure function"
- ✅ Public API contract testing

**Requires approval** (Tech Lead):
- ⚠️ Integration tests with anonymized external services
- ⚠️ E2E tests with mock data only

**Never**:
- ❌ Tests with real customer data
- ❌ Tests exposing security vulnerabilities
- ❌ Tests with production credentials

---

### For Documentation

**Allowed**:
- ✅ API documentation for public/internal APIs
- ✅ Architecture Decision Records (ADRs) - after review
- ✅ README files and developer guides

**Requires review**:
- ⚠️ System architecture diagrams (anonymize first)
- ⚠️ Onboarding documentation (remove internal details)

**Never**:
- ❌ Customer-facing documentation with confidential features
- ❌ Security runbooks or incident playbooks
- ❌ Competitive analysis or strategy documents

---

## 3. Tool Approval Process

### Approved Tools (No approval needed)

**Team AI platforms**:
- ✅ [ChatGPT Team / ChatGPT Enterprise]
- ✅ [Claude Team / Claude Enterprise]

**Code AI tools**:
- ✅ [GitHub Copilot Business]
- ✅ [Cursor Pro / Codeium Teams]

**Documentation**:
- ✅ [Notion AI / Confluence AI]

---

### Approval Required (Before use)

**Champion can approve** (<$50/mo per tool):
- Free trials of new AI tools (max 30 days)
- Individual plugins or extensions
- Team experiments (non-production)

**Tech Lead must approve**:
- Enterprise AI tools or integrations
- API access with custom scripts
- Production system changes

**Manager must approve**:
- Annual contracts
- Tools >$500/month
- New vendor relationships

---

### Prohibited Tools

❌ **Never use**:
- Consumer-grade AI tools for company data (e.g., free ChatGPT)
- Unvetted browser extensions with code access
- AI tools without privacy policies
- Tools that require uploading entire codebases
- Tools that explicitly train on user data

---

## 4. Security Requirements

### Mandatory for All Team Members

- [ ] **MFA enabled** on all AI tool accounts
- [ ] **Privacy opt-out** configured (no model training)
- [ ] **Secrets detection** pre-commit hooks installed
- [ ] **3-second check** before every prompt (data classification)

### Team Infrastructure

- [ ] **API keys** stored in secrets manager (AWS Secrets Manager, Vault, etc.)
- [ ] **Never hardcode** keys in code or CI/CD
- [ ] **Rotate keys** quarterly (scheduled in calendar)
- [ ] **Audit logs** reviewed monthly by Champion

### Code Repository

**.gitignore additions**:
```
# AI-specific ignores
.ai-cache/
.copilot/
*.ai-session
.cursor/
ai-prompts-private/

# Critical ignores
.env
.env.*
*.key
*.pem
secrets/
```

**Pre-commit hooks**:
```bash
# Install detect-secrets
pip install detect-secrets
detect-secrets scan --baseline .secrets.baseline
```

---

## 5. Output Verification Rules

### Mandatory Code Review

**All AI-generated code requires**:
- [ ] Peer review by human developer
- [ ] Automated tests pass
- [ ] Security scan (if touching auth/data)
- [ ] No secrets or sensitive data embedded

**Red flags to check**:
- SQL injection vulnerabilities
- XSS/CSRF risks
- Hardcoded secrets or credentials
- Overly complex or unreadable code
- Missing error handling for critical paths

---

### Fact-Checking Requirements

**For documentation and decisions**:
- [ ] AI claims verified with 2+ authoritative sources
- [ ] Technical recommendations tested in dev environment
- [ ] Architecture suggestions reviewed by senior dev or architect
- [ ] Performance claims benchmarked

---

## 6. Incident Response

### Security Incidents

**If sensitive data shared with AI**:
1. **STOP immediately** - Don't send more data
2. **Screenshot** - Capture what was shared
3. **Delete conversation** - If tool allows
4. **Rotate credentials** - If keys/passwords shared
5. **Report** - Notify Champion and Security team immediately

**Severity levels**:
- 🔴 **CRITICAL** (<5 min response): Customer PII, production credentials
- 🟠 **HIGH** (<1h response): Internal secrets, unreleased product info
- 🟡 **MEDIUM** (<4h response): Anonymization failure, internal IPs
- 🟢 **LOW** (<24h response): Oversharing non-sensitive internal info

**Contact**:
- AI Champion: [@champion] (Slack: #ai-adoption)
- Security Team: security@company.com
- After-hours: [Incident hotline]

---

### Cost Incidents

**If costs spike** (>20% over budget):
1. **Champion investigates** - Check API usage logs
2. **Identify cause** - Which user/tool/script?
3. **Immediate mitigation** - Pause if necessary
4. **Report** - Notify Tech Lead and Manager
5. **Prevent** - Implement quotas or rate limits

---

## 7. Governance

### Decision Authority

| Decision Type | Approval Required | Response Time |
|---------------|-------------------|---------------|
| Tool trials (<$50/mo) | Champion | 1 day |
| Enterprise tools | Tech Lead | 1 week |
| Annual contracts (>$500/mo) | Manager | 2 weeks |
| Experiment launch (low risk) | Champion | 1 day |
| Experiment launch (medium risk) | Tech Lead | 3 days |
| Production changes (high risk) | Team vote | 1 week |

---

### Experiment Risk Levels

**🟢 Low risk** (Champion approves):
- Read-only operations
- No production impact
- Dev/staging only
- Fully reversible

**🟡 Medium risk** (Tech Lead approves):
- Non-critical production changes
- With rollback plan
- Limited user impact
- Quality gates in place

**🔴 High risk** (Team vote required):
- Mission-critical systems
- Customer-facing features
- Irreversible changes
- Financial or legal implications

---

## 8. Training & Support

### Onboarding (New Team Members)

**Required within first week**:
- [ ] Read this policy document
- [ ] Complete [Data Classification Guide](../shared/data-classification-guide.md)
- [ ] Setup approved AI tools with MFA
- [ ] Complete security training (OWASP LLM Top 10)
- [ ] Assign buddy for first 2 weeks

---

### Ongoing Support

**Resources**:
- Team prompt library: [/team-ai-library/](link)
- Weekly office hours: [Champion] - Wednesdays 2-3pm
- Slack channel: #ai-adoption
- Incident reporting: #ai-incidents

**Training cadence**:
- Monthly: Lunch & Learn (30 min deep dive)
- Quarterly: Best practices refresh
- As needed: New tool training

---

## 9. Monitoring & Compliance

### Monthly Reviews (Champion)

- [ ] Cost tracking vs budget
- [ ] Usage metrics (adoption rate)
- [ ] Incident log review
- [ ] Policy violations (if any)
- [ ] Team feedback collection

---

### Quarterly Reviews (Tech Lead + Champion)

- [ ] Policy effectiveness assessment
- [ ] Tool stack optimization
- [ ] Security audit (access logs, key rotation)
- [ ] Update policy if needed
- [ ] Report to management (ROI, metrics)

---

## 10. Policy Acknowledgment

By using AI tools as part of this team, I acknowledge:

- [ ] I have read and understood this policy
- [ ] I will follow data classification rules (🟢🟡🔴)
- [ ] I will verify all AI outputs before using
- [ ] I will report security incidents immediately
- [ ] I understand the consequences of policy violations

**Team Member**: _________________
**Date**: _________________
**Signature**: _________________

---

## Blank Template

Copy and adapt for your team:

```markdown
# [Team Name] AI Usage Policy

**Effective Date**: ________
**Owner**: ________
**Next Review**: ________ (3 months)

---

## 1. Data Classification

### 🟢 SAFE
- [ ] [List team-specific safe items]

### 🟡 CAUTION
- [ ] [List items requiring anonymization]

### 🔴 FORBIDDEN
- [ ] [List never-share items]

---

## 2. Approved Tools

- ✅ [Tool 1]
- ✅ [Tool 2]
- ✅ [Tool 3]

---

## 3. Security Requirements

- [ ] [Requirement 1]
- [ ] [Requirement 2]

---

## 4. Incident Contact

- Champion: [@name] (#channel)
- Security: [email]
```

---

## Related Templates

- [Data Classification Guide](../shared/data-classification-guide.md) - Individual rules
- [Incident Response Process](../shared/incident-response-process.md) - Detailed response steps
- [OWASP LLM Top 10](../shared/owasp-llm-top10.md) - Security awareness
