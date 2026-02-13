# 04 - Govern (Delivery)

> Assess risks, document policies, enforce standards, and monitor team AI usage

## Assess AI organizational risks

Identify and evaluate risks specific to team AI adoption.

### Key Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| **Generated code quality** | Production bugs | Systematic code review and testing |
| **Output bias** | Poor UX, unfair outcomes | Validation and testing processes |
| **Data leakage** | IP compromise | Data classification enforcement |
| **Inconsistent usage** | Variable quality | Team standards and training |
| **Over-dependency** | Loss of critical skills | Continuous learning, manual fallbacks |

### Risk Assessment

For each AI tool or pattern, evaluate:
- **Data impact**: What data is shared with the tool?
- **Quality impact**: How are outputs validated?
- **Productivity impact**: Benefits vs. risks?
- **Team impact**: Can all members use it effectively?

**Approval process**: Tech lead reviews and approves based on risk assessment

## Document AI governance policies

Maintain and evolve team policies for AI usage.

### Policy Documentation

**Core policies** (from Ready phase):
- Approved tools and services
- Data handling and classification rules
- Output validation requirements
- Experimentation and approval process
- Budget allocation

### Policy Review Process

- **Regular review**: Quarterly or after major changes
- **Update triggers**: New tools, incidents, regulatory changes
- **Version control**: Track policy changes over time
- **Team involvement**: Gather feedback during retrospectives

## Enforce AI governance policies

Implement mechanisms to ensure policy compliance.

### Enforcement Mechanisms

**Technical controls:**
- Pre-commit hooks for secret detection
- CI/CD security scans
- Access controls and authentication
- Monitoring and logging of tool usage

**Process controls:**
- Mandatory code review for AI-generated code
- Training requirements for new tools
- Approval workflow for experiments
- Incident response procedures

**Cultural practices:**
- Peer accountability
- Regular policy reminders
- Recognition of good practices
- Transparent discussions about challenges

## Monitor AI organizational risks

Track metrics and costs to identify issues and demonstrate value.

### Monitoring Dashboard

**Adoption metrics:**
- % of team actively using AI tools
- % of PRs with AI assistance
- Most used tools and patterns

**Quality metrics:**
- Defect rates (AI-assisted vs. manual)
- Code review findings
- Test coverage changes

**Productivity metrics:**
- Velocity trends
- Lead time changes
- Developer satisfaction (quarterly survey)

**Cost metrics:**
- Cost per developer per month
- Total team AI spending
- ROI estimates (time saved × cost)

### Budget Management

**Budget components:**
- SaaS licenses (if applicable)
- API usage costs (if applicable)
- Infrastructure costs (if self-hosted)
- Buffer for experimentation (20%)

**Tracking**: Monthly review of costs per team, adjust as needed

### Review Cadence

**Monthly review** (30 min):
- Present dashboard metrics
- Identify what's working and what isn't
- Decide to continue, adjust, or stop specific practices
- Plan actions for next month

## Next Step

→ [Phase 5: Secure](05-secure.md) - Secure team AI usage
