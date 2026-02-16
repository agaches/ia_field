# Data Classification Guide

> **Purpose**: Know what data is safe/unsafe to share with AI tools
> **Applies to**: All frameworks (Employee, Delivery, Automation)
> **Rule**: When in doubt, don't share it

---

## The Traffic Light System

### 🟢 SAFE - Always OK

**Public information and open resources**:
- [ ] Public documentation (GitHub README, official docs)
- [ ] Open-source code (MIT, Apache, GPL licensed)
- [ ] General knowledge questions
- [ ] Public website content
- [ ] Published articles and papers
- [ ] Your own personal notes (non-work)
- [ ] Anonymized examples without context

**Example prompts**:
```
✅ "Explain OAuth 2.0 authentication flow"
✅ "Debug this React component: [public OSS code]"
✅ "Summarize this public research paper"
```

---

### 🟡 CAUTION - Check Policy First

**Internal information requiring anonymization**:
- [ ] Internal project names → Use "Project X"
- [ ] Meeting notes → Remove names, emails, specifics
- [ ] Architecture diagrams → Remove company-specific details
- [ ] Code snippets → Remove internal URLs, keys, business logic
- [ ] Performance data → Anonymize metrics, remove real numbers

**Anonymization rules**:
- Replace real names: `john.doe@company.com` → `USER_EMAIL`
- Mask IDs: `customer_id: 12345` → `customer_id: XXXXX`
- Remove URLs: `https://internal.company.com` → `https://example.com`
- Generalize numbers: `Revenue: $5.2M` → `Revenue: $X million`

**Example prompts**:
```
⚠️ "Review this code for [PROJECT_NAME] feature"  (anonymized)
⚠️ "Summarize meeting about [INITIATIVE]"  (names removed)
⚠️ "Optimize SQL query for [DATABASE_TABLE]"  (schema generalized)
```

**Check your company policy** - some organizations prohibit any internal data, even anonymized.

---

### 🔴 FORBIDDEN - Never Share

**Sensitive information - NEVER paste into AI**:

#### Credentials & Secrets
- ❌ Passwords, passphrases, PINs
- ❌ API keys, tokens, secrets
- ❌ SSH keys, certificates, private keys
- ❌ Database connection strings
- ❌ OAuth client secrets
- ❌ Encryption keys

#### Personal Data (GDPR/CCPA)
- ❌ Customer names, emails, phone numbers
- ❌ Employee personal information
- ❌ Social security numbers, tax IDs
- ❌ Credit card numbers, bank accounts
- ❌ Health information (HIPAA)
- ❌ Biometric data

#### Business Confidential
- ❌ Proprietary algorithms or code
- ❌ Trade secrets, IP
- ❌ Unreleased product plans
- ❌ Financial statements (non-public)
- ❌ M&A information
- ❌ Customer contracts, pricing

#### Regulated Data
- ❌ ITAR/Export controlled
- ❌ Law enforcement data
- ❌ Attorney-client privileged
- ❌ Medical records
- ❌ Financial audit data

**Example bad prompts** ❌:
```
❌ "Debug login with password: hunter2"
❌ "Analyze sales for customer john.smith@client.com"
❌ "Review contract with [REAL COMPANY NAME]"
❌ "Format this: API_KEY=sk-abc123xyz..."
```

---

## Cloud Provider Specifics

Different risk levels based on AI service type:

### Consumer AI (ChatGPT, Claude, Gemini)
- **Data Usage**: May train on your inputs (unless opted out)
- **Retention**: Stored 30+ days for abuse monitoring
- **Access**: Third-party vendor
- **Use for**: 🟢 Public data only (unless enterprise account)

### Enterprise AI (ChatGPT Team/Enterprise, Claude Team)
- **Data Usage**: Opt-out by default, no training
- **Retention**: Configurable (30 days → 0 days)
- **Access**: Vendor with BAA/DPA
- **Use for**: 🟢🟡 Public + Anonymized internal (with approval)

### Self-Hosted AI (On-premise LLMs)
- **Data Usage**: Never leaves your infrastructure
- **Retention**: You control
- **Access**: Internal only
- **Use for**: 🟢🟡🔴 All data (with proper security)

**Rule**: Consumer AI = Public data only. Enterprise AI = Check policy. Self-hosted = All data allowed.

---

## Risk Assessment Matrix

When unsure, use this decision tree:

```
Is this data public?
├─ YES → 🟢 Safe to share
│
└─ NO → Would it harm if leaked?
    ├─ NO → 🟡 Anonymize first, then share
    │
    └─ YES → Is it regulated or confidential?
        ├─ YES → 🔴 Never share
        └─ NO → 🟡 Get manager approval
```

---

## Industry-Specific Rules

### Healthcare (HIPAA)
- 🔴 **Never**: Patient names, MRNs, diagnoses, treatments
- 🟡 **Caution**: De-identified data (following Safe Harbor rules)
- 🟢 **Safe**: General medical questions, public research

### Finance (PCI-DSS, SOX)
- 🔴 **Never**: Card numbers, account numbers, SSNs, trades
- 🟡 **Caution**: Anonymized transaction patterns
- 🟢 **Safe**: Public market data, general finance questions

### Government (ITAR, CUI)
- 🔴 **Never**: Export-controlled, classified, CUI
- 🟡 **Caution**: Internal docs (check agency policy)
- 🟢 **Safe**: Public information only

### Legal
- 🔴 **Never**: Client names, case details, privileged communications
- 🟡 **Caution**: Hypothetical scenarios (no real case facts)
- 🟢 **Safe**: General legal principles, public case law

---

## Code-Specific Rules

### Safe to Share
```python
# ✅ Generic algorithms
def bubble_sort(arr):
    for i in range(len(arr)):
        for j in range(len(arr) - 1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

# ✅ Stack Overflow code (cite source)
# ✅ Open-source dependencies
```

### Needs Anonymization
```python
# ⚠️ Remove company-specific logic
# Before:
if user.company == "Acme Corp" and user.tier == "enterprise":
    apply_custom_discount(0.25)

# After (anonymized):
if user.tier == "enterprise":
    apply_discount(DISCOUNT_RATE)
```

### Never Share
```python
# ❌ Secrets
API_KEY = "sk-abc123xyz..."

# ❌ Proprietary algorithms
def calculate_risk_score(user):
    # Complex proprietary logic
    pass

# ❌ Real customer data
customers = [{"email": "john@client.com", ...}]
```

---

## Verification Checklist

Before pasting ANYTHING into an AI tool:

- [ ] Contains no passwords, keys, or credentials?
- [ ] Contains no customer/employee names or contact info?
- [ ] Contains no proprietary business logic?
- [ ] Contains no regulated data (HIPAA, PCI, etc.)?
- [ ] Is this data publicly available or anonymized?
- [ ] Have I reviewed my company's AI usage policy?

**If ANY answer is NO or unsure → DON'T PASTE IT**

---

## Company Policy Template

If your organization doesn't have an AI policy, propose this:

**Tier 1 - Individual Use (Employee Framework)**:
- 🟢 Public data only
- 🟡 Internal data forbidden (even anonymized)
- 🔴 All confidential/personal data forbidden
- Tools: Consumer AI only (personal accounts)

**Tier 2 - Team Use (Delivery Framework)**:
- 🟢 Public data
- 🟡 Anonymized internal data (with approval)
- 🔴 All confidential/personal data forbidden
- Tools: Enterprise AI with DPA/BAA

**Tier 3 - Production Use (Automation Framework)**:
- 🟢 Public data
- 🟡 Internal data (approved use cases)
- 🔴 Customer data (only with self-hosted or approved vendors)
- Tools: Enterprise AI or self-hosted

---

## Common Mistakes

### ❌ Mistake 1: "It's already public on our website"
**Issue**: Company website might have contact forms with emails
**Fix**: Use https://example.com in examples, not real URLs

### ❌ Mistake 2: "I anonymized names but kept email format"
**Issue**: `user123@company.com` still leaks company name
**Fix**: Use `user@example.com` or generic `USER_EMAIL`

### ❌ Mistake 3: "It's just one small secret in 500 lines"
**Issue**: AI and attackers can extract secrets from large pastes
**Fix**: Remove ALL secrets, even if buried in code

### ❌ Mistake 4: "Nobody will see my private chat"
**Issue**: AI providers scan for abuse, may train on data
**Fix**: Assume everything you paste is public

### ❌ Mistake 5: "I'll delete the chat after"
**Issue**: Data retained 30+ days, cannot be unshared
**Fix**: Don't share it in the first place

---

## Incident Response

If you accidentally shared forbidden data:

**See**: [Incident Response Process](incident-response-process.md)

**Immediate actions** (within 5 minutes):
1. STOP the conversation
2. SCREENSHOT what was shared
3. ROTATE credentials immediately
4. REPORT to IT/Security

---

## Resources

**GDPR**: https://gdpr.eu/
**CCPA**: https://oag.ca.gov/privacy/ccpa
**HIPAA**: https://www.hhs.gov/hipaa
**PCI-DSS**: https://www.pcisecuritystandards.org/
**NIST Privacy Framework**: https://www.nist.gov/privacy-framework

**Questions?** Contact your:
- Security team for data classification
- Legal team for regulatory questions
- Privacy officer for personal data
- Manager for internal policy interpretation

---

**Remember**: The 3-second rule prevents 99% of incidents.
**Before every paste**: Does this contain sensitive data? When in doubt, don't share it.
