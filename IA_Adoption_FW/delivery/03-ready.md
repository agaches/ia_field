# 03 - Ready (Delivery)

> Establish AI governance, networking, reliability, and technical foundations

## Establish AI governance

Define and communicate team policies for AI tool usage.

### Team Policies

**Document policies covering:**
- Approved tools and experimentation process
- Data handling rules (reference Strategy phase classification)
- Output validation requirements (code review, tests)
- Budget allocation and approval process

**Storage and maintenance:**
- Team wiki or knowledge base (versioned)
- Review quarterly and update as needed
- Include in new member onboarding

### Policy Communication

- Kickoff meeting (30 min) to introduce policies
- Link in team documentation
- Regular reminders in retrospectives

## Establish AI networking

Ensure team members can access AI tools and services.

### Network Access Requirements

- **Cloud-based tools**: Internet connectivity, VPN if required
- **API access**: Network policies allowing API endpoints
- **Self-hosted**: Internal network access to AI infrastructure
- **Authentication**: SSO, API keys, or credential management

### Connectivity Checklist

- Verify tool access from team workstations
- Configure firewalls/proxies if needed
- Document access procedures
- Test failover connectivity

## Establish AI reliability

Understand service levels and plan for continuity.

### Provider SLAs

| Tool Type | Typical SLA | Fallback Strategy |
|-----------|-------------|-------------------|
| **Code Assistants** | 99%+ (commercial) | Alternative assistant, local model, manual |
| **LLM APIs** | 99-99.9% (enterprise) | Alternative API, self-hosted model |
| **Self-hosted** | Depends on your infrastructure | Redundancy, backups, commercial fallback |

**Expectations**: Commercial SaaS typically 4-8h downtime/year

### Continuity Plan

**If tool unavailable:**
1. Identify outage and confirm with team
2. Activate fallback (alternative tool or manual workflow)
3. Communicate to team and stakeholders if delivery impacted
4. Document impact for post-mortem if significant (>4h)

## Establish an AI foundation

Set up accounts, configurations, and shared resources.

### Accounts & Licenses

- Provision licenses for all team members
- Assign administrator (tech lead or designated person)
- Document onboarding/offboarding procedures

### Administration

**Onboarding:**
- Create accounts and assign licenses
- Provide training (1-2 hours on policies and tools)
- Grant access to shared resources

**Offboarding:**
- Revoke access immediately
- Recover licenses for reallocation
- Archive data if required

### IDE Configuration

**Standardize tooling:**
- Create shared configuration repository
- Document recommended extensions and settings
- Distribute via Git for version control
- Support multiple IDEs as needed (VS Code, JetBrains, etc.)

### Shared Knowledge Library

**Create repository for:**
- Effective prompts and patterns
- Team best practices
- Lessons learned

**Contribution process:** Team member submits → tech lead reviews → share with team

### CI/CD Integration

**Implement security checks:**
- Pre-commit hooks for secret detection (e.g., Gitleaks)
- CI/CD pipeline security scans
- Automated validation of AI-generated code

**Example tools:** Gitleaks, TruffleHog, GitHub Actions, GitLab CI

### Monitoring Dashboard

**Track key metrics:**
- Adoption rates (% team using tools, % PRs with AI assistance)
- Quality indicators (defect rates, review findings)
- Cost per developer per month

**Implementation:** Simple dashboard (spreadsheet, Notion) updated monthly

## Next Step

→ [Phase 4: Govern](04-govern.md) - Govern team AI usage
