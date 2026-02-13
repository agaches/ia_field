# Phase 4: Govern - Individual AI Governance

## Assess AI organizational risks

### Individual risk categories

**Primary risks for individual users**:

| Risk Category | Description | Impact Level |
|---------------|-------------|--------------|
| **Data Leakage** | Accidentally sharing sensitive company/customer data | 🔴 Critical |
| **Credential Exposure** | Sharing passwords, API keys, secrets in prompts | 🔴 Critical |
| **Overreliance** | Blind trust in AI outputs without verification | 🟡 Medium |
| **IP Violation** | Using AI-generated code/content without checking licenses | 🟡 Medium |
| **Policy Non-compliance** | Violating company AI usage rules | 🟡 Medium |
| **Account Compromise** | Weak passwords, no MFA on AI accounts | 🟠 High |

**Risk ownership**: You are personally responsible for what you share with AI and how you use its outputs.

### Risk assessment questions

Ask yourself before each AI interaction:
- Does this prompt contain sensitive data?
- Am I allowed to share this with the AI tool I'm using?
- Will I verify the output before using it?
- Could this violate company policy or legal requirements?

## Document AI governance policies

### Personal usage policies

**Data sharing policy**:

| Data Type | Examples | AI Sharing |
|-----------|----------|------------|
| **Public** | Open-source code, public docs | ✅ Allowed |
| **Internal** | Project docs, internal emails | ⚠️ Check company policy |
| **Confidential** | Contracts, customer data, financials | ❌ Forbidden |
| **Secret** | Passwords, API keys, credentials | ❌ Never |

**Tool selection policy**:
- Use only company-approved tools (check with IT)
- If no approved list: use reputable providers with privacy guarantees
- Personal tools: ensure privacy settings configured correctly

**Output handling policy**:
- Always verify AI outputs before using
- Test code before committing
- Check facts and references
- Review for bias and quality

### Documentation requirements

Keep simple records:
- Tools you're using and why
- Types of data you share (general categories)
- Incidents or concerns encountered
- Training completed

## Enforce AI governance policies

### Self-enforcement practices

**Daily checklist**:
- [ ] Review prompt before sending (sensitive data?)
- [ ] Verify AI output before using
- [ ] Use approved tools only
- [ ] Follow data classification rules

**Weekly review** (5 minutes):
- [ ] Check tool usage against policy
- [ ] Review any close calls or mistakes
- [ ] Update personal documentation if needed

### Training requirements

**AI Awareness Training** (2 hours, annual):
- AI concepts and capabilities
- OWASP LLM Top 10 security risks
- Company policy and procedures
- Data classification and handling
- Incident reporting process

**Resources**:
- [OWASP LLM Top 10](https://genai.owasp.org/)
- AI tool vendor security guides
- Company-specific training materials

### Accountability measures

**Personal accountability**:
- You own your AI interactions and outputs
- Ignorance of policy is not an excuse
- Report mistakes promptly to IT

**Consequences of non-compliance**:
- Data breach: Security incident, potential disciplinary action
- Policy violation: Warning, training requirement, tool access removal
- Repeated violations: Escalation per company policy

## Monitor AI organizational risks

### Continuous monitoring practices

**Self-monitoring** (ongoing):
- Track what data types you're sharing
- Note any suspicious AI behavior
- Monitor for policy changes
- Stay aware of new risks

**Monthly review** (15 minutes):
- Review tool usage logs if available
- Assess risk exposure (any close calls?)
- Check for policy updates
- Verify security settings still correct

### Incident identification

**What constitutes an incident**:
- ❌ Shared sensitive data with AI tool
- ❌ Exposed credentials or API keys
- ❌ AI generated problematic output you almost used
- ❌ Account compromise suspected
- ❌ Violated company policy

**Recognition triggers**:
- "Oops, I shouldn't have shared that"
- "This AI output could be wrong/biased/harmful"
- "I can't log into my AI account"
- "Someone accessed my account"

### Incident reporting

**Immediate response** (if sensitive data exposed):
1. **Stop**: Don't share more data
2. **Act**: Revoke/change compromised credentials immediately
3. **Report**: Contact IT within 1 hour

**Standard reporting** (non-urgent issues):
1. **Document**: What happened, which tool, when, data type
2. **Report**: Open IT ticket with "AI Security Incident" label
3. **Follow up**: Implement corrective actions IT recommends

**Reporting template**:
```
- Date/Time: [When did it happen?]
- Tool used: [Which AI service?]
- Issue: [What went wrong?]
- Data involved: [What type of data?]
- Actions taken: [What did you do already?]
- Impact: [Who/what might be affected?]
```

**Rule**: Honest mistakes happen. React quickly and report promptly.

## Govern Checklist

- [ ] Complete risk assessment for your usage
- [ ] Document personal AI usage policies
- [ ] Complete AI Awareness training (2h)
- [ ] Set up self-monitoring routine
- [ ] Know how to report incidents to IT
- [ ] Configure MFA on all AI accounts
- [ ] Review policies monthly

## Next Step

→ [Phase 5: Secure](05-secure.md) - Secure your AI usage
