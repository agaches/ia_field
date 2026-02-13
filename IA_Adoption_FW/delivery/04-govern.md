# 04 - Govern (Delivery)

> Team governance - Collective policies, validation, supervision

## 1. Assess Team Risks

### Main Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| **Generated code quality** | Production bugs | Systematic code review |
| **Output bias** | Poor UX | Validation process |
| **Team data leaks** | IP compromise | DLP monitoring basics |
| **Inconsistent usage** | Variable quality | Team standards |
| **Over-dependency** | Loss of autonomy | Continuous training |

### Risk Evaluation (simplified)

Per tool/pattern, score 1-5:
- Data impact (what data shared?)
- Quality impact (how validate outputs?)
- Productivity impact (gain vs risk?)
- Team impact (everyone can use?)

**Approval threshold**: Average score >3 → Tech lead approves

## 2. Document Team Policies (5-10 pages)

**Structure**:
1. **Acceptable Usage**: Approved tools, encouraged vs discouraged cases, limits
2. **Data Handling**: Classification (public/internal/confidential), sharing rules, anonymization
3. **Output Validation**: Code review for AI code, doc validation, tests required
4. **Approvals**: Who approves what (tech lead, PO), new tool process, escalation
5. **Monitoring**: Team dashboard (adoption, quality, costs), monthly reviews, adjustments

## 3. Apply Policies

### New Tool Approval Process

```
Proposal → Tech Lead evaluates (risk framework) → Score <3: Rejected | Score ≥3: Approved → Trial (1 sprint) → Re-evaluate
```

Timeline: 1-2 days decision, 1 sprint validation

### Peer Review Process

**For AI-generated code**:
1. Developer marks code as "AI-generated" in PR
2. Reviewer checks: logic, vulnerabilities (secrets, injection), tests, standards
3. Approve or request changes

**Light automation**: Pre-commit hooks (secrets), CI checks (tests), linting (standards)

## 4. Monitor Team Metrics

### Dashboard (monthly update)

**Adoption**: % PRs using AI, % team actively using, most used tools
**Quality**: Bug rate (AI vs manual), review time, regressions
**Productivity**: Velocity (story points/sprint), lead time, dev satisfaction (quarterly survey)
**Costs**: Cost/dev/month, estimated ROI

### Monthly Review (30min)

Present metrics, identify what works/doesn't, decide continue/adjust/stop, actions for next month.

## 5. Optional AI CoE

### Alternative: Platform Team

Without dedicated AI CoE, **platform team** or **tech leads** can: maintain approved tools list, organize internal training, share best practices, coordinate with other teams.

Major ethical risks escalated to management.

### Inter-Team Coordination

If multiple teams use AI: monthly tech leads meeting, share learnings, standardize tools (optional), shared license costs.

## 6. Cost Allocation

### Team Budget Model

**Per dev**: Copilot $10/month, ChatGPT Team $25/month, Other tools variable
**Team budget**: (# devs × cost/dev) + 20% buffer
**Tracking**: Monthly billing per team, dashboard in finance tool

**Example** (10 devs): Base $500/month + $100 buffer = $600/month = $7,200/year

## Govern Checklist

- [ ] Document team policy (5-10 pages)
- [ ] Establish approval process (tech lead)
- [ ] Implement peer review process
- [ ] Create metrics dashboard
- [ ] Plan monthly reviews
- [ ] Allocate team budget
- [ ] Train team on policies

## Next Step

→ [Phase 5: Secure](05-secure.md) - Secure team AI usage
