# Incident Response Process

> **Purpose**: Step-by-step actions when sensitive data is accidentally shared with AI
> **Time to act**: Within 5 minutes for critical incidents
> **Remember**: Fast response minimizes damage. Everyone makes mistakes.

---

## Incident Severity Levels

Determine severity to prioritize response:

| Severity | Description | Examples | Response Time |
|----------|-------------|----------|---------------|
| **🔴 CRITICAL** | Credentials or customer PII exposed | Passwords, API keys, SSNs, credit cards | **Immediate** (<5 min) |
| **🟠 HIGH** | Proprietary or regulated data exposed | Trade secrets, HIPAA data, source code | **Urgent** (<1 hour) |
| **🟡 MEDIUM** | Internal non-public data exposed | Internal emails, project names, metrics | **Priority** (<4 hours) |
| **🟢 LOW** | Ambiguous or edge-case data shared | Unsure if sensitive, minor policy breach | **Normal** (<24 hours) |

---

## CRITICAL Incident Response (🔴)

### Phase 1: Immediate Actions (Within 5 minutes)

**1. STOP** ⏹️
- [ ] **Close the AI tool** immediately
- [ ] **Do NOT continue the conversation**
- [ ] **Do NOT try to delete or edit** (already recorded)

**2. SCREENSHOT** 📸
- [ ] **Capture what was shared** (full context)
- [ ] Include timestamps
- [ ] Save securely (password-protected file)
- [ ] This is evidence for incident report

**3. ROTATE** 🔄
**This is THE most critical step - do it NOW:**

| What Was Leaked | Immediate Action | Where to Rotate |
|-----------------|------------------|-----------------|
| **Password** | Change password on affected account | Account settings |
| **API Key** | Revoke key, generate new one | API dashboard/console |
| **OAuth Token** | Invalidate token/session | OAuth provider |
| **SSH Key** | Remove from authorized_keys, generate new | Server + local machine |
| **Database Credentials** | Change DB password, update apps | Database admin panel |
| **Certificate** | Revoke cert, issue new one | Certificate authority |
| **Encryption Key** | Rotate key, re-encrypt data | Key management system |

**Example rotation steps**:
```bash
# API Key rotation (example)
1. Login to provider dashboard
2. Click "Revoke" on exposed key
3. Generate new key
4. Update all applications using the key
5. Test applications still work
6. Confirm old key is invalid
```

**4. REPORT** 📢
- [ ] **Notify your manager** (within 15 minutes)
- [ ] **Contact IT Security** (incident@ email or Slack)
- [ ] **Do NOT delay** - "minor" leaks can cascade

---

### Phase 2: Containment (Within 1 hour)

**5. ASSESS BLAST RADIUS**

- [ ] What systems use the exposed credential?
- [ ] What data could be accessed with it?
- [ ] Were there any suspicious access attempts? (check logs)
- [ ] Is the credential used elsewhere? (rotation needed there too)

**6. NOTIFY STAKEHOLDERS**

| Incident Type | Who to Notify | Information Needed |
|---------------|---------------|-------------------|
| Customer PII | Legal, Privacy Officer, DPO | What data, how many affected |
| Company Secret | CTO, Legal, Affected team | What was exposed, impact |
| Regulated Data | Compliance, Legal, Auditors | Data type, regulatory requirements |
| Credentials | Security, DevOps, Affected systems | What systems, rotation status |

**7. CONTAINMENT ACTIONS**

- [ ] Isolate affected systems (if breach suspected)
- [ ] Force logout all sessions (if password leaked)
- [ ] Block suspicious IPs (if unusual access detected)
- [ ] Temporarily disable account (if massive exposure)

---

### Phase 3: Documentation (Within 24 hours)

**8. INCIDENT REPORT**

Complete the incident report template (see below) with:
- What was shared (be specific)
- When it happened (timestamp)
- How it happened (rushed, unclear policy, mistake)
- What was exposed (systems, data types)
- Actions taken (rotation, notifications)
- Root cause (why did this happen?)

**9. IMPACT ASSESSMENT**

- [ ] Was data accessed by unauthorized party? (check AI provider logs if possible)
- [ ] What is the worst-case scenario?
- [ ] Are customers/users affected?
- [ ] Is regulatory notification required? (GDPR 72h, HIPAA 60 days, etc.)

---

### Phase 4: Prevention (Within 1 week)

**10. ROOT CAUSE ANALYSIS**

Why did this happen?
- [ ] Lack of awareness (didn't know it was sensitive)
- [ ] Process failure (no verification step)
- [ ] Policy unclear (ambiguous rules)
- [ ] Time pressure (rushed, didn't check)
- [ ] Tool confusion (thought it was private)

**11. PREVENTIVE ACTIONS**

- [ ] Implement additional safeguard (e.g., secret detection tool)
- [ ] Update personal checklist (add verification step)
- [ ] Request policy clarification (if ambiguous)
- [ ] Share learning with team (anonymized case study)
- [ ] Consider tool change (if persistent privacy issues)

---

## HIGH Incident Response (🟠)

Follow CRITICAL response but with adjusted timelines:
- Phase 1: Within 1 hour
- Phase 2: Within 4 hours
- Phase 3: Within 48 hours
- Phase 4: Within 2 weeks

**Key difference**: More time to assess, but still urgent. Don't delay notification.

---

## MEDIUM/LOW Incident Response (🟡🟢)

**Simplified process**:

1. **STOP** sharing similar data
2. **DOCUMENT** what was shared
3. **NOTIFY** manager/security (email acceptable)
4. **REVIEW** policy with manager
5. **PREVENT** by updating personal checklist

**Timeline**: Within 24 hours for documentation and notification.

---

## Incident Report Template

Copy this template when reporting incidents:

```
INCIDENT REPORT: AI Data Exposure
Date: [YYYY-MM-DD]
Time: [HH:MM timezone]
Reporter: [Your Name]
Severity: [CRITICAL/HIGH/MEDIUM/LOW]

WHAT WAS SHARED:
- Data type: [Password/API Key/PII/etc.]
- Specific details: [What exactly was pasted]
- AI tool used: [ChatGPT/Claude/etc.]
- Account type: [Personal/Enterprise]

WHEN:
- Incident timestamp: [Exact time]
- Discovery time: [When you realized]
- Response start time: [When actions began]

HOW IT HAPPENED:
- Context: [What were you trying to do?]
- Root cause: [Why did this happen?]
- Contributing factors: [Time pressure, unclear policy, etc.]

IMMEDIATE ACTIONS TAKEN:
- [ ] Stopped conversation
- [ ] Screenshot captured
- [ ] Credentials rotated (list which)
- [ ] Manager notified
- [ ] Security team contacted

IMPACT ASSESSMENT:
- Systems affected: [List]
- Data at risk: [Type and volume]
- Users affected: [Number if known]
- Unauthorized access: [Detected? Y/N]

PREVENTIVE ACTIONS:
- Personal: [What will you do differently?]
- Process: [What process needs changing?]
- Policy: [What policy needs clarification?]

ATTACHMENTS:
- Screenshot: [File name]
- Rotation confirmation: [Emails/tickets]
```

---

## Notification Templates

### Email to Manager

```
Subject: URGENT: AI Data Exposure Incident - [SEVERITY]

Hi [Manager],

I need to report a [CRITICAL/HIGH] data exposure incident.

What happened:
- I accidentally pasted [TYPE OF DATA] into [AI TOOL]
- This occurred at [TIME] on [DATE]

Immediate actions taken:
- Stopped conversation
- Rotated [CREDENTIALS/KEYS]
- Notifying Security now

Impact:
- [BRIEF ASSESSMENT]

I'm following the incident response process and will provide a full report within [TIMELINE].

[Your Name]
```

### Slack/Teams to Security

```
🚨 SECURITY INCIDENT 🚨

Severity: [CRITICAL/HIGH]
Type: AI data exposure
Reporter: @[your-handle]

Quick summary:
- [DATA TYPE] exposed to [AI TOOL]
- Incident time: [HH:MM]
- Credentials rotated: [Yes/In Progress]

Full details: [Link to incident ticket/doc]

Available for immediate call if needed.
```

---

## Decision Flowchart

```
Shared data with AI?
├─ Contains credentials/keys? → 🔴 CRITICAL
│   └─ ROTATE IMMEDIATELY
│
├─ Contains customer PII? → 🔴 CRITICAL
│   └─ NOTIFY LEGAL/DPO
│
├─ Contains company secrets? → 🟠 HIGH
│   └─ NOTIFY CTO/LEGAL
│
├─ Contains internal data? → 🟡 MEDIUM
│   └─ NOTIFY MANAGER
│
└─ Unsure if sensitive? → 🟡 MEDIUM
    └─ REPORT & CLARIFY POLICY
```

---

## Common Scenarios

### Scenario 1: Pasted code with hardcoded password

**Severity**: 🔴 CRITICAL

**Actions**:
1. STOP conversation
2. Change password on affected system (NOW)
3. Check logs for unauthorized access
4. Notify Security immediately
5. Update code to use environment variables
6. Scan codebase for other hardcoded secrets

**Timeline**: 5 minutes for rotation, 1 hour for full response

---

### Scenario 2: Shared customer email by accident

**Severity**: 🔴 CRITICAL (GDPR/CCPA)

**Actions**:
1. STOP conversation
2. Screenshot for evidence
3. Notify Legal/DPO immediately (72h GDPR requirement)
4. Assess if one email or multiple
5. Document context (was it public domain email? personal email?)
6. May require customer notification depending on jurisdiction

**Timeline**: 1 hour for notification, 24 hours for assessment

---

### Scenario 3: Accidentally included internal project name

**Severity**: 🟡 MEDIUM

**Actions**:
1. STOP using real project names
2. Use aliases going forward (Project X, Project Y)
3. Notify manager (email acceptable)
4. Update personal workflow (always anonymize)
5. No credential rotation needed

**Timeline**: 24 hours for documentation

---

### Scenario 4: Not sure if data was sensitive

**Severity**: 🟡 MEDIUM

**Actions**:
1. STOP sharing similar data
2. Screenshot/document what was shared
3. Consult [Data Classification Guide](data-classification-guide.md)
4. Email manager for clarification
5. Wait for confirmation before proceeding

**Timeline**: 24 hours, but get clarification before continuing AI use

---

## Recovery Checklist

After incident is resolved:

### Week 1
- [ ] All credentials rotated
- [ ] All stakeholders notified
- [ ] Incident report completed
- [ ] No unauthorized access detected
- [ ] Personal checklist updated

### Week 2
- [ ] Root cause analysis complete
- [ ] Preventive actions implemented
- [ ] Team informed (anonymized case study)
- [ ] Policy clarifications requested (if needed)
- [ ] Follow-up with Security (closure)

### Month 1
- [ ] Validate new process working
- [ ] No repeat incidents
- [ ] Increased awareness
- [ ] Confident in data classification

---

## Key Takeaways

✅ **Fast response prevents damage**: 5 minutes can be the difference

✅ **Rotation first**: Change credentials BEFORE assessment

✅ **Everyone makes mistakes**: Don't panic, follow process

✅ **Document everything**: Screenshots, actions, timelines

✅ **Learn and prevent**: Use incidents to improve process

❌ **Don't hide incidents**: Delayed reporting makes it worse

❌ **Don't continue working**: Stop immediately when you realize

❌ **Don't delete evidence**: You need it for the report

---

**Emergency contacts**:
- Security team: [security@company.com / Slack #security]
- Privacy officer: [privacy@company.com]
- Manager: [Your manager's contact]
- After-hours: [On-call security number]

**Related resources**:
- [Data Classification Guide](data-classification-guide.md) - Prevent incidents
- [OWASP LLM Top 10](owasp-llm-top10.md) - Understand risks
