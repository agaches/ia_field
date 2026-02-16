# AI Integration Readiness

> **Purpose**: Evaluate team processes for AI augmentation potential
> **Used in**: Delivery Phase 1 (Prepare) - Select integration use cases
> **Output**: Top 3 processes to pilot with AI assistance

---

## Process Evaluation Matrix

Assess each team process on 3 dimensions:

**Scoring** (1-5 scale):
- **Current Time**: 1=Low (<1h/sprint), 5=High (>20h/sprint)
- **Team Impact**: 1=Individual task, 5=Blocks entire team
- **AI Suitability**: 1=Humans much better, 5=Perfect for AI

**Priority Score** = Current Time × Team Impact × AI Suitability (max 125)

---

## Example: Development Team

| Process | Current Time | Team Impact | AI Suitability | Priority Score | Selected |
|---------|--------------|-------------|----------------|----------------|----------|
| **Code review** | 4 (4h/dev/week) | 5 (Blocks merges) | 4 (Style, patterns) | **80** | ⭐ #1 |
| **Test writing** | 4 (3h/dev/week) | 3 (Quality) | 5 (Highly repetitive) | **60** | ⭐ #2 |
| **Documentation** | 3 (2h/dev/week) | 3 (Knowledge) | 5 (Perfect fit) | **45** | ⭐ #3 |
| **Sprint planning** | 2 (4h/team/sprint) | 4 (Alignment) | 3 (Needs context) | **24** | ⬜ |
| **Bug triage** | 2 (2h/week) | 3 (Velocity) | 4 (Log analysis) | **24** | ⬜ |
| **Onboarding** | 1 (Once/quarter) | 2 (New hire) | 4 (FAQ generation) | **8** | ⬜ |

**Selected for 90-day pilot**: Code review (#1), Test writing (#2), Documentation (#3)

---

## Process Categories & AI Suitability

### Code Quality & Review (High ROI)

| Process | Typical Time | AI Suitability | Example Tools |
|---------|--------------|----------------|---------------|
| Code review | 3-5h/dev/week | ⭐⭐⭐⭐ High | GitHub Copilot, CodeRabbit |
| Test generation | 2-4h/dev/week | ⭐⭐⭐⭐⭐ Very High | Copilot, ChatGPT |
| Documentation | 1-3h/dev/week | ⭐⭐⭐⭐⭐ Very High | ChatGPT, Cursor |
| Refactoring | 2-3h/dev/week | ⭐⭐⭐⭐ High | Copilot, Cursor |

### Delivery Velocity (Medium-High ROI)

| Process | Typical Time | AI Suitability | Example Tools |
|---------|--------------|----------------|---------------|
| Sprint planning | 4h/team/sprint | ⭐⭐⭐ Medium | ChatGPT Team |
| Story refinement | 2-3h/sprint | ⭐⭐⭐⭐ High | ChatGPT, Claude |
| Technical spikes | 4-8h/spike | ⭐⭐⭐⭐ High | ChatGPT, Claude |
| Estimation | 2h/sprint | ⭐⭐ Low | (Better human) |

### Knowledge Management (Medium ROI)

| Process | Typical Time | AI Suitability | Example Tools |
|---------|--------------|----------------|---------------|
| Meeting notes | 1h/week | ⭐⭐⭐⭐⭐ Very High | Otter.ai, Fireflies |
| ADR writing | 2h/decision | ⭐⭐⭐⭐ High | ChatGPT, Claude |
| FAQ generation | 1h/week | ⭐⭐⭐⭐⭐ Very High | ChatGPT |
| Onboarding docs | 4h/quarter | ⭐⭐⭐⭐ High | ChatGPT, Notion AI |

### Incident Response (High Impact, Lower Frequency)

| Process | Typical Time | AI Suitability | Example Tools |
|---------|--------------|----------------|---------------|
| Log analysis | 1-2h/incident | ⭐⭐⭐⭐ High | ChatGPT, Claude |
| Runbook generation | 2h/process | ⭐⭐⭐⭐ High | ChatGPT |
| Post-mortem drafting | 2-3h/incident | ⭐⭐⭐ Medium | ChatGPT |
| Root cause analysis | 4-8h/incident | ⭐⭐⭐ Medium | ChatGPT, Claude |

---

## Selection Criteria

**Choose top 3 processes where**:
- ✅ High frequency (weekly or more)
- ✅ Significant time investment (>2h/week team-wide)
- ✅ Clear success metrics (time, quality, consistency)
- ✅ Low risk (non-critical, reversible)
- ✅ High AI suitability (≥4/5)

**Avoid starting with**:
- ❌ Once-a-quarter processes (low learning opportunity)
- ❌ Mission-critical with no fallback (too risky for pilot)
- ❌ Highly contextual processes (requires deep domain knowledge)
- ❌ Processes with unclear metrics (can't measure success)

---

## Risk Assessment

For each selected process:

| Risk Level | Description | Mitigation |
|------------|-------------|------------|
| **🟢 Low** | Read-only, no production impact | AI-generated suggestions reviewed by human |
| **🟡 Medium** | Dev/staging only, reversible | Automated tests + peer review required |
| **🔴 High** | Production changes, customer-facing | Human approval gate + rollback plan |

**Recommendation**: Start with 🟢 Low risk processes for first 4 weeks

---

## Blank Template

Copy and adapt for your team:

```markdown
## Process Evaluation Matrix

| Process | Current Time (1-5) | Team Impact (1-5) | AI Suitability (1-5) | Priority Score | Selected |
|---------|-------------------|-------------------|---------------------|----------------|----------|
| | | | | | |
| | | | | | |
| | | | | | |
| | | | | | |
| | | | | | |

**Selected for 90-day pilot**: ____________ (#1), ____________ (#2), ____________ (#3)

---

## Risk Assessment

| Process | Risk Level | Mitigation Strategy |
|---------|-----------|---------------------|
| | 🟢 / 🟡 / 🔴 | |
| | 🟢 / 🟡 / 🔴 | |
| | 🟢 / 🟡 / 🔴 | |
```

---

## Next Steps

After selecting top 3 processes:

1. **Document current state**: Baseline metrics (time, quality, satisfaction)
2. **Define success criteria**: Target improvements (e.g., -30% time, +20% coverage)
3. **Plan experiment**: Use [Collective Experimentation Canvas](collective-experimentation-canvas.md)
4. **Get team buy-in**: Present selection rationale, address concerns

---

## Related Templates

- [Collective Experimentation Canvas](collective-experimentation-canvas.md) - Plan experiments
- [Velocity Tracking Matrix](velocity-tracking-matrix.md) - Measure improvements
- [Team Adoption Metrics](team-adoption-metrics.md) - Track overall adoption
