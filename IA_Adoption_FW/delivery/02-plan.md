# 02 - Plan (Delivery)

> Plan AI adoption by assessing skills, prioritizing use cases, and creating proof of concepts

## Assess AI skills

Evaluate your team's current AI capabilities and readiness.

### Team Maturity Prerequisites

**Required baseline** (see [SKILLS.md](../SKILLS.md)):
- Team Level 2+ for basic AI tool adoption
- Team Level 3+ for advanced automation
- 1+ member at Level 4 (Tech Lead) preferred

**Team composition for AI adoption:**
- All members ≥ Level 2 (Competent)
- 50%+ team at Level 3 (Proficient) for advanced use cases
- Tech lead comfortable with AI tools and practices

### Readiness Assessment

- **Technical baseline**: Existing infrastructure, tools, and workflows
- **Data availability**: Access to code repositories, documentation
- **Cultural readiness**: Team openness to experimentation

> Not ready? Start with [Employee Framework](../employee/README.md) to build foundational skills

## Acquire AI skills

Develop team capabilities through training and knowledge sharing.

### Skills Development

Reference [TRAINING.md](../TRAINING.md) for appropriate training paths:
- **Level 2-3**: AI tool usage, prompt engineering, output validation
- **Level 3-4**: Advanced LLM techniques, MLOps basics, responsible AI practices

### Knowledge Sharing

- Internal workshops and demos
- Shared prompt libraries
- Peer learning and pairing sessions
- External training resources

## Access AI resources

Provision the necessary tools and infrastructure for your team.

### Resource Types

| Type | Access Method | Cost Model |
|------|---------------|------------|
| **SaaS AI** | Subscription/licensing | Per-user or per-seat |
| **PaaS (APIs)** | Platform account | Usage-based (tokens, compute) |
| **Self-hosted** | Deploy infrastructure | Hardware + maintenance |

> See [GLOSSARY.md](../GLOSSARY.md) for specific tool options

### Resource Planning

- Budget allocation per team member
- License management and provisioning
- Infrastructure setup (if self-hosted)

## Prioritize AI use cases

Map AI capabilities to your delivery workflow and prioritize high-impact areas.

### AI Integration by Delivery Phase

| Phase | Example Use Cases | Tool Types |
|-------|-------------------|------------|
| **Plan & Design** | Requirements extraction, user story generation, design validation | LLM assistants, design tools |
| **Develop** | Code generation, refactoring, documentation, code review | GitHub Copilot, Cursor, Claude Code |
| **Test** | Test generation, coverage analysis, bug detection | AI testing tools, test generation |
| **Release & Deploy** | Release notes, deployment validation, IaC generation | Release automation, IaC assistants |
| **Operate** | Incident response, troubleshooting, runbook generation | Operations AI tools |
| **Monitor** | Anomaly detection, log analysis, performance insights | Monitoring AI, AIOps platforms |

> Adapt use cases to your team's maturity level

### Prioritization Criteria

- **Team maturity fit**: Match complexity to team skills
- **Business impact**: Productivity gains, quality improvements
- **Technical feasibility**: Tool availability, integration ease
- **Risk level**: Validation requirements, data sensitivity

**Recommended approach**: Start with high-impact, low-complexity phases (typically Develop + Test)

## Create AI proof of concepts

Run focused pilots to validate AI patterns before full adoption.

### Pilot Process

1. **Select 1-2 delivery phases** to pilot
2. **Choose specific tools** aligned with your technology strategy
3. **Run time-boxed experiment** (2-4 sprints)
4. **Measure impact**: Time saved, quality metrics, team satisfaction
5. **Decide**: Adopt, adjust, or abandon
6. **Document learnings** for team knowledge base

### Success Criteria

Define clear metrics before starting:
- Quantitative: Time savings, defect rates, velocity changes
- Qualitative: Team feedback, ease of use, workflow fit

## Implement responsible AI

Establish practices for responsible AI usage throughout the plan.

### Key Practices

- **Validation requirements**: All AI outputs require human review
- **Data boundaries**: Respect data classification policies from strategy phase
- **Accountability**: Developers own AI-generated code
- **Documentation**: Track AI tool usage and impacts

Teams should maintain quality standards regardless of how code is created.

## Next Step

→ [Phase 3: Ready](03-ready.md) - Establish AI foundation and environment
