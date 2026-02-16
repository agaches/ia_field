# Collective Experimentation Canvas

> **Purpose**: Plan and track team AI integration experiments
> **Used in**: Delivery Phase 1 (Prepare) - Define integration approach
> **Duration**: 2-6 week experiments per use case

---

## Experiment Canvas Template

Use one canvas per selected team process:

### Experiment: [Process Name]

**Owner**: [Team member responsible]
**Duration**: [Start date] → [End date] (typically 4-6 weeks)
**Risk Level**: 🟢 Low / 🟡 Medium / 🔴 High

---

#### 1. Current State

**How we do it today**:
- [Describe current workflow, tools, and time investment]
- [Pain points and inefficiencies]

**Baseline metrics** (collected over 2 sprints):
- **Time**: ___ hours/week (team total)
- **Quality**: ___ (bugs/coverage/consistency metric)
- **Satisfaction**: ___/5 (team survey)

---

#### 2. AI Augmentation Plan

**How AI will help**:
- [Specific AI capabilities to apply]
- [What stays human, what becomes AI-assisted]

**Tools to use**:
- Primary: [e.g., GitHub Copilot, ChatGPT Team]
- Backup: [Alternative if primary fails]

**Integration point**:
- [Where in workflow AI fits: Before? During? After?]

---

#### 3. Success Criteria

**Target improvements** (after 6 weeks):
- **Time**: Reduce by ___% (target: ___ hours/week)
- **Quality**: Improve ___ to ___ OR maintain current
- **Satisfaction**: ≥4/5 team survey

**Must maintain**:
- [ ] Zero security incidents
- [ ] Quality not degraded
- [ ] Team satisfaction positive

---

#### 4. Experiment Phases

**Week 1-2: Launch**
- [ ] Kickoff with team
- [ ] Define success criteria (this document)
- [ ] Baseline metrics captured
- [ ] First iteration executed

**Week 3-4: Iterate**
- [ ] Collect feedback (mid-experiment retro)
- [ ] Adjust approach based on learnings
- [ ] Measure early results
- [ ] Document blockers

**Week 5-6: Evaluate**
- [ ] Compare metrics to baseline
- [ ] Team retrospective
- [ ] Decision: ✅ Scale / 🔄 Pivot / ❌ Stop
- [ ] Document learnings

---

#### 5. Decision Criteria

**Scale** (formalize and expand):
- ✅ Metrics ≥95% of target
- ✅ Quality maintained or improved
- ✅ Team satisfaction ≥4/5
- ✅ No security incidents

**Pivot** (adjust and retry):
- 🔄 Metrics 50-95% of target
- 🔄 Quality maintained but potential untapped
- 🔄 Team feedback suggests different approach

**Stop** (abandon this use case):
- ❌ Metrics <50% of target
- ❌ Quality degraded
- ❌ Team satisfaction <3/5
- ❌ Security incidents occurred

---

## Example: Code Review Experiment

### Experiment: AI-Assisted Code Review

**Owner**: Sarah (Senior Dev)
**Duration**: 2026-02-01 → 2026-03-15 (6 weeks)
**Risk Level**: 🟢 Low (AI suggestions, human final decision)

---

#### 1. Current State

**How we do it today**:
- Manual PR review by 1-2 developers
- Focus on: code style, best practices, bugs, security
- Avg 30-60 min per PR, 5-8 PRs/week
- Bottleneck: senior devs reviewing everything

**Baseline metrics**:
- **Time**: 4.5 hours/dev/week (×5 devs = 22.5h/week team)
- **Quality**: 5 bugs/sprint escape to production
- **Satisfaction**: 3.2/5 (slow reviews, inconsistent feedback)

---

#### 2. AI Augmentation Plan

**How AI will help**:
- AI pre-review for: style violations, common bugs, security patterns
- Human review focuses on: architecture, business logic, context
- AI generates review comment drafts, human edits/approves

**Tools to use**:
- Primary: GitHub Copilot code review feature
- Backup: ChatGPT with PR diff + custom prompt

**Integration point**:
- AI runs on PR open (automated check)
- Reviewer sees AI findings before starting manual review
- Human adds context-specific feedback

---

#### 3. Success Criteria

**Target improvements**:
- **Time**: Reduce by 30% → 3.2h/dev/week (×5 = 16h/week team) = **6.5h/week saved**
- **Quality**: Maintain ≤5 bugs/sprint (ideally reduce to 3-4)
- **Satisfaction**: ≥4/5 (faster reviews, more consistent)

**Must maintain**:
- [ ] Zero false negatives (AI misses critical bugs)
- [ ] Zero credentials exposed
- [ ] Human still reads all code

---

#### 4. Experiment Phases

**Week 1-2: Launch**
- [x] Kickoff (2026-02-01): Explained AI role, addressed concerns
- [x] GitHub Copilot configured for all PRs
- [x] Baseline collected (Jan sprints: 22.5h/week, 5 bugs)
- [x] First 3 PRs reviewed with AI assistance

**Week 3-4: Iterate**
- [x] Mid-experiment retro (2026-02-15): AI too verbose, adjusted prompts
- [x] Tested custom prompt for security-focused reviews
- [ ] Measured: 18h/week (↓20%), 4 bugs (↓20%) ✅
- [x] Blocker: AI flagged false positives, team learned to filter

**Week 5-6: Evaluate**
- [ ] Final metrics (2026-03-08): TBD
- [ ] Team retrospective (2026-03-12)
- [ ] Decision: Trending towards ✅ Scale
- [ ] Document best prompts in team library

---

#### 5. Decision Criteria

**Current trajectory** (Week 4):
- ✅ Time: 20% reduction (target 30%, on track)
- ✅ Quality: 4 bugs (maintained, slightly improved)
- ✅ Satisfaction: 4.2/5 (early survey, positive)
- ✅ Zero security incidents

**Likely decision**: ✅ **Scale** (formalize as standard practice)

---

## Experiment Tracking Dashboard

Track all 3 experiments in one view:

| Experiment | Owner | Week | Status | Baseline | Current | Target | On Track? | Decision |
|------------|-------|------|--------|----------|---------|--------|-----------|----------|
| **Code Review** | Sarah | 4/6 | Active | 22.5h/wk | 18h/wk | 16h/wk | ✅ Yes | Likely Scale |
| **Test Generation** | Bob | 2/6 | Active | 3h/dev/wk | 2.8h/dev/wk | 2.1h/dev/wk | ✅ Yes | TBD |
| **Doc Automation** | Carol | 1/6 | Pilot | 2h/dev/wk | TBD | 1h/dev/wk | ⏳ Early | TBD |

---

## Blank Canvas Template

```markdown
### Experiment: [Process Name]

**Owner**: _______________
**Duration**: ________ → ________ (__ weeks)
**Risk Level**: 🟢 / 🟡 / 🔴

---

#### 1. Current State

**How we do it today**:
-

**Baseline metrics**:
- **Time**: ___ hours/week
- **Quality**: ___
- **Satisfaction**: ___/5

---

#### 2. AI Augmentation Plan

**How AI will help**:
-

**Tools to use**:
- Primary:
- Backup:

**Integration point**:
-

---

#### 3. Success Criteria

**Target improvements**:
- **Time**: Reduce by ___% → ___ hours/week
- **Quality**: ___
- **Satisfaction**: ≥4/5

**Must maintain**:
- [ ] Zero security incidents
- [ ] Quality not degraded
- [ ] Team satisfaction positive

---

#### 4. Experiment Phases

**Week 1-2: Launch**
- [ ] Kickoff with team
- [ ] Baseline metrics captured
- [ ] First iteration executed

**Week 3-4: Iterate**
- [ ] Collect feedback
- [ ] Adjust approach
- [ ] Measure early results

**Week 5-6: Evaluate**
- [ ] Compare metrics to baseline
- [ ] Team retrospective
- [ ] Decision: ✅ Scale / 🔄 Pivot / ❌ Stop

---

#### 5. Decision Criteria

**Current trajectory** (Week __):
- ⬜ Time: ___
- ⬜ Quality: ___
- ⬜ Satisfaction: ___/5
- ⬜ Security incidents: ___

**Decision**: ✅ Scale / 🔄 Pivot / ❌ Stop
```

---

## Related Templates

- [AI Integration Readiness](ai-integration-readiness.md) - Select processes
- [Velocity Tracking Matrix](velocity-tracking-matrix.md) - Track progress
- [Team Adoption Metrics](team-adoption-metrics.md) - Monitor team engagement
