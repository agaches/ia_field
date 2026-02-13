# Phase 6: Manage - AI Productivity Management

## Manage AI operations

### Operational framework

**For corporate-provided tools**:
- Follow company deployment and usage procedures
- Report issues to IT support or tool administrator
- Participate in feedback/improvement programs
- Respect access controls and governance policies

**For personal tools**:
- Manage your own subscriptions and access
- Track usage and costs independently
- Optimize based on actual usage patterns
- Maintain your own documentation

**SaaS operational model**:
- Providers manage infrastructure, updates, uptime
- No servers to maintain
- Automatic updates and new features
- Minimal operational burden on your side

### Service management

**When AI tools have issues**:
1. Check provider status page (bookmark these)
2. Switch to backup tool temporarily
3. Report persistent issues to IT (if corporate tool)
4. Don't let AI downtime block critical work

**Bookmarks to maintain**:
- [OpenAI Status](https://status.openai.com/)
- [Anthropic Status](https://status.anthropic.com/)
- [GitHub Status](https://www.githubstatus.com/)

## Manage AI deployment

### Tool deployment approach

**Corporate tools**:
- Provisioned by IT (wait for access)
- Pre-configured with security settings
- Integrated with company systems
- Support available from IT

**Personal tools**:
- Self-service account creation
- Configure security yourself (MFA, privacy)
- Integration your responsibility
- Support from tool provider

### Deployment checklist

**New tool deployment**:
- [ ] Verify company approval (if required)
- [ ] Create account with work email
- [ ] Configure security (MFA, strong password)
- [ ] Set privacy settings (opt-out training)
- [ ] Test basic functionality
- [ ] Document credentials in password manager
- [ ] Add to your tool inventory

**Tool updates**:
- Review changelogs for new features
- Check if security settings need updating
- Test that existing workflows still work
- Update internal documentation

## Manage AI models

### Model awareness

**What you need to know**:
- Which AI model/version your tool uses
- When major updates happen
- How updates affect your workflows
- Deprecation notices and migration paths

**Model tracking** (light):
- ChatGPT: Note if using GPT-3.5, GPT-4, GPT-4o
- Claude: Note model version (Claude 3.5 Sonnet, etc.)
- GitHub Copilot: Generally auto-updated
- Check tool settings for model selection options

**When models change**:
- Output quality may vary
- Retest critical prompts
- Adjust prompt engineering if needed
- Report significant issues to provider

### Model selection (when available)

**Factors to consider**:
- Speed vs. quality tradeoffs
- Cost differences between models
- Task complexity requirements
- Privacy/security features

**General guidance**:
- Use faster models for simple tasks
- Use advanced models for complex reasoning
- Use specialized models when available (code, analysis)

## Manage AI costs

### Cost tracking

**Typical personal budget**:

| User Type | Recommended Tools | Monthly Cost |
|-----------|------------------|--------------|
| **Developer** | GitHub Copilot + ChatGPT Plus | $30 |
| **Developer (optimized)** | GitHub Copilot + Claude free | $10 |
| **Knowledge worker** | ChatGPT Plus or Claude Pro | $20 |
| **Light user** | Free tiers (Gemini, ChatGPT) | $0 |

**ROI calculation**:
- Track hours saved per week
- Typical target: 2+ hours/week saved
- At $30/month ÷ 8 hours = $3.75/hour saved
- Compare to your hourly rate for ROI

### Cost optimization

**Monthly review** (15 minutes):

| Tool | Cost | Usage Level | Decision |
|------|------|-------------|----------|
| ChatGPT Plus | $20 | Used 2x/week | → Cancel, use free tier |
| Claude Pro | $20 | Used daily | → Keep |
| GitHub Copilot | $10 | Used hourly | → Keep |

**Optimization strategies**:
1. Cancel underused paid tools (< 3x/week usage)
2. Use free tiers for occasional needs
3. Share learnings to reduce team duplication
4. Consolidate similar tools (pick one conversational AI)

**Budget discipline**:
- Set monthly budget: $20-50
- Review usage monthly
- Cut tools not providing ROI
- Upgrade only when justified by usage

### Cost tracking spreadsheet (optional)

```
Month | Tool | Cost | Usage | Hours Saved | ROI | Action
------|------|------|-------|-------------|-----|-------
Jan | ChatGPT | $20 | Daily | 4h | Positive | Keep
Jan | Copilot | $10 | Hourly | 8h | Positive | Keep
Jan | Claude | $20 | 2x/wk | 1h | Negative | Cancel
```

## Manage AI data

### Data lifecycle management

**Data you create in AI tools**:
- Chat histories
- Custom prompts/templates
- Code snippets
- Generated content

**Retention decisions**:
- **Keep**: Useful prompts, templates, research
- **Delete**: Sensitive test data, temporary queries
- **Export**: Important conversations, code examples

### Data export and backup

**Important data to backup** (optional):
- Effective prompt templates
- Custom instructions/system prompts
- Generated code you're using
- Research summaries

**Backup methods**:
- Copy to personal notes/wiki
- Save to private Git repository
- Export chat histories periodically
- Screenshot important interactions

**Tool-specific export**:
- ChatGPT: Settings → Data controls → Export data
- Claude: Manual copy (no bulk export yet)
- GitHub Copilot: Code is in your repo already

### Data deletion

**When to delete data**:
- Leaving a company (export first, then delete)
- Tool contains test data that shouldn't persist
- Privacy concern or data classification change
- Account closure

**Deletion process**:
- Review tool's data deletion policy
- Request full data deletion if needed
- Verify deletion confirmation
- Remove from password manager

## Manage AI business continuity

### Backup and redundancy

**Tool redundancy strategy**:
- Maintain accounts on 2+ AI tools
- Primary tool + backup tool
- Example: ChatGPT Plus (primary) + Claude free (backup)
- If primary is down, switch to backup

**Critical workflow continuity**:
- Don't depend solely on AI for time-critical work
- Maintain traditional workflow capability
- Document manual processes as fallback
- Test backup tools occasionally

### Important data backup

**What to backup**:
- [ ] Effective prompt templates (save to notes)
- [ ] Custom GPT configurations (screenshot/document)
- [ ] Important generated code (commit to repo)
- [ ] Research summaries (export to docs)

**Where to backup**:
- Personal notes/wiki (Notion, Obsidian)
- Private Git repository (for code/prompts)
- Company documentation system (if appropriate)
- Local files (encrypted)

**Backup frequency**:
- Weekly: Save new useful prompts
- Monthly: Export important conversations
- Quarterly: Full account data export (if available)

### Service availability planning

**Preparation**:
- Bookmark all tool status pages
- Have 2+ tools configured and ready
- Know which workflows depend on which tools
- Identify critical vs. nice-to-have AI usage

**During outage**:
1. Check status page for ETA
2. Switch to backup tool if critical
3. Defer non-critical AI tasks
4. Use traditional methods for urgent work

## Manage Checklist

- [ ] Define tool usage model (corporate vs. personal)
- [ ] Set personal budget ($20-50/month)
- [ ] Create cost tracking method
- [ ] Conduct monthly usage review
- [ ] Cancel underused tools
- [ ] Backup important prompts/data
- [ ] Configure backup tool
- [ ] Test business continuity plan

## Conclusion

**Success criteria**:
- ✅ Controlled costs with positive ROI
- ✅ 2+ hours/week time savings
- ✅ Integrated AI into daily workflow
- ✅ Security and compliance maintained
- ✅ Simple monthly review process

**Continuous improvement**:
- Review this framework quarterly
- Update skills and tools as needed
- Share learnings with colleagues
- Consider [Delivery Framework](../delivery/) for team adoption

---

**AI should improve your productivity, not become a burden.**

If AI isn't saving you time or providing value, reassess your strategy and tools.
