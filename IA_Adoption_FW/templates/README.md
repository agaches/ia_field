# Templates & Tools

This directory contains reusable templates and tracking tools referenced by the framework phases.

## Directory Structure

```
templates/
├── shared/          # Templates used across all frameworks (Employee, Delivery, Automation)
├── employee/        # Employee-specific templates (3)
├── delivery/        # Delivery-specific templates (5)
└── automation/      # Automation-specific templates (18)
```

---

## Shared Templates

Templates applicable to all maturity levels:

### 📋 [Data Classification Guide](shared/data-classification-guide.md)

**Purpose**: Reference for what data is safe/unsafe to share with AI tools
**Used by**: All frameworks (Employee, Delivery, Automation)
**Content**:
- 🟢 Safe: Public docs, open-source code
- 🟡 Caution: Internal docs (anonymized)
- 🔴 Forbidden: Credentials, PII, proprietary code
- Cloud-specific rules (AWS/GCP/Azure)
- Examples by role (developer, analyst, manager)

### 📋 [Incident Response Process](shared/incident-response-process.md)

**Purpose**: Step-by-step guide when sensitive data is accidentally shared
**Used by**: All frameworks
**Content**:
- Immediate actions (STOP, ROTATE, REPORT)
- Notification templates
- Incident severity matrix
- Follow-up checklist
- Post-mortem template

### 📋 [OWASP LLM Top 10](shared/owasp-llm-top10.md)

**Purpose**: Security risks specific to LLM applications
**Used by**: All frameworks (depth varies by maturity)
**Content**:
- LLM01-LLM10 with descriptions
- Mitigation strategies by maturity level
- Real-world examples
- Testing approaches

---

## Employee Templates

Templates specific to personal AI adoption (Levels 1-2):

### 📋 [Use Case Identification Matrix](employee/use-case-identification-matrix.md)

**Purpose**: Identify high-value personal productivity use cases
**Format**: Interactive matrix/worksheet
**Content**:
- Task categories (Writing, Code, Analysis, Creative)
- Time savings estimator
- AI suitability score
- Priority ranking tool
- Examples by role

**Example**:
| Task | Frequency | Time/Task | AI Suitability | Est. Savings | Priority |
|------|-----------|-----------|----------------|--------------|----------|
| Write weekly report | Weekly | 2h | High | 1h/week | ⭐⭐⭐ |

### 📋 [Tool Selection Matrix](employee/tool-selection-matrix.md)

**Purpose**: Compare AI tools based on use cases and budget
**Format**: Decision matrix
**Content**:
- Tool comparison table (features, pricing, use cases)
- Selection criteria checklist
- Cost/benefit calculator
- Trial plan recommendations

**Columns**: Tool | Category | Cost | Free Tier | Best For | Limitations | Rating

### 📋 [Cost & ROI Tracking](employee/cost-roi-tracking.md)

**Purpose**: Track monthly AI tool costs and measure ROI
**Format**: Spreadsheet/table template
**Content**:
- Monthly cost tracker
- Time savings log
- ROI calculator (hours saved × hourly rate / subscription cost)
- Decision matrix (keep/optimize/cancel)
- Trend charts (3-6 months)

**Formula**: ROI = (Hours Saved/Month × Hourly Value) / Monthly Cost

---

## Delivery Templates

Templates for team AI integration (Levels 2-3):

### 📋 [Team Adoption Metrics](delivery/team-adoption-metrics.md)
**Purpose**: Track team AI adoption rates and maturity progression
**Used by**: Delivery Phase 1 (Prepare)

### 📋 [AI Integration Readiness](delivery/ai-integration-readiness.md)
**Purpose**: Assess team readiness for AI integration across processes
**Used by**: Delivery Phase 1 (Prepare)

### 📋 [Collective Experimentation Canvas](delivery/collective-experimentation-canvas.md)
**Purpose**: Plan and track team AI experiments with structured approach
**Used by**: Delivery Phase 1 (Prepare)

### 📋 [Team Policy Template](delivery/team-policy-template.md)
**Purpose**: Define team AI usage policies, data rules, and governance
**Used by**: Delivery Phase 2 (Build)

### 📋 [Velocity Tracking Matrix](delivery/velocity-tracking-matrix.md)
**Purpose**: Track team velocity improvements from AI integration
**Used by**: Delivery Phase 3 (Run)

---

## Automation Templates

Templates for production AI systems (Levels 3-4):

### Phase 1 - Prepare (5 templates)

- 📋 [Production AI Use Case Matrix](automation/production-ai-use-case-matrix.md) - Evaluate and prioritize production use cases
- 📋 [Technology Stack Decision Matrix](automation/technology-stack-decision-matrix.md) - Select AI consumption model (SaaS/PaaS/IaaS)
- 📋 [Architecture Decision Record](automation/architecture-decision-record.md) - Document architecture decisions
- 📋 [Organization Readiness Assessment](automation/organization-readiness-assessment.md) - Validate team and organizational readiness
- 📋 [Compliance Requirements Checklist](automation/compliance-requirements-checklist.md) - Identify regulatory requirements

### Phase 2 - Build (7 templates)

- 📋 [AI Landing Zone Checklist](automation/ai-landing-zone-checklist.md) - Deploy production infrastructure
- 📋 [NIST AI RMF Implementation](automation/nist-ai-rmf-implementation.md) - Implement AI risk management framework
- 📋 [AI Governance Policy](automation/ai-governance-policy.md) - Establish governance policies
- 📋 [EU AI Act Compliance](automation/eu-ai-act-compliance.md) - EU AI Act compliance checklist
- 📋 [MLOps Maturity Assessment](automation/mlops-maturity-assessment.md) - Assess MLOps pipeline maturity
- 📋 [Production Alerting Runbook](automation/production-alerting-runbook.md) - Configure alerting rules and responses
- 📋 [Disaster Recovery Plan](automation/disaster-recovery-plan.md) - DR/BC planning and testing

### Phase 3 - Run (6 templates)

- 📋 [Production Health Dashboard](automation/production-health-dashboard.md) - Monitor system health and SLAs
- 📋 [Model Performance Dashboard](automation/model-performance-dashboard.md) - Track model quality and drift
- 📋 [Model Retraining Playbook](automation/model-retraining-playbook.md) - Model lifecycle and retraining
- 📋 [AI Incident Runbooks](automation/ai-incident-runbooks.md) - Incident response procedures
- 📋 [Production Cost Dashboard](automation/production-cost-dashboard.md) - Cost monitoring and optimization
- 📋 [Quarterly System Review](automation/quarterly-system-review.md) - Quarterly assessment and planning

---

## Template Creation Guidelines

When creating a new template:

1. **Actionable**: Must lead to concrete decisions or actions
2. **Concise**: 1-2 pages maximum
3. **Practical**: Include examples and real-world scenarios
4. **Self-contained**: Can be used standalone without reading framework docs
5. **Adaptable**: Include blank/fillable versions

**Format standards**:
- Markdown (.md) for text-based templates
- Checklists use `- [ ]` format
- Tables use GitHub-flavored markdown
- Include "How to Use" section at the top
- Provide both example (filled) and blank versions

---

## Usage in Framework Docs

**Reference format**:
```markdown
📋 **Tool**: [Template Name](../templates/path/template.md)```

**Linking**:
- From employee/: `../templates/employee/template.md`
- From delivery/: `../templates/delivery/template.md`
- Shared templates: `../templates/shared/template.md`

---

## Template Summary

| Category | Count | Status |
|----------|-------|--------|
| **Shared** | 3 | ✅ Complete |
| **Employee** | 3 | ✅ Complete |
| **Delivery** | 5 | ✅ Complete |
| **Automation** | 18 | ✅ Complete |
| **Total** | **29** | **✅ All created** |
