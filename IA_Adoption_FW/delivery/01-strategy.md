# 01 - Strategy (Delivery)

> Create your AI strategy for delivery teams using pattern-based experimentation

## Why strategic AI planning matters

Traditional use case analysis leads to analysis paralysis. For delivery teams, AI strategy should be lightweight, experimental, and pattern-based. Focus on proven patterns that address real team pain points, experiment quickly, and scale what works.

**Key principles:**
- Start small with manageable experiments ($500-2K/month budget)
- Fast time-to-value (1-2 sprints)
- Low risk (like trying a new IDE extension)
- Learn through doing, not extensive planning

## Identify AI use cases

Catalog proven patterns that fit your team's delivery workflow. Select 1-2 patterns to experiment with based on team pain points.

### Pattern Catalog

| Pattern | Tool Category | Maturity | Value |
|---------|---------------|----------|-------|
| **Code Review AI** | AI code assistant, LLM with code context | Low-Med | -20-30% review time |
| **Doc Generation** | AI documentation tool, LLM | Low | -50% doc time |
| **Test Generation** | AI code assistant, test framework integration | Medium | +20-30% coverage |
| **Refactoring** | AI-powered IDE, code transformation tool | Med-High | Large-scale refactor |
| **Design Review** | LLM with architecture context | Medium | Architecture quality |
| **Sprint Planning** | LLM, planning tool integration | Low-Med | -30-40% planning time |
| **Onboarding** | AI code assistant, context-aware chat | Low | Faster ramp-up |
| **Bug Triage** | AI-powered error tracking, log analysis | Med-High | Root cause detection |

> **Tool examples**: Code assistants (GitHub Copilot, Continue.dev, Cody, Tabby), LLMs (OpenAI, Anthropic, Ollama), IDEs (Cursor, VS Code + extensions)

### Pattern Selection

**Team workshop process:**
1. Review pattern catalog
2. Identify top pain points
3. Vote on 1-2 patterns to pilot
4. Define success criteria
5. Create experiment charter (hypothesis, metrics, timeline)

## Define an AI technology strategy

Choose your technology stack based on your team's context. No single "best" approach exists.

### Stack Options

| Approach | When to Use | Examples | Trade-offs |
|----------|-------------|----------|------------|
| **SaaS** | Quick start, low maintenance | Managed AI services, cloud IDEs | Fast setup / Vendor lock-in |
| **PaaS (APIs)** | Custom integration, pay-per-use | LLM APIs, ML platforms | Flexibility / Integration work |
| **Self-Hosted** | Data sovereignty, compliance | Local LLMs (Ollama, LM Studio) | Full control / Ops overhead |
| **Hybrid** | Balance control and convenience | SaaS + self-hosted models | Best of both / Complexity |

### Selection Criteria

- **Data sensitivity**: High → Self-hosted or private cloud
- **Budget**: Limited → Self-hosted open-source or pay-per-use
- **Team skills**: Low → SaaS, High → Self-hosted
- **Compliance**: Strict → Self-hosted or compliant SaaS
- **Speed**: Fast start → SaaS, Custom needs → PaaS/Self-hosted

**Integration principle**: AI fits into existing workflows (IDE, VCS, CI/CD, planning tools), doesn't create new ones.

## Define a data strategy

Classify what data can be used with AI tools and establish clear boundaries.

### Data Classification

| Type | AI Usage | Examples |
|------|----------|----------|
| **Public code** | ✅ OK | Open-source, public repos |
| **Internal (anonymized)** | ✅ OK | Business logic, client names removed |
| **Internal architecture** | ⚠️ Non-confidential only | Tech stack, patterns |
| **Client data** | ❌ NO | PII, transactions, client code |
| **Credentials/secrets** | ❌ NEVER | Keys, passwords, tokens |
| **Proprietary algorithms** | ⚠️ Case-by-case | Core differentiators |

**Key policies:**
- Train team on data classification
- Setup secret detection (e.g., Gitleaks)
- Client data always off-limits
- Document incident response plan

## Develop a responsible AI strategy

Establish team practices for responsible AI usage:

- **Accountability**: Developers own AI-generated code, not the AI
- **Validation**: All AI outputs require review and testing
- **Transparency**: Document when AI was used (e.g., in PRs)
- **Inclusiveness**: Ensure all team members can use tools effectively
- **Continuous learning**: Share patterns, workflows, and limitations

Teams should maintain the same quality standards regardless of whether code was written manually or AI-assisted.

## Example AI strategy

### Phase 1: Exploration (Week 1-2)
- Team workshop to select 1-2 patterns
- Define success criteria and metrics
- Create experiment charter

### Phase 2: Experimentation (Week 3-4)
- Provision tools (use free trials)
- Train team (1-2 hours)
- Run sprint experiment
- Collect quantitative and qualitative data

### Phase 3: Decision (Week 5)
- Team retrospective
- Decision: **Adopt** (success) | **Adjust** (partial) | **Abandon** (learned it doesn't fit)
- Document learnings
- Scale or iterate

**Remember**: Abandoning an experiment is success—you learned what doesn't work for your team.

## Next Steps

→ [Phase 2: Plan](02-plan.md) - Convert strategy into concrete implementation plans
