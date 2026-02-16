# Phase 1: Prepare

> **Goal**: Assess team readiness, select integration use cases, plan experimentation
> **Time**: 1-2 weeks
> **Output**: Team assessment + Integration roadmap + Experimentation plan

---

## 1. Assess Team Readiness

### Individual Skills Assessment

**Requirement**: ≥50% team at Level 2+

📋 **Tool**: [Team Adoption Metrics](../templates/delivery/team-adoption-metrics.md)
**Quick assessment**:
| Team Member | Using AI Daily? | Level (1-4) | Champion Potential? |
|-------------|-----------------|-------------|---------------------|
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

**Readiness indicators**:
- ✅ **Ready**: ≥50% daily AI users, ≥1 Level 2+, champion identified
- ⚠️ **Almost**: 30-50% users, need 1-2 months individual adoption
- ❌ **Not ready**: <30% users, start with [Employee Framework](../employee/)

📋 **Full assessment**: [SKILLS.md](../SKILLS.md) - Team skills radar

---

## 2. Identify Team Integration Use Cases

**Focus on collective processes**, not individual tasks.

📋 **Tool**: [AI Integration Readiness](../templates/delivery/ai-integration-readiness.md)
### Team Process Categories

**Code Quality & Review** (High ROI):
- AI-assisted code review (consistency, best practices)
- Automated test generation (unit, integration)
- Documentation generation (API docs, architecture)
- Code refactoring suggestions

**Delivery Velocity** (Medium-High ROI):
- Sprint planning assistance (estimation, breakdown)
- User story refinement (acceptance criteria, edge cases)
- Technical spike research (architecture patterns, libraries)
- Dependency analysis

**Knowledge Management** (Medium ROI):
- Meeting notes automation
- Decision documentation (ADRs)
- Onboarding documentation
- FAQ generation from tickets

**Incident Response** (High Impact):
- Log analysis and pattern detection
- Runbook generation
- Post-mortem drafting
- Root cause analysis assistance

### Selection Matrix

| Process | Current Time | Team Impact | AI Suitability | Priority |
|---------|--------------|-------------|----------------|----------|
| Code review | 4h/dev/week | High | High | ⭐⭐⭐ |
| Test writing | 3h/dev/week | Medium | Very High | ⭐⭐⭐ |
| Documentation | 2h/dev/week | Medium | High | ⭐⭐ |
| Sprint planning | 4h/team/sprint | Medium | Medium | ⭐ |

**Select top 3** processes with highest (Time × Impact × AI Suitability)

---

## 3. Define Integration Approach

### Experimentation Canvas

📋 **Tool**: [Collective Experimentation Canvas](../templates/delivery/collective-experimentation-canvas.md)
**For each selected use case**:

| Element | Description |
|---------|-------------|
| **Process** | [Name of team process] |
| **Current state** | How we do it today |
| **AI augmentation** | How AI will help |
| **Success metric** | How we measure improvement |
| **Timeline** | 2-4 week experiment |
| **Owner** | [Team member responsible] |
| **Risk level** | Low/Medium/High |

**Example - Code Review**:
- **Process**: Pull request review
- **Current**: Manual review, 30min-1h per PR
- **AI augmentation**: AI pre-review for style, best practices, potential bugs
- **Success metric**: Review time reduced 30%, quality maintained
- **Timeline**: 4 weeks pilot
- **Owner**: Sarah (Senior Dev)
- **Risk**: Low (human review still required)

---

## 4. Plan Team Infrastructure

### Tool Stack Planning

**Budget planning**: Few k$/month typical

| Category | Tool Options | Cost | Use Case |
|----------|--------------|------|----------|
| **Team AI** | ChatGPT Team, Claude Team | $25-30/user | Collective conversations, shared history |
| **Code AI** | GitHub Copilot Business | $19/user | Code assistance across team |
| **API Access** | OpenAI API, Anthropic API | Usage-based | Custom integrations, automation |
| **Specialized** | Codeium Teams, Cursor Pro | $12-20/user | IDE integration, codebase context |

**Example team stack** (10 developers):
- ChatGPT Team: $30 × 10 = $300/mo
- GitHub Copilot Business: $19 × 10 = $190/mo
- API credits (experiments): $200/mo
- **Total**: ~$690/mo (~$70/dev/mo)

### Integration Points

- [ ] **Source control**: GitHub/GitLab integrations
- [ ] **CI/CD**: Automated AI checks in pipeline
- [ ] **Documentation**: Confluence/Notion AI features
- [ ] **Communication**: Slack/Teams AI apps
- [ ] **Project mgmt**: Jira/Linear AI features

---

## 5. Establish Success Metrics

### Baseline Measurement (Before AI)

**Collect current metrics** (1-2 sprint average):

| Metric | Current Baseline | Target (90 days) | Measurement Method |
|--------|------------------|------------------|-------------------|
| **Velocity** | ___ points/sprint | +15% | Sprint burndown |
| **Code review time** | ___ hours/week | -30% | GitHub/GitLab analytics |
| **Documentation** | ___ pages/sprint | +50% | Wiki page count |
| **Bugs in production** | ___ /month | -20% | Bug tracking system |
| **Time to resolve** | ___ hours | -25% | Incident tickets |

**Qualitative metrics**:
- [ ] Team satisfaction (survey: 1-5)
- [ ] AI adoption rate (% daily users)
- [ ] Knowledge sharing (# shared prompts/workflows)

---

## 6. Define Experiment Timeline

### 90-Day Roadmap

**Weeks 1-2: Prepare** (This phase)
- [ ] Team assessment complete
- [ ] Use cases selected (top 3)
- [ ] Experimentation plan documented
- [ ] Infrastructure planned
- [ ] Baseline metrics collected

**Weeks 3-5: Build**
- [ ] Tools deployed
- [ ] Policies established
- [ ] Team training completed
- [ ] First experiment launched

**Weeks 6-13: Run**
- [ ] All 3 experiments executed
- [ ] Metrics tracked weekly
- [ ] Learnings documented
- [ ] Best practices shared

---

## Phase 1 Checklist

Complete before moving to Phase 2:

### Team Readiness ✅
- [ ] ≥50% team uses AI daily
- [ ] AI champion identified
- [ ] Management support secured
- [ ] Budget approved

### Use Cases ✅
- [ ] 3 team processes selected
- [ ] Success metrics defined
- [ ] Baseline metrics collected
- [ ] Experiment timeline planned

### Infrastructure Planning ✅
- [ ] Tool stack selected
- [ ] Budget calculated (~$50-100/dev/mo)
- [ ] Integration points identified
- [ ] Procurement initiated

### Team Alignment ✅
- [ ] Kickoff meeting held
- [ ] Expectations set
- [ ] Concerns addressed
- [ ] Commitment secured

**Estimated time**: 1-2 weeks total

---

**Next**: [Phase 2: Build](02-build.md) - Infrastructure, policies, and team training
