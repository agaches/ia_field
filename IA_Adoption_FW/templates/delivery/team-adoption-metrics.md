# Team Adoption Metrics

> **Purpose**: Track AI adoption rate and maturity across development team
> **Used in**: Delivery Phase 1 (Prepare) - Assess team readiness
> **Update frequency**: Weekly during ramp-up, monthly after stabilization

---

## Team Skills Assessment

**Requirement**: ≥50% team at Level 2+ before starting Delivery framework

| Team Member | Role | Using AI Daily? | Current Level | Target Level | Champion Potential? | Notes |
|-------------|------|-----------------|---------------|--------------|---------------------|-------|
| Alice | Senior Dev | ✅ Yes | Level 3 | Level 3 | ⭐ Yes | Strong prompt engineering |
| Bob | Dev | ✅ Yes | Level 2 | Level 3 | Maybe | Good adoption, needs training |
| Carol | Dev | ⚠️ Weekly | Level 1 | Level 2 | No | Needs buddy support |
| David | QA | ✅ Yes | Level 2 | Level 2 | No | Test automation focus |
| Eve | Dev | ❌ Rarely | Level 1 | Level 2 | No | Blocker: skeptical |

**Summary**:
- **Daily users**: 3/5 (60%) ✅
- **Level 2+**: 3/5 (60%) ✅
- **Champion candidates**: 1-2 ✅
- **Readiness**: ✅ Ready to proceed

---

## Readiness Indicators

| Indicator | Threshold | Current | Status |
|-----------|-----------|---------|--------|
| Daily AI users | ≥50% | 60% | ✅ |
| Team at Level 2+ | ≥50% | 60% | ✅ |
| AI Champion identified | ≥1 | 1 | ✅ |
| Management support | Yes | Yes | ✅ |
| Budget approved | Yes | Yes | ✅ |

**Overall Readiness**:
- ✅ **Ready**: ≥50% daily users, ≥1 Level 2+, champion identified
- ⚠️ **Almost**: 30-50% users, need 1-2 months individual adoption (use [Employee Framework](../../employee/))
- ❌ **Not ready**: <30% users, start with [Employee Framework](../../employee/)

---

## Weekly Adoption Tracking

Track during ramp-up phase (weeks 1-8):

| Week | Daily Active Users | Experiments Running | Shared Prompts | Issues Reported | Status |
|------|-------------------|---------------------|----------------|-----------------|--------|
| Week 1 | 3/5 (60%) | 0 | 0 | 0 | Baseline |
| Week 2 | 4/5 (80%) | 1 | 2 | 1 (API timeout) | ✅ |
| Week 3 | 4/5 (80%) | 2 | 5 | 0 | ✅ |
| Week 4 | 5/5 (100%) | 3 | 8 | 1 (cost spike) | ⚠️ |

**Target**: 100% daily active users by Week 4

---

## Team Maturity Progression

Track skill progression over 90 days:

| Domain | Week 0 | Week 4 | Week 8 | Week 12 | Target |
|--------|--------|--------|--------|---------|--------|
| **Conversational AI** | Level 2 | Level 2.5 | Level 3 | Level 3 | Level 3 |
| **Code Assistance** | Level 1.5 | Level 2 | Level 2.5 | Level 3 | Level 3 |
| **Tooling & Integration** | Level 1 | Level 2 | Level 2 | Level 2.5 | Level 2 |
| **Data & Security** | Level 1 | Level 2 | Level 2 | Level 2 | Level 2 |
| **Team Velocity** | Level 1 | Level 2 | Level 2 | Level 3 | Level 3 |

**Assessment guide**: See [SKILLS.md](../../SKILLS.md) for level definitions

---

## Blocker Identification

Track and resolve adoption blockers:

| Team Member | Blocker Type | Description | Resolution Plan | Owner | Status |
|-------------|--------------|-------------|-----------------|-------|--------|
| Eve | Skepticism | "AI writes bad code" | Pair with Alice, show use cases | Alice | In progress |
| Carol | Skills gap | Unsure how to prompt | Buddy system with Bob | Bob | Resolved |
| David | Tool access | API rate limit hit | Increase quota | Champion | Resolved |

**Common blocker types**:
- **Skills gap**: Assign buddy, provide training
- **Skepticism**: Demo quick wins, peer influence
- **Tool issues**: Technical support, configuration
- **Time pressure**: Management support, priority adjustment

---

## Blank Template

Copy and adapt for your team:

```markdown
## Team Skills Assessment

| Team Member | Role | Using AI Daily? | Current Level | Target Level | Champion Potential? | Notes |
|-------------|------|-----------------|---------------|--------------|---------------------|-------|
| | | | | | | |
| | | | | | | |
| | | | | | | |

**Summary**:
- **Daily users**: __/__ (___%)
- **Level 2+**: __/__ (___%)
- **Champion candidates**: __
- **Readiness**: ⬜ Ready / ⬜ Almost / ⬜ Not ready

---

## Weekly Adoption Tracking

| Week | Daily Active Users | Experiments Running | Shared Prompts | Issues Reported | Status |
|------|-------------------|---------------------|----------------|-----------------|--------|
| Week 1 | | | | | |
| Week 2 | | | | | |
| Week 3 | | | | | |
| Week 4 | | | | | |
```

---

## Related Templates

- [AI Integration Readiness](ai-integration-readiness.md) - Process evaluation
- [SKILLS.md](../../SKILLS.md) - Maturity assessment details
- [Employee Framework](../../employee/) - Individual skill development
