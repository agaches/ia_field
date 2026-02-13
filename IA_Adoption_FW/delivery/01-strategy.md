# 01 - Strategy (Delivery)

> **Scope**: AI Strategy for Delivery Teams
> **Approach**: Pattern-based experimentation

## 1. AI Integration Patterns

### Why Patterns Over Use Cases?

Traditional use case analysis = analysis paralysis. Instead: **catalog proven patterns**, experiment with 1-2 that fit.

### Pattern Catalog

| Pattern | Tool Category | Maturity | Timeline | Value |
|---------|---------------|----------|----------|-------|
| **Code Review AI** | AI code assistant, LLM with code context | Low-Med | 1-2 sprints | -20-30% review time |
| **Doc Generation** | AI documentation tool, LLM | Low | 1 sprint | -50% doc time |
| **Test Generation** | AI code assistant, test framework integration | Medium | 2-3 sprints | +20-30% coverage |
| **Refactoring** | AI-powered IDE, code transformation tool | Med-High | 2-4 sprints | Large-scale refactor |
| **Design Review** | LLM with architecture context | Medium | 2-3 sprints | Architecture quality |
| **Sprint Planning** | LLM, planning tool integration | Low-Med | 1-2 sprints | -30-40% planning time |
| **Onboarding** | AI code assistant, context-aware chat | Low | 1 sprint | Faster ramp-up |
| **Bug Triage** | AI-powered error tracking, log analysis | Med-High | 3-4 sprints | Root cause detection |

> **Examples**: Code assistants (GitHub Copilot, Continue.dev, Cody, Tabby), LLMs (OpenAI, Anthropic, Ollama local), IDEs (Cursor, VS Code + extensions)

### Experimentation Framework (2-week sprints)

**Phase 1: Pattern Selection (Week 1-2)**
- Team workshop (2h): Review patterns, vote on 1-2
- Criteria: Pain point alignment, feasibility, risk, learning value
- Output: 1-page experiment charter (hypothesis, metrics, timeline)

**Phase 2: Sprint Experiment (Week 3-4)**
- Provision tools (free trials)
- Train team (1h session)
- Log interactions (what works, what doesn't)
- Collect data: quantitative (time, quality) + qualitative (feedback)

**Phase 3: Decision (Week 5)**
- Team retro (90min)
- Decision: **Adopt** (met criteria) | **Adjust** (partial success) | **Abandon** (failed)
- **Important**: Abandoning = success (learned what doesn't work)

### Why No Business Cases?

Budget manageable ($500-2K/month), time-to-value fast (2 weeks), risk low. Act like trying new IDE extension, not implementing SAP.

## 2. Technology Strategy

### Choose Your Stack Based on Context

**No single "best" approach** - select based on: budget, skills, compliance, data sensitivity, infrastructure.

**Stack Options** (all valid):

| Approach | When to Use | Examples | Considerations |
|----------|-------------|----------|----------------|
| **SaaS** | Quick start, low maintenance, public cloud OK | Managed AI services, cloud IDEs | +Fast setup, -Vendor lock-in, -Data leaves premises |
| **PaaS (APIs)** | Custom integration, pay-per-use | LLM APIs, ML platforms | +Flexibility, +Scale, -Requires integration work |
| **Self-Hosted** | Data sovereignty, compliance, cost control | Local LLMs (Ollama, LM Studio), on-premise compute | +Full control, +Privacy, -Ops overhead, -Requires expertise |
| **Hybrid** | Balance control and convenience | SaaS tools + self-hosted models | +Best of both, -Complexity |

**Selection Criteria**:
- **Data sensitivity**: High → Self-hosted or private cloud
- **Budget**: Limited → Self-hosted open-source or pay-per-use APIs
- **Team skills**: Low → SaaS, High → Self-hosted
- **Compliance**: Strict → Self-hosted or compliant SaaS
- **Speed**: Fast start → SaaS, Custom needs → PaaS/Self-hosted

### Integration Architecture

**Principle**: AI fits existing workflows, doesn't create new ones.

**Touchpoints**: IDE (code assistant) → VCS (PR review bot) → CI/CD (security scan) → Planning (LLM integration) → Communication (chat integration)

**Example tools by category**:
- **Code assistants**: GitHub Copilot, Continue.dev, Cody, Tabby, Ollama with IDE plugins
- **VCS integration**: PR review bots, commit analysis
- **CI/CD**: Security scanners, test generators
- **Planning**: LLM APIs, self-hosted models
- **Chat**: Slack/Teams/Mattermost bots

**Rules**:
- One tool per touchpoint
- Async over sync
- Optional → required (after buy-in)
- Fail gracefully

## 3. Data Strategy

### Data Classification

| Type | AI Usage | Examples |
|------|----------|----------|
| **Public code** | ✅ OK | Open-source, public repos |
| **Internal (anonymized)** | ✅ OK | Business logic, client names removed |
| **Internal architecture** | ⚠️ Non-confidential only | Tech stack, patterns |
| **Client data** | ❌ NO | PII, transactions, client code |
| **Credentials/secrets** | ❌ NEVER | Keys, passwords, tokens |
| **Proprietary algorithms** | ⚠️ Case-by-case | Core differentiators |

### Team Data Policies

**Policy 1**: Default to caution - if unsure, ask tech lead
**Policy 2**: Tool-specific controls - disable Copilot on sensitive repos, use business accounts
**Policy 3**: Client data off-limits - never send production data to AI
**Policy 4**: Secrets NEVER AI-appropriate - use placeholders, env vars

## 4. Responsible AI (Team Level)

6 major principles :

1. **Fairness**: AI shouldn't favor/disadvantage team members. Calibrate collectively.
2. **Reliability**: AI-generated code needs human review + tests. AI is tool, not reviewer.
3. **Privacy**: No data leaks. PII filtering, opt-out training, SOC2 tools only.
4. **Inclusiveness**: Training for all, hardware equity, shared knowledge.
5. **Transparency**: Label AI contributions in PRs, share workflows/limitations.
6. **Accountability**: Author owns code even if AI wrote it. No AI blame.

### Checklist

- [ ] Fairness: Works for all team members?
- [ ] Reliability: Tests/validation for AI output?
- [ ] Privacy: Only approved data to AI?
- [ ] Security: Tool meets security requirements?
- [ ] Inclusiveness: Everyone can use effectively?
- [ ] Transparency: Clear when AI used?
- [ ] Accountability: Clear ownership?

## Strategy Checklist

### Exploration (Week 1-2)
- [ ] Review pattern catalog
- [ ] Identify team pain points
- [ ] Team workshop: select 1-2 patterns
- [ ] Define success criteria
- [ ] Create experiment charter

### Experimentation (Week 3-4)
- [ ] Provision tools (free trials)
- [ ] Train team (1h)
- [ ] Define workflows
- [ ] Baseline metrics
- [ ] Run 2-week sprint
- [ ] Log feedback

### Decision (Week 5)
- [ ] Review metrics vs criteria
- [ ] Team retrospective
- [ ] Decide: Adopt/Adjust/Abandon
- [ ] Document learnings
- [ ] Rollout or iterate

### Technology
- [ ] Prioritize SaaS over custom
- [ ] Vet tools (SOC2/GDPR)
- [ ] Budget caps ($500/month APIs)
- [ ] Integrate into existing workflows
- [ ] Tool approval process

### Data
- [ ] Classify data (public/internal/client/secrets)
- [ ] Train on anonymization
- [ ] Setup secret detection (Gitleaks)
- [ ] Policy: client data off-limits
- [ ] Incident response plan

### Responsible AI
- [ ] Collective calibration
- [ ] Tests for AI code
- [ ] Maintain accountability
- [ ] Document AI usage in PRs
- [ ] Share workflows/limitations

## Next Steps

→ [Phase 2: Plan](02-plan.md) - Convert patterns into concrete plans
