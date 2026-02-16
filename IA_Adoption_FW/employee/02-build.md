# Phase 2: Build

> **Goal**: Secure setup and reliable configuration
> **Time**: 4 hours
> **Output**: Hardened accounts + Configured environment + Backup plan

---

## 1. Harden Your Accounts

### Security Essentials

- [ ] **MFA/2FA**: Enable on ALL AI tools (mandatory, non-negotiable)
- [ ] **Strong password**: Unique password in password manager
- [ ] **Privacy settings**: Opt-out of "Use my data for training"
- [ ] **Session timeout**: Set logout on browser close (if available)

**Test**: Can you login without your phone? (Answer should be NO)

### Account Review

- [ ] Review connected apps/integrations
- [ ] Check authorized devices
- [ ] Verify billing details
- [ ] Save recovery codes in password manager

---

## 2. Configure Development Environment

*(Skip this section if you're not a developer)*

### IDE/Editor Setup

- [ ] Install AI extension (Copilot/Cursor/Codeium)
- [ ] Configure privacy: Disable "Share code snippets"
- [ ] Set up keybindings for AI features
- [ ] Test on non-sensitive code first

### Repository Security

- [ ] Verify `.gitignore` includes:
  - `.env` and `.env.*`
  - `*.key`, `*.pem`, `*.crt`
  - IDE-specific AI cache folders
- [ ] Install pre-commit hooks for secret detection
- [ ] Review AI extension data sharing settings

📋 **Reference**: Check company coding policies for AI-assisted development

---

## 3. Understand Key Security Risks

**Focus on the 2 critical risks for individual usage:**

### Risk 1: Sensitive Info Disclosure (OWASP LLM06)
**Threat**: You leak confidential data to the AI provider

**Mitigation**:
- [ ] Always sanitize prompts (remove names, emails, keys)
- [ ] Use placeholders: `USER_EMAIL` instead of `john@company.com`
- [ ] Review prompt before hitting Enter
- [ ] When in doubt, don't share it

### Risk 2: Overreliance (OWASP LLM09)
**Threat**: You trust AI output blindly without verification

**Mitigation**:
- [ ] **Always** verify facts and citations
- [ ] **Always** test generated code
- [ ] Cross-check critical information with 2+ sources
- [ ] Use AI as assistant, not decision-maker

📋 **Full reference**: [OWASP LLM Top 10](../templates/shared/owasp-llm-top10.md)
---

## 4. Establish Backup & Reliability

**AI services go down. Don't get blocked.**

### Backup Strategy

- [ ] **Primary tool**: [Your main AI tool]
- [ ] **Backup tool**: [Alternative if primary fails]
- [ ] **Status pages bookmarked**:
  - OpenAI: https://status.openai.com
  - Anthropic: https://status.anthropic.com
  - GitHub: https://www.githubstatus.com

### Offline Fallback

- [ ] Save critical prompts locally (text file or notes app)
- [ ] Keep traditional workflow documented
- [ ] Know how to work without AI (don't become dependent)

**Test**: Simulate primary tool outage. Can you switch to backup in <5 minutes?

---

## 5. Setup Cost Tracking

Even at $20-50/month, track where your money goes.

### Initial Budget

- Tool 1: $___/month
- Tool 2: $___/month
- **Total**: $___/month
- **Break-even**: ___ hours saved/month (at your hourly rate)

📋 **Tool**: [Cost & ROI Tracking](../templates/employee/cost-roi-tracking.md)
### Billing Alerts

- [ ] Set spending alert at 80% of budget
- [ ] Set hard limit (if provider allows)
- [ ] Review charges monthly

---

## Phase 2 Checklist

Complete before moving to Phase 3:

### Security ✅
- [ ] MFA enabled on all AI tools
- [ ] Privacy settings verified (opt-out of training)
- [ ] Strong, unique passwords in password manager
- [ ] Recovery codes saved

### Configuration ✅
- [ ] IDE extensions configured (if applicable)
- [ ] Repository `.gitignore` verified (if applicable)
- [ ] Data classification rules reviewed

### Reliability ✅
- [ ] Backup tool selected and account created
- [ ] Status pages bookmarked
- [ ] Offline fallback plan documented

### Cost Management ✅
- [ ] Budget defined
- [ ] Cost tracking setup
- [ ] Billing alerts configured

**Estimated time**: 4 hours total

---

**Next**: [Phase 3: Run](03-run.md) - Daily operations and optimization
