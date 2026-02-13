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

**Policy Template Example** (adapt to your tools):
```markdown
# AI Policy - Team [Name]

## Approved Tools
[Examples: Code assistants, LLM access (commercial/self-hosted), IDE integrations]

## Data Handling
✅ Open-source, non-proprietary code
⚠️ Internal architecture (anonymized)
❌ Client code, credentials, secrets

## Validation Required
Code review mandatory, unit tests for critical code, security scans

## Budget
[Define based on your stack: SaaS licenses, API usage, or infrastructure costs]
20% buffer for experiments, monthly review

## Training
2h onboarding for new members, monthly best practices workshop
```

> **Note**: This is an example template. Adapt tool names, budget, and policies to your team's chosen stack.

**Storage**: Team wiki (Confluence, Notion, GitHub Wiki), versioned, quarterly review

### Communicate Policies

Team meeting (30min), email with link, add to onboarding, remind in retros.

## 2. Network: Optional (VPN if remote)

VPN only needed if: distributed team accessing on-prem resources, internal AI tools, strict compliance (finance, healthcare).

Most cloud-based SaaS tools don't need VPN.

**If required**: Choose a mesh VPN or zero-trust solution (examples: Tailscale, Twingate, WireGuard, OpenVPN, or enterprise solutions).

## 3. Reliability: SLA Awareness

### Provider SLAs (Examples)

| Tool Type | Typical SLA | Fallback Strategy |
|-----------|-------------|-------------------|
| **Code Assistants** | 99%+ (commercial), N/A (self-hosted) | Alternative assistant, local model, manual |
| **LLM APIs (commercial)** | 99-99.9% (enterprise), lower (free/basic) | Alternative API, self-hosted model |
| **Self-hosted** | Depends on your infrastructure | Redundancy, backups, commercial fallback |
| **VCS (cloud)** | 99.9%+ | N/A (critical dependency) |

**General expectations**: Commercial SaaS ~4-8h downtime/year. Self-hosted depends on your infrastructure reliability.

> **Note**: Check specific SLAs for your chosen tools/infrastructure.

### Continuity Plan

If tool down:
1. **Identify** (5min): Check status page, confirm with team
2. **Activate fallback** (10min): Switch to alternative, continue non-blocking work
3. **Communicate** (immediate): Notify team, update PO if impacts delivery
4. **Monitor** (ongoing): Check status, update when resolved
5. **Post-mortem** (if >4h): Document impact, adjust plan if needed

## 4. Foundation: Shared Infrastructure

### Accounts & Licenses

**Approach depends on your stack**:

**Commercial SaaS** (if chosen):
- Create organization/team accounts
- Invite team members, assign licenses
- Configure policies: audit logs, data retention, training opt-out
- Typical cost: $10-50/user/month per tool

**Self-hosted** (if chosen):
- Setup infrastructure (compute, storage)
- Deploy services (LLM inference, code assistants)
- Configure authentication, access control
- Typical cost: Infrastructure + maintenance effort

**Hybrid**: Combination of both approaches

> **Examples**: GitHub Team + Copilot, GitLab self-hosted + Continue.dev, Gitea + Ollama + Tabby

### Administration Setup

**Assign responsible person**: Tech lead or designated admin to manage access, licenses, support

**Define processes**:

**Onboarding (new member)**:
1. Create accounts (VCS, LLM access, tool-specific)
2. Assign access/licenses (based on your stack)
3. 2h training (policy, tools, prompt library)
4. Access shared resources (prompts, configs, docs)
5. Add to team dashboard

**Offboarding (departing member)**:
1. Revoke access immediately (all systems)
2. Recover licenses/resources (reallocation or savings)
3. Remove from team dashboard
4. Archive data if necessary (compliance)

> **Adapt to your stack**: SaaS (account management), Self-hosted (user removal, key revocation), Hybrid (both)

**Documentation**: Create administration runbook (wiki/Notion) with detailed procedures

### IDE Configuration

**Goal**: Standardize AI tool setup across team

**Approach**:
1. Create shared config repo (e.g., `team-ide-config`)
2. Document recommended extensions/plugins for your IDE(s)
3. Include settings for AI tools (if applicable)
4. Version control and distribute via Git

**Example (VS Code)**:
```json
{
  "recommendations": [
    "[your-code-assistant-extension]",
    "[formatter]",
    "[linter]"
  ]
}
```

**Example (JetBrains)**: Share `settings.zip` or plugin configuration files

**Distribution**: Commit to repo, team members clone/import, update via Git

> **Adapt to your IDE**: VS Code, JetBrains IDEs, Vim/Neovim, Emacs, etc.

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
