# Velocity Tracking Matrix

> **Purpose**: Track team velocity and quality metrics during AI adoption
> **Used in**: Delivery Phase 3 (Run) - Monitor improvements
> **Update frequency**: Weekly during experiments, monthly after stabilization

---

## Sprint Metrics Dashboard

Track these metrics every sprint to measure AI integration impact:

| Metric | Baseline | Sprint N-2 | Sprint N-1 | Sprint N | Target (90 days) | Trend | Status |
|--------|----------|------------|------------|----------|------------------|-------|--------|
| **Velocity** (story points) | 40 | 41 | 43 | 46 | 46 (+15%) | ✅ ↗ | On track |
| **Code review time** (h/dev) | 5.0 | 4.5 | 4.2 | 3.5 | 3.5 (-30%) | ✅ ↗ | On track |
| **Bug escape rate** (/sprint) | 5 | 5 | 4 | 3 | 4 (-20%) | ✅ ↗ | Exceeding |
| **Test coverage** (%) | 65 | 66 | 68 | 72 | 70 (+5%) | ✅ ↗ | Exceeding |
| **Documentation** (pages) | 3 | 3 | 4 | 5 | 4.5 (+50%) | ✅ ↗ | On track |
| **Tech debt** (hours) | 20 | 18 | 16 | 14 | 15 (-25%) | ✅ ↗ | On track |

**Legend**:
- ✅ ↗ Improving (on track or exceeding)
- ⚠️ → Flat (needs investigation)
- 🚨 ↘ Declining (immediate action required)

---

## Experiment-Specific Tracking

For each of the 3 experiments, track weekly progress:

### Experiment 1: Code Review

| Week | Time/PR (min) | PRs Reviewed | AI Suggestions Used (%) | Issues Found | Team Satisfaction (/5) | Status |
|------|---------------|--------------|-------------------------|--------------|------------------------|--------|
| **Baseline** | 45 | 8 | 0% | 12 | 3.2 | Before AI |
| Week 1 | 42 | 8 | 65% | 11 | 3.5 | ✅ Early win |
| Week 2 | 38 | 9 | 75% | 13 | 3.8 | ✅ Improving |
| Week 3 | 35 | 10 | 80% | 14 | 4.0 | ✅ On target |
| Week 4 | 32 | 11 | 85% | 15 | 4.2 | ✅ Exceeding |
| **Target** | 30 (-33%) | 10+ | 80%+ | ≥12 | ≥4.0 | **Success** ✅ |

**Decision**: ✅ **Scale** - Formalize as team standard

---

### Experiment 2: Test Generation

| Week | Test Writing Time (h/dev) | Tests Written | AI-Generated (%) | Coverage Increase | Passing Rate (%) | Status |
|------|---------------------------|---------------|------------------|-------------------|------------------|--------|
| **Baseline** | 3.0 | 25 | 0% | 0% | 98% | Before AI |
| Week 1 | 2.8 | 28 | 35% | +1.5% | 97% | ⚠️ Quality dip |
| Week 2 | 2.5 | 32 | 50% | +2.5% | 98% | ✅ Recovering |
| Week 3 | 2.2 | 35 | 60% | +4% | 99% | ✅ Improving |
| Week 4 | 2.0 | 38 | 70% | +5% | 99% | ✅ On target |
| **Target** | 2.0 (-33%) | 35+ | 60%+ | +5% | ≥98% | **Success** ✅ |

**Decision**: ✅ **Scale** - Team confident in AI test quality

---

### Experiment 3: Documentation

| Week | Doc Time (h/dev) | Pages Updated | AI-Drafted (%) | Reader Satisfaction (/5) | Outdated Docs | Status |
|------|------------------|---------------|----------------|--------------------------|---------------|--------|
| **Baseline** | 2.0 | 3 | 0% | 3.0 | 15 | Before AI |
| Week 1 | 1.8 | 4 | 50% | 3.2 | 14 | ✅ Early win |
| Week 2 | 1.6 | 5 | 70% | 3.5 | 12 | ✅ Improving |
| Week 3 | 1.4 | 6 | 80% | 4.0 | 10 | ✅ On target |
| Week 4 | 1.2 | 7 | 85% | 4.2 | 8 | ✅ Exceeding |
| **Target** | 1.0 (-50%) | 6+ | 75%+ | ≥4.0 | <10 | **Success** ✅ |

**Decision**: ✅ **Scale** - Docs now kept up-to-date easily

---

## Team-Wide ROI Tracking

Monthly calculation of AI investment return:

| Month | Tool Costs | Team Hours Saved | Hourly Value | Value Created | ROI | Decision |
|-------|------------|------------------|--------------|---------------|-----|----------|
| **Feb** | $940 | 60h | $75/h | $4,500 | **4.8x** | ✅ Positive |
| **Mar** | $940 | 120h | $75/h | $9,000 | **9.6x** | ✅ Excellent |
| **Apr** | $940 | 170h | $75/h | $12,750 | **13.6x** | ✅ Outstanding |
| **Target** | <$1,000 | 150h+ | - | $11,250+ | **≥5x** | Continue |

**Breakdown by tool**:

| Tool | Monthly Cost | Hours Saved | Hourly Value | Value Created | ROI | Status |
|------|--------------|-------------|--------------|---------------|-----|--------|
| ChatGPT Team (10 users) | $300 | 60h | $75/h | $4,500 | **15x** | ✅ Keep |
| GitHub Copilot Business | $190 | 80h | $75/h | $6,000 | **32x** | ✅ Keep |
| API Credits (automation) | $450 | 30h | $75/h | $2,250 | **5x** | ✅ Optimize |
| **Total** | **$940** | **170h** | - | **$12,750** | **13.6x** | ✅ Success |

**Decision thresholds** (Team level):
- **ROI ≥5x**: Excellent, maintain or expand usage
- **ROI 3-5x**: Good, optimize for higher value use cases
- **ROI 1-3x**: Marginal, review usage patterns or cancel
- **ROI <1x**: Negative, cancel unless strategic learning investment

---

## Quality Gate Validation

Before marking experiments "successful", validate all quality gates:

| Quality Gate | Threshold | Current | Pass/Fail |
|--------------|-----------|---------|-----------|
| **Metrics meet target** | ≥95% of goal | 103% | ✅ PASS |
| **Quality maintained** | No degradation | +5% test coverage | ✅ PASS |
| **Team satisfaction** | ≥4/5 | 4.2/5 | ✅ PASS |
| **Zero security incidents** | 0 | 0 | ✅ PASS |
| **Documented & replicable** | Yes | Yes | ✅ PASS |
| **ROI positive** | ≥5x | 13.6x | ✅ PASS |

**Overall**: ✅ **PASS** - All gates met, experiments ready to scale

---

## Leading Indicators (Early Signals)

Track weekly to catch issues before they impact sprint metrics:

| Indicator | Target | Week 1 | Week 2 | Week 3 | Week 4 | Trend |
|-----------|--------|--------|--------|--------|--------|-------|
| **Daily active users** (%) | 100% | 80% | 85% | 90% | 95% | ✅ ↗ |
| **AI suggestions accepted** (%) | 60%+ | 55% | 65% | 70% | 75% | ✅ ↗ |
| **Tool availability** (%) | 99%+ | 98% | 99.5% | 99.8% | 99.9% | ✅ ↗ |
| **Cost per user** ($/month) | <$100 | $95 | $92 | $94 | $90 | ✅ ↗ |
| **Support tickets** (count) | <5 | 8 | 5 | 3 | 2 | ✅ ↗ |

**Alerts**:
- 🚨 Daily active users <70% → Investigate adoption barriers
- 🚨 AI suggestions accepted <40% → Tool not providing value
- 🚨 Tool availability <95% → Service issues, consider backup
- 🚨 Cost per user >$120 → Usage spike, implement quotas

---

## Comparison: Before vs After (90 days)

**Team: 10 developers**

### Before AI (Baseline)

| Metric | Value |
|--------|-------|
| Sprint velocity | 40 points |
| Code review | 5h/dev/week (50h team) |
| Test writing | 3h/dev/week (30h team) |
| Documentation | 2h/dev/week (20h team) |
| Bug escape rate | 5/sprint |
| **Total time on overhead** | **100h/week** |

---

### After AI (Month 3)

| Metric | Value | Change |
|--------|-------|--------|
| Sprint velocity | 46 points | **+15%** ✅ |
| Code review | 3.5h/dev/week (35h team) | **-30%** ✅ |
| Test writing | 2h/dev/week (20h team) | **-33%** ✅ |
| Documentation | 1h/dev/week (10h team) | **-50%** ✅ |
| Bug escape rate | 3/sprint | **-40%** ✅ |
| **Total time on overhead** | **65h/week** | **-35%** ✅ |
| **Time saved** | **35h/week** | **= 140h/month** |

---

### ROI Calculation

**Investment**:
- Tools: $940/month
- Training: $2,000 (one-time, amortized over 6 months = $333/month)
- Champion time: 4h/week × $100/h = $400/month
- **Total**: $1,673/month

**Return**:
- Time saved: 140h/month × $75/h = **$10,500/month**
- Quality improvement: Reduced production bugs (estimated $2,000/month savings)
- **Total value**: **$12,500/month**

**ROI**: $12,500 / $1,673 = **7.5x**

**Payback period**: <1 month

---

## Blank Template

Copy and adapt for your team:

```markdown
## Sprint Metrics Dashboard

| Metric | Baseline | Sprint N-2 | Sprint N-1 | Sprint N | Target | Trend | Status |
|--------|----------|------------|------------|----------|--------|-------|--------|
| **Velocity** | | | | | | | |
| **Code review time** | | | | | | | |
| **Bug escape rate** | | | | | | | |
| **Test coverage** | | | | | | | |
| **Documentation** | | | | | | | |

---

## Experiment Tracking

### Experiment: [Name]

| Week | Metric 1 | Metric 2 | Metric 3 | Status |
|------|----------|----------|----------|--------|
| Baseline | | | | |
| Week 1 | | | | |
| Week 2 | | | | |
| Week 3 | | | | |
| Week 4 | | | | |
| Target | | | | |

**Decision**: ✅ Scale / 🔄 Pivot / ❌ Stop

---

## Monthly ROI

| Month | Costs | Hours Saved | Value Created | ROI |
|-------|-------|-------------|---------------|-----|
| | | | | |
| | | | | |
| Target | | | | ≥5x |
```

---

## Related Templates

- [Collective Experimentation Canvas](collective-experimentation-canvas.md) - Plan experiments
- [Team Adoption Metrics](team-adoption-metrics.md) - Adoption tracking
- [Cost & ROI Tracking](../employee/cost-roi-tracking.md) - Individual ROI calculation
