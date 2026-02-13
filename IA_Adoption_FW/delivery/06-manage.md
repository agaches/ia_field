# 06 - Manage (Delivery)

> Manage AI operations, deployment, models, costs, data, and continuity

## Manage AI operations

Establish operational practices for day-to-day AI tool management.

### Operations Dashboard

**Track operational metrics:**
- Tool availability and uptime
- Usage patterns and adoption rates
- Performance and response times
- Support tickets and issues

**Dashboard implementation:**
- Simple tracking (spreadsheet, Notion)
- Monthly review and updates
- Share with team and stakeholders

### Support and Troubleshooting

**Support structure:**
- Designated admin or tech lead as first point of contact
- Escalation path to vendor support
- Internal knowledge base for common issues
- Team communication channel for questions

**Common operations:**
- Account provisioning and deprovisioning
- License management and reallocation
- Tool configuration updates
- Integration maintenance

## Manage AI deployment

Handle deployment and updates of AI tools and integrations.

### Tool Deployment

**Deployment process:**
- Test new tools in isolated environment
- Pilot with subset of team before rollout
- Document configuration and setup
- Gradual rollout to full team

**Updates and maintenance:**
- Track tool versions and updates
- Test updates before deploying
- Communicate changes to team
- Maintain rollback capability

### Integration Management

**Monitor integrations:**
- IDE plugins and extensions
- CI/CD pipeline components
- API connections and endpoints
- Version control hooks

**Change management:**
- Schedule updates during low-impact periods
- Test integration changes
- Document configuration changes
- Have fallback procedures ready

## Manage AI models

Handle model lifecycle for teams using custom or self-hosted models.

### Model Management Basics

**For delivery teams** (typically not managing custom models):
- Use managed services where possible
- Track which models/versions are in use
- Monitor for model updates or deprecations
- Understand model capabilities and limitations

**For teams with custom models:**
- Version control for model artifacts
- Document model characteristics and use cases
- Test model updates before deployment
- Monitor model performance over time

### Model Selection

- Match model capabilities to use cases
- Consider cost vs. performance trade-offs
- Evaluate model size and response time
- Assess model security and compliance

## Manage AI costs

Track and optimize spending on AI tools and services.

### Cost Tracking

**Budget components** (from Govern phase):
- SaaS licenses (per-user or per-seat)
- API usage (tokens, requests, compute)
- Infrastructure (if self-hosted)
- Experimentation buffer

**Monthly cost review:**
- Track actual spend vs. budget
- Identify high-cost areas or users
- Evaluate ROI (time saved, quality improvements)
- Adjust allocations as needed

### Cost Optimization

**Strategies:**
- Right-size licenses (active users only)
- Optimize API usage patterns
- Use caching where appropriate
- Consider self-hosted for high-volume use cases
- Negotiate volume discounts with vendors

**Cost efficiency metrics:**
- Cost per developer per month
- Cost per feature or sprint
- Savings from productivity improvements

## Manage AI data

Ensure data used with AI tools is properly handled and governed.

### Data Management Practices

**Data classification enforcement:**
- Apply classification rules from Strategy phase
- Regular audits of data sent to AI tools
- Monitor for policy violations
- Update classification as needed

**Data lifecycle:**
- Understand data retention policies of AI services
- Request data deletion when appropriate
- Maintain data inventory for compliance
- Document data flows for auditing

### Data Quality

**For AI inputs:**
- Ensure code and documentation are well-structured
- Maintain up-to-date context (README, architecture docs)
- Clean and organize repositories
- Version control all relevant artifacts

## Manage AI business continuity

Ensure team can maintain operations if AI tools are unavailable.

### Continuity Planning

**Fallback procedures** (from Ready phase):
- Alternative tools or manual workflows
- Documented workarounds
- Team training on fallback processes
- Regular testing of continuity plans

### Resilience Strategies

**Reduce single points of failure:**
- Have backup tools available
- Maintain core skills without AI assistance
- Don't become over-dependent on single tool
- Keep manual processes documented

**Recovery procedures:**
- Document steps to restore access
- Maintain contacts for vendor support
- Have emergency approval processes
- Test recovery scenarios periodically

### Knowledge Preservation

**Ensure continuity of knowledge:**
- Document team processes and workflows
- Share AI usage patterns and effective prompts
- Cross-train team members
- Maintain institutional knowledge in wiki/docs

## Next Steps

You've completed the delivery team AI adoption framework. To continue:

1. **Iterate and improve**: Regularly review all 6 phases as your team matures
2. **Scale practices**: Share learnings with other teams
3. **Expand use cases**: Add new AI patterns as team gains experience
4. **Explore advanced topics**: If ready, explore [Automation framework](../automation/) for advanced AI capabilities
5. **Stay current**: AI tools evolve rapidly—keep learning and adapting

**Remember**: AI adoption is a journey, not a destination. Continue experimenting, learning, and adapting your practices as technology and team needs evolve.
