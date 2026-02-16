# Phase 3: Run

> **Goal**: Collective operations, velocity optimization, knowledge sharing
> **Time**: Ongoing
> **Output**: Sustained team productivity gains + Documented best practices

---

## 1. Execute Experiments

### Experiment Execution Framework

For each of the 3 selected use cases (from Prepare):

**Week 1-2: Launch**
- [ ] Kickoff with team
- [ ] Define success criteria
- [ ] Baseline metrics captured
- [ ] First iteration executed

**Week 3-4: Iterate**
- [ ] Collect feedback
- [ ] Adjust approach based on learnings
- [ ] Measure early results
- [ ] Document blockers

**Week 5-6: Evaluate**
- [ ] Compare metrics to baseline
- [ ] Team retrospective
- [ ] Decision: Scale, Pivot, or Stop
- [ ] Document learnings

### Experiment Tracking

📋 **Tool**: [Velocity Tracking Matrix](../templates/delivery/velocity-tracking-matrix.md)
| Experiment | Start Date | Status | Baseline | Current | Target | Decision |
|------------|------------|--------|----------|---------|--------|----------|
| AI Code Review | 2026-02-01 | Active | 60min/PR | 35min/PR | 42min/PR | ✅ Scale |
| Test Generation | 2026-02-15 | Active | 3h/dev/wk | 2.2h/dev/wk | 2.1h/dev/wk | ✅ Scale |
| Doc Automation | 2026-03-01 | Pilot | 2h/dev/wk | TBD | 1h/dev/wk | 🔄 Monitor |

---

## 2. Daily Team Operations

### Daily AI Hygiene (Team Level)

**Standup additions**: AI-assisted work? Blockers? Learnings?

**Code review additions**:
- [ ] AI-generated code reviewed thoroughly?
- [ ] Data classification verified?
- [ ] Novel approach rationale documented?

### Weekly: 3 touchpoints

- **Monday**: Review AI tool status, plan AI-assisted tasks, assign experiments
- **Wednesday**: Quick wins sharing (5 min), blocker resolution
- **Friday**: Learnings, update prompt library, cost review

---

## 3. Velocity & Quality Tracking

### Sprint Metrics Dashboard

Track these metrics every sprint:

| Metric | Baseline | Sprint N-1 | Sprint N | Target | Trend |
|--------|----------|------------|----------|--------|-------|
| **Velocity** | 40 pts | 43 pts | 46 pts | 46 pts (+ 15%) | ✅ ↗ |
| **Code review time** | 5h/dev | 4.2h/dev | 3.5h/dev | 3.5h/dev (-30%) | ✅ ↗ |
| **Bug escape rate** | 5/sprint | 4/sprint | 3/sprint | 4/sprint (-20%) | ✅ ↗ |
| **Documentation** | 3 pages | 4 pages | 5 pages | 4.5 pages (+50%) | ✅ ↗ |
| **Test coverage** | 65% | 68% | 72% | 70% | ✅ ↗ |

**Trends**:
- ✅ ↗ Improving (on track)
- ⚠️ → Flat (investigate)
- 🚨 ↘ Declining (immediate action)

### Quality Gates

**Before marking experiment "successful"**:
- [ ] Metrics meet target (≥95% of goal)
- [ ] Quality maintained or improved
- [ ] Team satisfaction positive (survey ≥4/5)
- [ ] No security incidents
- [ ] Documented and replicable

---

## 4. Knowledge Management

### Team Prompt Library

**Structure**:
```
team-ai-library/
├── code-review/
│   ├── security-checklist.md
│   ├── performance-review.md
│   └── best-practices.md
├── documentation/
│   ├── api-doc-generator.md
│   ├── readme-template.md
│   └── adr-template.md
├── testing/
│   ├── unit-test-generator.md
│   ├── edge-case-finder.md
│   └── test-data-generator.md
└── README.md
```

**Each prompt template includes**:
- Use case description
- Prompt with placeholders
- Example input/output
- Tips and variations
- Author and date

**Example prompt**:
````markdown
# Security Code Review Prompt

## Use Case
Review code changes for common security vulnerabilities

## Prompt
```
Review this code for security issues:
- SQL injection
- XSS vulnerabilities
- Hardcoded secrets
- Authentication/authorization flaws

Code:
[PASTE CODE HERE]

Provide:
1. List of issues found (severity: critical/high/medium/low)
2. Specific line numbers
3. Remediation suggestions
```

## Example
[Input/output example]

## Tips
- Run on every PR with external data
- Combine with automated SAST tools
- Always verify AI findings manually

Author: @security-champion | Last updated: 2026-02-15
````

### Knowledge Sharing Cadence

**Weekly**: Team tips sharing (5 min in standup)
**Bi-weekly**: Lunch & Learn (30 min deep dive)
**Monthly**: Best practices documentation update
**Quarterly**: Team retrospective and roadmap

---

## 5. Cost Optimization & ROI

### Monthly Team ROI Review

📋 **Tool**: [Cost & ROI Tracking](../templates/employee/cost-roi-tracking.md) adapted for team

| Tool | Cost | Team Hours Saved | Hourly Value | Value Created | ROI | Decision |
|------|------|------------------|--------------|---------------|-----|----------|
| ChatGPT Team | $300 | 60h | $75/h | $4,500 | **15x** | ✅ Keep |
| Copilot Business | $190 | 80h | $75/h | $6,000 | **32x** | ✅ Keep |
| API Credits | $450 | 30h | $75/h | $2,250 | **5x** | ✅ Optimize |
| **Total** | **$940** | **170h** |  | **$12,750** | **13.6x** | ✅ |

**Team average**: 170h/mo ÷ 10 devs = **17h/dev/mo saved**

**Decision criteria** (Team level):
- **ROI ≥5x**: Excellent, maintain or expand
- **ROI 3-5x**: Good, optimize usage
- **ROI <3x**: Review use cases or cancel

### Cost Optimization Strategies

**If ROI declining**:
- [ ] Survey team for adoption blockers
- [ ] Review which features underutilized
- [ ] Refresh training on high-value use cases
- [ ] Consider downgrading unused premium features

**If costs exceeding budget**:
- [ ] Audit API usage (identify spikes)
- [ ] Implement caching for repeated queries
- [ ] Optimize prompts (reduce token usage)
- [ ] Set per-user usage quotas if needed

---

## 6. Scale & Expand

### Scaling Successful Experiments

When experiment ROI ≥5x and team satisfaction ≥4/5:

**1. Formalize Practice**
- [ ] Document standard operating procedure
- [ ] Add to team onboarding
- [ ] Create templates and examples
- [ ] Assign owner for maintenance

**2. Expand Scope**
- [ ] Identify related use cases
- [ ] Pilot with adjacent teams
- [ ] Share learnings company-wide
- [ ] Consider automation opportunities

**3. Integrate Deeply**
- [ ] Build into CI/CD pipeline
- [ ] Automate repetitive parts
- [ ] Create custom integrations
- [ ] Monitor quality continuously

### Cross-Team Sharing

**Internal evangelism**:
- [ ] Present at engineering all-hands
- [ ] Write internal blog post
- [ ] Demo in tech talks
- [ ] Mentor other teams starting adoption

**Metrics to share**:
- Velocity improvement (%)
- Time saved (hours/sprint)
- Quality impact (bugs, coverage)
- Team satisfaction (survey)
- ROI (value created vs. cost)

---

## 7. Continuous Improvement

### Weekly Team Check-ins

**AI operations health check** (5 min):
- [ ] All tools available and performing well?
- [ ] Any security concerns or incidents?
- [ ] Cost within budget?
- [ ] Adoption rate stable or growing?

### Monthly Team Retrospective

**What's working well?**
- [List successes and wins]

**What needs improvement?**
- [List blockers and challenges]

**Actions for next month**:
- [3-5 specific actions with owners]

### Quarterly Strategic Review

- [ ] Review 90-day success criteria (Phase 1)
- [ ] Update team skills assessment
- [ ] Plan next quarter experiments
- [ ] Assess readiness for [Automation Framework](../automation/)
- [ ] Update budget and roadmap

---

## Success Validation (After 90 days)

**You've successfully completed Delivery Framework if:**

- ✅ ≥3 team processes AI-augmented
- ✅ Velocity increased ≥15%
- ✅ All team members using AI weekly
- ✅ Zero security incidents
- ✅ ROI ≥5x team investment
- ✅ Documented best practices shared
- ✅ Team satisfaction ≥4/5

**Next level**: Team Level 3 achieved! Consider [Automation Framework](../automation/) for production AI systems.

---

## Troubleshooting

| Issue | Symptoms | Actions |
|-------|----------|---------|
| **Low adoption** | <50% daily users after 30 days | Pair with champion, simplify use cases, celebrate wins |
| **No velocity gain** | Metrics flat after 60 days | Review baselines, extend timeline (3+ months), retro |
| **Cost overrun** | >20% over budget | Audit API usage, set quotas, optimize prompts, cache |

---

## Phase 3 Checklist

### Operations ✅
- [ ] All 3 experiments executed
- [ ] Metrics tracked consistently
- [ ] Weekly team sync established
- [ ] Incident response tested

### Knowledge Sharing ✅
- [ ] Team prompt library active and growing
- [ ] Best practices documented
- [ ] Lunch & Learns scheduled
- [ ] Cross-team sharing initiated

### Optimization ✅
- [ ] Monthly ROI review conducted
- [ ] Cost optimization implemented
- [ ] Quality gates validated
- [ ] Continuous improvement cycle active

### Scaling ✅
- [ ] Successful experiments formalized
- [ ] Adjacent use cases identified
- [ ] Other teams engaged
- [ ] Automation opportunities explored

---

**Congratulations!** Your team has successfully integrated AI into delivery processes.

**Next steps**:
- Continue iterating and optimizing
- Expand to new use cases
- Share learnings organization-wide
- When ready (6-12 months): [Automation Framework](../automation/)

---

**Questions?** Check [TRAINING.md](../TRAINING.md) for advanced topics or [SKILLS.md](../SKILLS.md) for skills development.
