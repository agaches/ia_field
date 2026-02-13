# 06 - Manage (Delivery)

> Basic MLOps - Monitoring, versioning, costs, continuity

## 1. Operations: Basic Monitoring

### Daily Administration

**Responsible**: Tech lead or designated admin

**Onboarding (new member)**:
```markdown
New dev checklist [Name]
- [ ] Create necessary accounts (VCS, AI tools)
- [ ] Assign licenses/access (based on team stack)
- [ ] Send access to shared resources (prompts, configs)
- [ ] Schedule 2h training (policy, tools, demos)
- [ ] Add to team dashboard (tracking costs, adoption)
- [ ] Date: [Date] | Budget impact: +[varies by stack]
```

> **Adapt to your stack**: List specific tools your team uses (SaaS accounts, self-hosted access, etc.)

**Offboarding (departing member)**:
```markdown
Departing dev checklist [Name]
- [ ] Revoke all system access (immediate)
- [ ] Recover licenses/resources (reallocation or savings)
- [ ] Remove from team dashboard
- [ ] Archive data if required (compliance)
- [ ] Date: [Date] | Budget impact: -[varies by stack]
```

> **Adapt to your stack**: List specific systems to revoke (VCS, SaaS tools, self-hosted access, etc.)

**Daily support**:
- Tool questions → Dedicated Slack channel
- Access issues → Admin resolves <2h
- New license requests → Lead validation + budget addition

**Monthly management reporting**:
- Adoption (% active team)
- Costs (budget vs actual)
- ROI (velocity, satisfaction)
- Incidents (downtime, issues)

### Adoption & Usage Metrics

**Team Dashboard** (Google Sheets/Notion, monthly update):

| Metric | Target | Current |
|--------|--------|---------|
| **Active users** (% daily AI usage) | >80% | ? |
| **PRs with AI** | >60% | ? |
| **Tools used** (avg/dev) | 2-3 | ? |
| **Satisfaction** (1-5) | >4 | ? |

**Sources**: GitHub Insights (PRs, commits, Copilot), monthly survey, retro feedback

### Performance Monitoring

| Tool | Metric | Acceptable |
|------|--------|------------|
| **GitHub Copilot** | Suggestion acceptance rate | >30% |
| **Code review AI** | Average review time | <2h |
| **Test generation** | Coverage increase | +10-20% |

**Simple monitoring**: Monthly GitHub metrics review, focus on trends not absolute values.

### Quality Tracking (AI vs Manual)

**Monthly comparison**:
- Bug rate (bugs per story)
- Test coverage
- Code review comments per PR
- Regression rate (post-deploy incidents)

**If AI code systematically has more bugs**: Identify why (inadequate prompts, lack of review, misconfigured tools).

### Uptime Monitoring

SaaS tools: Uptime managed by providers. Check status pages if issues.

**Incident Log** (quarterly review):
```
| Date | Tool | Duration | Impact | Action |
|------|------|----------|--------|--------|
```

Identify tools with most incidents, evaluate if need more robust fallback.

## 2. Deployments: Git Versioning + Simple Deployment

### Versioning AI-Generated Code

**Commit messages**:
```bash
# Good
git commit -m "feat: add user registration endpoint

- Generated boilerplate with Copilot
- Manually added validation/error handling
- Added tests (AI-generated + manual review)"
```

**PR Template**:
```markdown
## Changes
[Description]

## AI Usage
- [ ] AI-generated code (specify tool and scope)
- [ ] Prompts used: [link to prompt library]
- [ ] Manual review done
- [ ] Tests added and validated

## Checklist
- [ ] Tests pass
- [ ] Coverage >70%
- [ ] No secrets committed
- [ ] Docs updated
```

### Simple Branching (Git Flow)

```
main (production) ← develop (staging) ← feature/* branches
```

**Workflow**: Create feature branch → Develop with AI (commit regularly) → PR to develop (code review) → Merge → Deploy staging (auto) → Validation → PR to main (release) → Deploy production

### Basic CI/CD (GitHub Actions)

```yaml
name: CI
on: [pull_request, push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup, Install, Lint, Test, Coverage, Security scan

  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/develop'
    # Deploy to staging

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    # Deploy to production
```

**Characteristics**: Auto tests per PR, auto deploy staging (develop), auto deploy production (main), integrated security scan.

### Simple Rollback

**If production breaks**:
```bash
# Option 1: Revert commit
git revert HEAD && git push origin main

# Option 2: Rollback to previous
git reset --hard HEAD~1 && git push --force origin main

# Option 3: Redeploy previous tag
git checkout v1.2.3 && git push origin main --force
```

**Procedure**: Identify issue (monitoring) → Decide fix forward or rollback → Execute rollback (<15min) → Validate in staging → Redeploy → Post-mortem

## 3. Models: Basic Tracking

### Model Tracking

**For managed tools**: Provider-managed models (document which model/version used)
**For self-hosted**: Track model name, version, source (HuggingFace, local fine-tune, etc.)

**Document in code**:
```python
"""
Generated with: [Tool name] ([Model name/version])
Date: 2025-02-13
Prompt: "Create FastAPI endpoint for auth"
Modifications: Added rate limiting, logging
"""
```

**Examples**:
- Commercial: "GitHub Copilot (GPT-4)", "ChatGPT (GPT-4 Turbo)", "Claude (Sonnet 3.5)"
- Self-hosted: "Ollama (Llama 3.1 8B)", "vLLM (CodeLlama 13B)", "LM Studio (Mistral 7B)"

**Why**: Reproduce results, debug if model changes, understand quality by model.

### Prompt Versioning (Git)

**Structure**:
```
team-ai-prompts/
├── CHANGELOG.md
├── prompts/
│   ├── code-review-v1.md
│   ├── code-review-v2.md (improved)
```

**Versioning example**:
```markdown
# Code Review Prompt v2

## Changelog
- v2 (2025-02-13): Added security focus, examples
- v1 (2025-01-15): Initial

## Usage Stats
- Used: 45 times
- Success rate: 87%
- Best for: Backend API code
```

**Benefits**: Continuous iteration, traceability, team sharing.

### Custom Models (Rare)

If fine-tuning (OpenAI, Anthropic):

**Metadata to track**:
```yaml
model_id: team-code-reviewer-v1
base_model: gpt-3.5-turbo
training_date: 2025-02-10
training_data: 1000 code reviews (anonymized)
training_cost: $45
performance_vs_base: +15% relevant suggestions
owner: tech-lead@company.com
```

**Monitoring**: Quality (team feedback), Cost (training + inference), Usage (active users)

### Model Versioning (Lightweight)

**For custom models** (rare at Delivery level, but if fine-tuning):

**Metadata tracking** (YAML file in git):
```yaml
# models/team-code-reviewer-v1.yaml
model_id: team-code-reviewer-v1
base_model: gpt-3.5-turbo
training_date: 2025-02-10
training_cost: $45
dataset_size: 1200 examples
performance:
  base_accuracy: 72%
  finetuned_accuracy: 87%
  improvement: +15%
notes: Specialized for code review comments
```

**Storage**:
- **Model files**: Object storage with versioning (cloud or self-hosted: MinIO, S3-compatible)
- **Metadata**: Git (YAML files) for traceability
- **Training logs**: Logging system (cloud service, self-hosted: Loki, Elasticsearch)

**Rollback procedure**:
```bash
# If new model degrades performance
# 1. Copy previous version from versioned storage
# Examples:
#   - Cloud: aws s3 cp / gsutil cp / az storage blob download
#   - Self-hosted: mc cp (MinIO), rclone copy
# object-storage-cli cp storage://models/team-code-reviewer-v1.tar.gz ./

# 2. Redeploy previous version
# (depends on deployment method - API key change, endpoint update, etc.)

# 3. Document rollback reason
git commit -m "Rollback to v1: v2 showed 10% accuracy regression"
```

**Tools** (if needed for sophisticated tracking):
- **DVC (Data Version Control)**: Git-like versioning for models and datasets
  ```bash
  dvc add models/model.pkl
  dvc push  # Push to remote storage (S3, GCS, etc.)
  ```
- **MLflow**: Model registry + experiment tracking + metrics visualization
  ```python
  import mlflow
  mlflow.log_model(model, "team-code-reviewer")
  mlflow.log_metric("accuracy", 0.87)
  ```
- **Weights & Biases**: Experiment tracking, hyperparameter tuning, visualization

**When to use model versioning**:
- ✅ Fine-tuning custom models (rare but growing)
- ✅ Multiple model versions in production (A/B testing)
- ✅ Regulatory requirements (audit trail, reproducibility)
- ❌ SaaS tools only (GitHub Copilot, ChatGPT) - provider-managed, no versioning needed

**Best practices**:
1. **Always track metadata** in git (even if model files are external)
2. **Version models semantically**: v1.0.0 (major.minor.patch)
3. **Test before promoting**: New version must outperform previous on test set
4. **Automate rollback**: Script the rollback process (<5 min to execute)
5. **Archive old models**: Keep last 3 versions, archive older ones

**Important**: Fine-tuning rare for dev teams. Most use off-the-shelf models.

## 4. Costs: Team Budget & Allocation

### Monthly Budget

**Cost factors depend on stack choice**:

**SaaS-heavy approach**:
- Per-user licenses: $30-70/dev/month
- Team (10 devs): $500-700/month + 20% buffer

**Self-hosted approach**:
- Infrastructure: $100-500/month (compute, storage)
- Maintenance effort: [Team time investment]
- Team (10 devs): $100-500/month

**Hybrid approach**:
- Mix of licenses + infrastructure: $300-600/month

**Budget validation**: If total cost < 1 dev-week/quarter (~$2K) → Excellent ROI

### Per-Dev Allocation

**Tracking** (adapt to your tools):
```
| Dev | Tool 1 | Tool 2 | Infrastructure Share | Total | Usage |
|-----|--------|--------|---------------------|-------|-------|
| Alice | [cost] | [cost] | [cost] | $XX | Active daily |
| Dave | $0 | $0 | $0 | $0 | Opt-out |
```

**Analysis**: Understand opt-outs, identify underutilization, adjust allocations.

> **SaaS**: Track per-user licenses. **Self-hosted**: Allocate infrastructure costs proportionally.

### Cost Dashboard

**Monthly tracking** (Google Sheets):
```
| Month | Copilot | ChatGPT | Other | Total | Budget | Delta |
|-------|---------|---------|-------|-------|--------|-------|
| Jan | $190 | $120 | $50 | $360 | $600 | -$240 |
```

**ROI estimation**:
```
| Metric | Value |
|--------|-------|
| Cost Q1 | $1,225 |
| Velocity gain | +15% |
| Time saved | ~40h |
| Cost avoided | ~$4,000 |
| ROI | 3.3x |
```

### Cost Optimization

**Strategy 1: Right-size Your Stack**
- **SaaS**: Shared licenses vs individual, team vs enterprise tiers
- **Self-hosted**: Right-size infrastructure (CPU/GPU, storage)
- **Hybrid**: Balance based on usage patterns

**Strategy 2: Smart Allocation**
- Essential tools: All team members
- Premium/advanced: Leads, seniors, power users
- Optional: Evaluate benefit before expanding

**Strategy 3: Consider Self-Hosting**
- High usage + technical capacity → Self-hosted can reduce costs
- Low usage or limited capacity → SaaS often more cost-effective
- Calculate: License costs vs infrastructure + maintenance effort

**Strategy 4: Monthly Review** (30min)
Present dashboard, identify underutilization, gather feedback, adjust next month.

## 5. Data: Basic Versioning

### Dataset Versioning (if RAG/ML)

**Structure**:
```
data/
├── embeddings/
│   ├── codebase-v1.json (Jan 2025)
│   ├── codebase-v2.json (Feb 2025)
│   └── CHANGELOG.md
```

**CHANGELOG**:
```markdown
## v2 (2025-02-15)
- Added 50 new files
- Removed deprecated modules
- Re-embedded with text-embedding-3-large
- Size: 2.3MB (was 1.8MB)
```

**Why**: Reproduce RAG results, debug quality drops, rollback if new version worse.

### Data Quality Checks

**Validation script**:
```python
def validate_embeddings(file_path):
    data = json.load(open(file_path))
    assert "embeddings" in data
    assert len(data["embeddings"]) > 0
    assert "version" in data["metadata"]
    return True
```

**Execute**: Before commit, CI/CD automation.

### Backups

**Data to backup**: Embeddings/vectors (RAG), fine-tuned models (custom), prompt library (Git), configs (Git)

**Strategy**:
- Git: Code, prompts, configs (primary)
- Cloud storage: Embeddings, models (S3, GCS, Azure Blob)
- Frequency: Each major version

## 6. Continuity: Backup & Fallback

### Continuity Plan

| Scenario | Probability | Impact | RTO | Strategy |
|----------|-------------|--------|-----|----------|
| **Copilot down** | Low | Medium | N/A | Use Codeium or manual |
| **ChatGPT down** | Low | Low | N/A | Use Claude or Gemini |
| **GitHub down** | Very low | High | 4h | Wait (no alternative) |
| **Dev machine failure** | Medium | Medium | 2h | Cloud backup, reinstall |

**RTO**: Recovery Time Objective (max acceptable downtime)

### Fallback Tools

**Define fallbacks for your stack**:

**Examples by category**:
- **Code assistant**: Primary (commercial/self-hosted) → Fallback (alternative assistant or manual)
- **LLM access**: Primary API → Fallback API or self-hosted model
- **Self-hosted service**: Redundancy, backups, or commercial alternative

**Preparation**: Setup fallback tools (ready but inactive), document activation procedure, test quarterly.

**Activation procedure template**:
```markdown
# If [Primary Tool] down
1. Check status/logs
2. Disable/switch away from primary
3. Enable/switch to fallback
4. Notify team
5. Continue work
6. Re-enable primary when available
```

> **Adapt to your stack**: Define specific fallbacks for each critical tool/service.

### Dev Environment Backup

**Configurations to backup**:
1. VS Code settings: Git repo or Settings Sync
2. Extensions list: `extensions.json` in team repo
3. Dotfiles: `.bashrc`, `.zshrc` in Git
4. Prompt library: Git repo
5. Project setup: `README.md` with instructions

**Personal backup** (each dev): Time Machine (macOS), cloud backup (Dropbox), GitHub (push regularly)

**Recovery time**: 2h for complete dev environment reinstall.

### Basic Incident Response

**If issue impacts entire team**:
1. **Identify** (5min): Which tool? What impact? Confirm with team.
2. **Communicate** (10min): Notify team, notify PO if delivery impact.
3. **Activate fallback** (15min): Follow documented procedure, help devs if needed.
4. **Monitor** (ongoing): Check status page, update team when resolved.
5. **Post-incident** (optional): If >2h downtime, document incident, adjust plan if needed.

## Manage Checklist

### Operations
- [ ] Setup onboarding/offboarding checklists
- [ ] Establish support channel (Slack)
- [ ] Configure monthly management reporting
- [ ] Create adoption dashboard (Google Sheets/Notion)
- [ ] Configure GitHub metrics tracking
- [ ] Establish monthly review routine (30min)
- [ ] Document incident response procedure

### Deployments
- [ ] Configure CI/CD pipeline with security scans
- [ ] Establish PR template with AI usage mention
- [ ] Document rollback procedure (<15min)
- [ ] Test rollback quarterly

### Models
- [ ] Document models used (in code or wiki)
- [ ] Version prompt library in Git
- [ ] Track prompt performance (usage stats)

### Costs
- [ ] Define team budget ($40-70/dev/month)
- [ ] Create cost dashboard (Google Sheets)
- [ ] Configure budget overage alerts
- [ ] Establish monthly cost review (30min)
- [ ] Calculate quarterly ROI

### Data
- [ ] Version critical datasets (embeddings, docs)
- [ ] Setup backups (Git + cloud storage)
- [ ] Configure basic data quality checks

### Continuity
- [ ] Identify fallback tools (Copilot → Codeium, etc.)
- [ ] Pre-install fallback tools (disabled)
- [ ] Document fallback activation procedure
- [ ] Test continuity plan quarterly
- [ ] Configure dev environment backup (Settings Sync, dotfiles)

## Success Metrics (After 6 months)

- [ ] Adoption >80% (daily AI usage)
- [ ] Velocity +10-20% (sprint velocity)
- [ ] Quality maintained or improved (stable/lower bug rate)
- [ ] Costs within budget (depends on your stack choice)
- [ ] ROI >3x (time savings vs total cost including infrastructure)
- [ ] Team satisfaction >4/5

**If metrics not met**: Identify root causes, adjust strategy.

> **Note**: Cost targets vary significantly based on SaaS vs self-hosted approach. Focus on ROI rather than absolute cost numbers.

## Conclusion

Team AI operations stay **lightweight and pragmatic**. Focus on:
1. **Monitoring**: Simple dashboard, 30min monthly review
2. **Versioning**: Git for code/prompts, changelog for datasets
3. **Costs**: $40-70/dev/month, ROI >3x
4. **Continuity**: Pre-configured fallback tools, quarterly tests

**Avoid**: Complex infrastructure (Kubernetes, MLflow, Airflow), over-engineering (micro-optimizations, sophisticated dashboards), heavy processes (multiple approvals, committees)

**Principle**: Start simple, iterate based on real needs.

## Next Steps

You've completed the team AI adoption framework. To go further:
1. **Scale progressively**: If team success, replicate on other teams
2. **Share learnings**: Present to other teams, contribute to AI CoE
3. **Explore automation**: If advanced needs (fine-tuning, custom RAG), see [Automation](../automation/)
4. **Regular review**: 6 phases evolve with team maturity
