# 03 - Ready (Delivery)

> Shared team infrastructure for effective AI usage

## 1. Governance: Team Policies

### Document Team Policies (5-10 pages)

**Minimum content**:
- Approved tools
- Experimentation process (2-week sprints)
- Data handling rules
- Output validation (code review, tests)
- Budget allocation

**Policy Template**:
```markdown
# AI Policy - Team [Name]

## Approved Tools
GitHub Copilot (all devs), ChatGPT Team (leads/seniors), Cursor (optional)

## Data Handling
✅ Open-source, non-proprietary code
⚠️ Internal architecture (anonymized)
❌ Client code, credentials, secrets

## Validation Required
Code review mandatory, unit tests for critical code, security scans

## Budget
$50/dev/month standard tools, 20% buffer for experiments, monthly review

## Training
2h onboarding for new members, monthly best practices workshop
```

**Storage**: Team wiki (Confluence, Notion, GitHub Wiki), versioned, quarterly review

### Communicate Policies

Team meeting (30min), email with link, add to onboarding, remind in retros.

## 2. Network: Optional (VPN if remote)

VPN only needed if: distributed team accessing on-prem resources, internal AI tools, strict compliance (finance, healthcare).

Most SaaS tools (GitHub, ChatGPT) don't need VPN.

**If required**: Tailscale (mesh VPN, 5min setup, free for 100 devices) or Twingate (zero-trust, free for 5 users).

## 3. Reliability: SLA Awareness

### Provider SLAs

| Tool | SLA | Uptime | Fallback |
|------|-----|--------|----------|
| GitHub Copilot | 99.9% | ~99.95% | Disable temporarily |
| ChatGPT Team | No formal SLA | ~99.5% | Claude, Gemini |
| Claude Team | No formal SLA | ~99.7% | ChatGPT, Gemini |
| Azure OpenAI | 99.9% | ~99.9% | OpenAI API direct |

Expect 4-8h downtime/year. No compensation for low-tier SaaS.

### Continuity Plan

If tool down:
1. **Identify** (5min): Check status page, confirm with team
2. **Activate fallback** (10min): Switch to alternative, continue non-blocking work
3. **Communicate** (immediate): Notify team, update PO if impacts delivery
4. **Monitor** (ongoing): Check status, update when resolved
5. **Post-mortem** (if >4h): Document impact, adjust plan if needed

## 4. Foundation: Shared Infrastructure

### Accounts & Licenses

**GitHub Team**: Org account, invite devs, enable Copilot Business ($19/user/month), configure policies (audit logs, allow repos)

**ChatGPT Team**: Subscribe ($30/user/month, 2 min), workspace, invite members, disable data training, 30-day retention

**Claude for Work**: Similar to ChatGPT ($30/user/month), team workspace, configure retention

### Administration Setup

**Assign responsible person**: Tech lead or designated admin to manage access, licenses, support

**Define processes**:

**Onboarding (new member)**:
1. Create accounts (GitHub org, ChatGPT workspace, Claude)
2. Assign licenses (Copilot Business, ChatGPT Team)
3. 2h training (policy, tools, prompt library)
4. Access repos (team-ai-prompts, team-vscode-config)
5. Add to team dashboard

**Offboarding (departing member)**:
1. Revoke access immediately (GitHub, ChatGPT, Claude)
2. Recover license (reallocation or budget savings)
3. Remove from team dashboard
4. Archive conversations if necessary (compliance)

**Documentation**: Create administration runbook (wiki/Notion) with detailed procedures

### IDE Configuration

**VS Code Settings Sync**: Create repo `team-vscode-config`, add `settings.json` + `extensions.json`, document in README.

**extensions.json**:
```json
{
  "recommendations": [
    "github.copilot",
    "github.copilot-chat",
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint"
  ]
}
```

**Distribution**: Commit to repo, devs clone and symlink to `.vscode/`, update via Git pull.

### Shared Prompt Library

**Structure**:
```
team-ai-prompts/
├── README.md
├── coding/ (code-review.md, test-generation.md, refactoring.md)
├── documentation/ (api-docs.md, readme.md)
├── planning/ (story-breakdown.md, estimation.md)
```

**Contribution**: Dev discovers effective prompt → PR → Tech lead review → Announce in standup

### CI/CD Integration (Light)

**Pre-commit Hooks (Secret Detection)**:
```bash
pip install pre-commit
# Create .pre-commit-config.yaml with gitleaks
pre-commit install
```

**GitHub Actions (Security Scan)**:
```yaml
name: Security Scan
on: [push, pull_request]
jobs:
  gitleaks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: gitleaks/gitleaks-action@v2
```

### Monitoring Dashboard

**Metrics to track**: Adoption (% PRs with AI), Quality (bug rate AI vs manual), Costs ($/dev/month)

**Simple dashboard**: Google Sheets/Notion, monthly update, 30min team meeting review.

## Ready Checklist

- [ ] Document team policy (5-10 pages)
- [ ] Provision team licenses (Copilot, ChatGPT)
- [ ] Assign admin responsible (tech lead)
- [ ] Define onboarding/offboarding processes
- [ ] Create administration runbook (wiki)
- [ ] Create shared prompt library (Git repo)
- [ ] Standardize IDE config (VS Code sync)
- [ ] Configure pre-commit hooks (secrets)
- [ ] Setup CI/CD security scans
- [ ] Create metrics dashboard
- [ ] Train team (2h onboarding)
- [ ] Establish continuity plan (fallback tools)

## Next Step

→ [Phase 4: Govern](04-govern.md) - Govern team AI usage
