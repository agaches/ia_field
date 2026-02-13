# Phase 5: Secure - Secure Your AI Usage

## Discover AI security risks

### OWASP LLM Top 10 (Focus on Critical Risks)

**Critical risks for individual users**:

**LLM06 - Sensitive Information Disclosure** 🚨:
- **Risk**: AI stores/leaks sensitive data you share in prompts
- **Impact**: Data breach, compliance violation, IP theft
- **Prevention**: Never share secrets, PII, confidential data

**LLM09 - Overreliance** ⚠️:
- **Risk**: Trusting AI outputs without verification
- **Impact**: Code bugs, factual errors, biased decisions
- **Prevention**: Always validate, test, and verify

**LLM01 - Prompt Injection**:
- **Risk**: Malicious inputs manipulate AI behavior
- **Impact**: Unexpected outputs, security bypass
- **Prevention**: Be skeptical of AI suggestions, validate outputs

**Other risks to be aware of**:
- LLM02: Insecure output handling
- LLM03: Training data poisoning
- LLM07: Insecure plugin design
- LLM08: Excessive agency

**Full reference**: [OWASP LLM Top 10](https://genai.owasp.org/)

### Risk discovery process

**Before using a new AI tool**:
1. Research tool's security and privacy policies
2. Check if it's approved by your company
3. Review data handling practices
4. Verify encryption and compliance certifications

**Red flags**:
- No clear privacy policy
- No opt-out from training data
- Requires excessive permissions
- Unknown provider or jurisdiction

## Protect AI resources and data

### Secure AI resources

**Account security**:
- [ ] Enable MFA on all AI tool accounts (use authenticator app)
- [ ] Use strong, unique passwords (password manager required)
- [ ] Review active sessions regularly
- [ ] Log out on shared devices
- [ ] Monitor account activity for suspicious access

**Access control**:
- [ ] Don't share AI accounts with colleagues
- [ ] Use organizational accounts when provided
- [ ] Revoke access when changing roles/companies
- [ ] Keep API keys secure if using programmatic access

**Tool security by type**:

| Tool Type | Security Level | Data Handling | Use For |
|-----------|----------------|---------------|---------|
| **Personal free** | ⚠️ Lower | May train on data | Public data only |
| **Personal paid** | ✅ Better | Opt-out available | Personal + some work data* |
| **Corporate** | ✅✅ Best | No training, private | Per company policy |

*Check company policy before sharing any work data

### Secure AI data

**Data protection hierarchy**:

**🔴 NEVER share with AI**:
- Passwords, API keys, tokens, certificates
- Customer data (names, emails, addresses, payment info)
- Confidential IP (proprietary algorithms, trade secrets)
- Personal data of others (colleagues, clients)
- Medical, financial, or legal records

**🟡 Check policy before sharing**:
- Company code (even non-confidential)
- Internal documentation and processes
- Project information and roadmaps
- Business metrics and analytics

**🟢 Safe to share**:
- Open-source code
- Public documentation
- General knowledge questions
- Anonymized examples (truly anonymous)

**Data sanitization**:
- Remove names, emails, IDs before sharing
- Use placeholders: `user123`, `example.com`
- Scrub code of secrets before pasting
- Review prompt before sending

**Privacy settings checklist**:
- [ ] **ChatGPT**: Settings → Data Controls → Disable "Improve the model for everyone"
- [ ] **GitHub Copilot**: Settings → Check suggestions matching public code
- [ ] **Claude**: Review data retention settings
- [ ] **All tools**: Enable "Do not use my data for training" if available

## Detect AI security threats

### Threat detection practices

**Warning signs of compromise**:
- Unrecognized login attempts
- Unexpected account activity
- Changes you didn't make
- Emails about password resets you didn't request
- Suspicious AI responses suggesting account tampering

**Monitor for**:
- Failed login attempts (check account logs)
- Active sessions from unknown locations
- API usage spikes (if using APIs)
- Unusual billing or usage patterns

### Incident response

**If you accidentally exposed sensitive data**:

**1. Immediate action (< 5 minutes)**:
- Stop using the AI tool immediately
- If credentials exposed: Revoke/rotate them NOW
- If API keys exposed: Disable/regenerate immediately
- Document what was shared

**2. Short-term response (< 1 hour)**:
- Open IT security ticket (label: "AI Security Incident")
- Notify your manager if significant
- Follow company incident response procedures

**3. Report details**:
```
- Tool used: [ChatGPT, Claude, etc.]
- Data type exposed: [API key, customer data, etc.]
- When: [Timestamp]
- Actions taken: [Key rotated, account locked, etc.]
- Potential impact: [Who/what might be affected]
```

**If account compromised**:
1. Change password immediately
2. Revoke all active sessions
3. Enable MFA if not already active
4. Review account activity logs
5. Report to tool provider and IT

### Security monitoring tools

**Available tools**:
- Password manager's security audit
- AI tool's account activity logs
- Company security monitoring (if provided)
- Email alerts for account changes

**Monthly security check** (10 minutes):
- [ ] Review AI account activity logs
- [ ] Check for unrecognized sessions
- [ ] Verify MFA still active
- [ ] Update passwords if needed
- [ ] Review privacy settings still correct

## Training and awareness

**Required training**:
- **AI Security Awareness** (2 hours, annual)
- **OWASP LLM Top 10** (1 hour reading)
- **Company security policy** (per company schedule)

**Continuous learning**:
- Follow AI security news
- Review tool security updates
- Participate in security awareness programs
- Share learnings with team

## Secure Checklist

- [ ] MFA enabled on all AI accounts
- [ ] Password manager installed and used
- [ ] OWASP LLM Top 10 reviewed (focus: LLM06, LLM09)
- [ ] Privacy settings configured on all tools
- [ ] Data classification rules memorized
- [ ] Incident reporting process known
- [ ] Security monitoring routine established
- [ ] AI Security training completed

## Next Step

→ [Phase 6: Manage](06-manage.md) - Manage your AI productivity
