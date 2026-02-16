# Phase 3: Run

> **Goal**: Daily operations, ROI tracking, continuous improvement
> **Time**: Ongoing
> **Output**: Sustained productivity gains + Optimized workflow

---

## 1. Daily Operations Hygiene

### Before Every Prompt - The 3-Second Check

- [ ] **Data check**: Does this contain sensitive information?
- [ ] **Model check**: Right tool for this task? (Fast vs Smart model)
- [ ] **Output check**: Will I verify this output before using it?

**Make it a habit**: This 3-second pause prevents 99% of security incidents.

---

## 2. Output Validation

**Never trust AI blindly**. Every single time:

### For Text/Content
- [ ] Fact-check claims with primary sources
- [ ] Verify citations exist and are correctly referenced
- [ ] Check for bias or unsupported assumptions
- [ ] Proofread for context and tone

### For Code
- [ ] Read and understand every line generated
- [ ] Test thoroughly (unit tests + integration tests)
- [ ] Check for security vulnerabilities (SQL injection, XSS, etc.)
- [ ] Verify it follows your project's patterns and standards

### For Analysis/Data
- [ ] Verify calculations manually (sample check)
- [ ] Cross-reference with source data
- [ ] Check for logical inconsistencies
- [ ] Validate edge cases

**Rule**: If you can't verify it, don't use it.

---

## 3. Incident Response

**If you accidentally paste a secret or PII:**

📋 **Full process**: [Incident Response Process](../templates/shared/incident-response-process.md)

### Immediate Actions (Within 5 minutes)

1. **STOP**: Immediately stop the conversation
2. **SCREENSHOT**: Capture what was shared (for incident report)
3. **ROTATE**: Change the leaked credential NOW
   - Password → Reset immediately
   - API key → Revoke and regenerate
   - Token → Invalidate and create new
4. **REPORT**: Notify IT/Security if company data (even if "minor")

### Follow-up (Within 24 hours)

- [ ] Document incident (what, when, how)
- [ ] Review why it happened (rushed? unclear policy?)
- [ ] Implement safeguard (additional check, tool change)
- [ ] Update team if process improvement needed

**Remember**: Everyone makes mistakes. Fast response minimizes damage.

---

## 4. Cost & ROI Management

### Monthly Review (15 minutes)

📋 **Tool**: [Cost & ROI Tracking](../templates/employee/cost-roi-tracking.md)
| Tool | Cost | Hours Saved/Mo | Hourly Value | ROI | Decision |
|------|------|----------------|--------------|-----|----------|
| Tool A | $20 | 8h | $50/h | 20x | Keep ✅ |
| Tool B | $20 | 0.5h | $50/h | 1.25x | Cancel ❌ |

**Decision criteria**:
- **ROI ≥3x**: Keep, consider upgrading tier
- **ROI 1-3x**: Keep, optimize usage
- **ROI <1x**: Cancel or find better use cases

### Cost Optimization

- [ ] Review usage patterns (which features used most?)
- [ ] Downgrade if not using premium features
- [ ] Consolidate tools with overlapping capabilities
- [ ] Check for annual plans (usually 20% cheaper)

**Target**: $20-50/month with ≥3x ROI

---

## 5. Data Lifecycle Management

### Conversation Cleanup (Weekly)

- [ ] Delete chats containing test data or sensitive examples
- [ ] Archive important conversations (export if supported)
- [ ] Clear browser cache/history with credentials

### Prompt Library (Ongoing)

**Save your best prompts** - they're your competitive advantage.

- [ ] Create personal prompt library (Notion, Obsidian, text file)
- [ ] Tag by category (writing, code, analysis)
- [ ] Note which model works best for each
- [ ] Share team-appropriate prompts with colleagues

**Format**:
```
Prompt: [Name]
Category: [Writing/Code/Analysis]
Model: [ChatGPT/Claude/etc.]
Template: [The actual prompt with [PLACEHOLDERS]]
Example: [Concrete usage example]
```

---

## 6. Continuous Improvement

- **Weekly** (5 min): Try 1 new prompt technique, review tool changelog
- **Monthly** (30 min): Review ROI/cost (Section 4), update prompt library
- **Quarterly** (1h): Reassess skills ([SKILLS.md](../SKILLS.md)), check readiness for [Delivery Framework](../delivery/)

---

## Phase 3 Checklist

### Daily Operations ✅
- [ ] 3-second check before every prompt
- [ ] Output verification systematic
- [ ] Incident response process known

### Weekly Management ✅
- [ ] Conversation cleanup performed
- [ ] 1 new technique learned
- [ ] Prompt library updated

### Monthly Review ✅
- [ ] Cost/ROI analysis complete
- [ ] Tool stack optimized
- [ ] Continuous improvement tracked

### Quarterly Assessment ✅
- [ ] Skills reassessment (SKILLS.md)
- [ ] Goals updated
- [ ] Next framework readiness evaluated

---

## Success Validation (After 30 days)

**You've successfully completed Employee Framework if:**

- ✅ Save ≥2 hours/week with AI
- ✅ Use AI ≥3 times/week
- ✅ Zero security incidents
- ✅ ROI ≥3x subscription cost
- ✅ 5+ prompts in personal library
- ✅ Comfortable with data classification

**Next level**: Level 2 achieved! Ready for [Delivery Framework](../delivery/) when your team is ready.

**How to know your team is ready**:
- ≥50% of your team uses AI daily (ask in standup)
- At least 1 person willing to champion team adoption
- Management supports investing in team AI tools
- If not yet: share your learnings, demonstrate ROI, propose a pilot

---

## Troubleshooting

**Not seeing productivity gains?**
- Review use cases (Section 1 of Prepare) - are they AI-suitable?
- Check prompt quality - try advanced techniques
- Consider different tool for your use case

**Security concerns?**
- Review data classification rules
- Implement additional verification step
- Consider enterprise AI tools with better data controls

**Cost too high?**
- Audit actual vs. planned usage
- Downgrade unused premium features
- Consolidate overlapping tools

---

**Previous**: [Phase 2: Build](02-build.md) | **Back**: [Employee README](README.md)
