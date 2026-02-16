# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an **AI Adoption Framework** following the "Person → Project → Product" model:
- **Employee** (personal productivity) → **Delivery** (team processes) → **Automation** (production systems)
- Based on Cloud Adoption Framework principles, cloud-agnostic, pragmatic

**Status**: Framework refactoring 100% complete. Templates 100% complete (29/29 created).
**Last updated**: 2026-02-16
**Next session**: Improve TRAINING.md (only remaining task). Coherence review applied 2026-02-16.

## Framework Architecture

### Core Model

```
Person (Employee)  → Levels 1-2 → Personal AI usage    → Low risk     → $20-50/month
Project (Delivery) → Levels 2-3 → Team AI integration  → Medium risk  → Few k$/month
Product (Automation) → Levels 3-4 → Production AI      → High risk    → Tens of k$/month
```

**Progressive prerequisites**: Cannot skip levels. Each builds on previous maturity.

### Target Structure (3-Phase)

Each framework should have 3 phases:
1. **Prepare**: Define objectives, select tools, assess readiness (Strategy + Plan)
2. **Build**: Setup environment, configure security, establish policies (Ready + Govern + Secure)
3. **Run**: Daily operations, monitoring, lifecycle management (Manage)

**Reference implementation**: `work/employee/` contains the target 3-phase structure for Employee framework.

### Refactoring Progress (2026-02-16)

**✅ Frameworks Refactored (3/3 - 100%)**:

- **Employee**: 3-phase structure (README + 3 phases = 27.3KB) + 3 templates ✅
  - Templates: use-case-identification-matrix, tool-selection-matrix, cost-roi-tracking
  - Archive: `archive/employee-6phase/` (old 6-phase files preserved)

- **Delivery**: 3-phase structure (README + 3 phases = 26.4KB) + 5 templates ✅
  - Templates: team-adoption-metrics, ai-integration-readiness, collective-experimentation-canvas, team-policy-template, velocity-tracking-matrix
  - Archive: `archive/delivery-6phase/` (old 6-phase files preserved)

- **Automation**: 3-phase structure (README + 3 phases = 49.6KB) + 18 templates created ✅
  - Templates: 18 created in `templates/automation/`
  - Archive: `archive/automation-6phase/` (old 6-phase files preserved)

**✅ Documentation Updated**:
- README.md: Completely rewritten for 3-phase structure (5.1KB)
- CLAUDE.md: Updated with patterns and current state
- templates/README.md: Template index created

**Total framework content**: 103.3KB (vs ~60KB before, +72% actionable content)

---

### Outstanding Work (To Resume Next Session)

**✅ COMPLETED: Create Automation Templates (18 templates)**

All 18 Automation templates created (total size: ~271KB). Templates cover:
- Phase 1 (Prepare): 5 templates for use case evaluation, tech stack decisions, ADRs, readiness, compliance
- Phase 2 (Build): 7 templates for landing zone, NIST AI RMF, governance, EU AI Act, MLOps, alerting, DR
- Phase 3 (Run): 6 templates for health dashboards, model performance, retraining, incidents, cost, quarterly reviews

---

**✅ COMPLETED: Coherence Review (2026-02-16)**

Full framework coherence analysis performed and corrections applied:
- Removed 39 obsolete `*(à créer)*` markers across all phase files
- Harmonized latency SLA to <2s p95 (was inconsistent: <100ms, <500ms, <2s)
- Resolved ROI contradiction in Automation (20% Go/No-Go vs 100% operational)
- Fixed Employee risk level (Low-medium → Low) in STRATEGY.md
- Fixed Delivery operations description (MLOps → CI/CD for AI tools) in STRATEGY.md
- Updated templates/README.md to reflect all 29 templates created
- Updated STATUS.md to reflect current state
- Unified STRATEGY.md language (removed French fragments)
- Deduplicated sector regulations (automation Phase 2 now references Phase 1)
- Clarified tool selection (1 primary + 1 backup) in Employee
- Added Employee → Delivery transition guidance
- Updated CLAUDE.md obsolete sections

---

**🟡 REMAINING: Improve TRAINING.md**

Status: Already has framework-specific paths and validation projects, but could be enhanced with more practical exercises.

**Estimated effort**: 1 hour

---

**Optional: Create Missing Templates Documentation**

Consider adding a `templates/automation/README.md` with template priorities and creation guidelines, similar to `templates/README.md` but Automation-specific.

## Key Documents

### Core Framework Files (Strong - Keep)

- **README.md**: Entry point, framework comparison table, responsible AI principles
- **STRATEGY.md**: Person→Project→Product model explanation, risk/budget/timeline comparison
- **SKILLS.md**: ⭐ Maturity assessment grid (7 domains, 4 levels), self-assessment guide, validation criteria

### Support Files (Weak - Improve or Remove)

- **TRAINING.md**: Generic course catalog. Needs: framework-specific learning paths, practical exercises, validation projects
- **GLOSSARY.md**: Cloud service equivalences (AWS/GCP/Azure) + AI acronyms. Useful reference but not framework-specific

### Framework Folders

- `employee/`: ✅ 3-phase structure (README, 01-prepare, 02-build, 03-run)
- `delivery/`: ✅ 3-phase structure (README, 01-prepare, 02-build, 03-run)
- `automation/`: ✅ 3-phase structure (README, 01-prepare, 02-build, 03-run)
- `archive/employee-6phase/`: Old files preserved
- `archive/delivery-6phase/`: Old files preserved
- `archive/automation-6phase/`: Old files preserved

### Templates Structure

- `templates/README.md`: Master index of all templates
- `templates/employee/`: 3 templates (use-case, tool-selection, cost-roi)
- `templates/delivery/`: 5 templates (team-adoption, integration-readiness, experimentation-canvas, team-policy, velocity-tracking)
- `templates/shared/`: 3 templates (data-classification, incident-response, owasp-llm-top10)
- `templates/automation/`: ✅ 18 templates (use-case, tech-stack, ADR, readiness, compliance, landing-zone, NIST, governance, EU AI Act, MLOps, alerting, DR, health, performance, retraining, incidents, cost, quarterly)

## Refactoring Guidelines

### Tone & Style

**Target**: Concise, clear, action-oriented
- Use checklists, matrices, decision trees
- Short paragraphs, bullet points
- "Do X" not "You should consider doing X"
- Remove fluff, keep essential guidance only

**Examples**:
- ✅ "Enable MFA. Opt-out of model training."
- ❌ "It is recommended that you consider enabling multi-factor authentication for enhanced security."

### Content Principles

**Keep**:
- Actionable checklists
- Risk-based decision criteria
- Clear prerequisites and validation steps
- Maturity-level specific guidance
- Progressive disclosure (basics first, advanced later)

**Remove**:
- Generic best practices ("test your code", "document your work")
- Obvious advice that doesn't need stating
- Philosophical discussions without actionable outcomes
- Repetition across documents

**Add**:
- Evaluation grids (e.g., "Tool ROI Matrix", "Risk Assessment Grid")
- Progress tracking matrices
- Decision flowcharts ("Which framework?" → decision tree)
- Quick-start checklists ("Day 1", "Week 1", "Month 1")

### 3-Phase Consolidation

When refactoring from 6 phases to 3:

**Prepare** (Strategy + Plan):
- Use cases and objectives
- Tool selection matrix
- Skills assessment
- Success metrics definition

**Build** (Ready + Govern + Secure):
- Environment setup
- Security configuration (MFA, privacy, secrets)
- Policies and guidelines
- Backup and reliability

**Run** (Manage):
- Daily operations checklist
- Monitoring and cost tracking
- Incident response
- Continuous improvement
- Lifecycle management

### Tracking Tools Pattern (Established)

Phase documents should reference external templates with `📋 **Tool**: [Template Name](../templates/.../template.md)`.

**Template file structure** (consistent across all templates):
1. **Header block**: Purpose, used in which phase, update frequency
2. **Concept explanation**: Brief context (2-3 paragraphs max)
3. **Filled example**: Realistic scenario with actual data
4. **Blank template**: Copy-paste ready markdown
5. **Related links**: Cross-references to other templates

**Example patterns established**:
- **Matrices**: Decision support (Tool Selection, AI Integration Readiness, Velocity Tracking)
- **Tracking sheets**: Progress monitoring (Cost ROI, Team Adoption Metrics)
- **Canvas**: Planning tool (Experimentation Canvas)
- **Policies**: Guidelines (Team Policy Template, Data Classification)
- **Reference**: Knowledge base (OWASP LLM Top 10, Incident Response)

## Framework-Specific Notes

### Employee Framework

**Target audience**: Individuals (tech and non-tech), Levels 1-2
**Focus**: Personal productivity with SaaS AI tools
**Risk**: Low (personal data only)
**Budget**: $20-50/month

**Key deliverables**:
- Tool selection guide (2-3 tools max)
- Data classification red lines (🟢🟡🔴)
- "Golden prompts" library template
- Monthly ROI tracking sheet

**work/employee/** already demonstrates the right approach - use as template.

### Delivery Framework

**Target audience**: Development teams, Levels 2-3
**Prerequisites**: 50%+ team at Level 2, has AI champion
**Focus**: Team processes (code review, testing, documentation)
**Risk**: Medium (team velocity, internal data)
**Budget**: Few k$/month

**Key deliverables**:
- Team integration patterns catalog
- Collective experimentation plan
- Team policies and guidelines
- Quality and velocity metrics

### Automation Framework

**Target audience**: Organizations, architects, SREs, Levels 3-4
**Prerequisites**: Team maturity (Delivery L2-3), Technical skills (RAG, MLOps), Executive sponsor
**Focus**: Production systems, business-critical AI
**Risk**: High-Critical (SLA, customer data, business impact)
**Budget**: Tens-hundreds k$/month

**Key deliverables**:
- Architecture decision records (ADRs)
- NIST AI RMF governance framework
- MLOps/LLMOps pipelines
- SLA and incident response plans

## Common Development Tasks

**Preview documentation locally**:
```bash
# Any markdown viewer or:
grip README.md  # GitHub-flavored markdown preview
```

**Check document structure**:
```bash
# List all markdown files
find . -name "*.md" -type f | sort

# Count phases per framework
ls -1 employee/*.md delivery/*.md automation/*.md | wc -l
```

**Validate checklist format**:
```bash
# Find all checklists
grep -r "^\- \[ \]" --include="*.md"
```

## Refactoring Strategy (COMPLETED 2026-02-16)

**✅ Phase 1: Employee** (Completed)
- [x] Refactored to 3-phase structure (README + 3 phases)
- [x] Created 3 templates (use-case, tool-selection, cost-roi)
- [x] Moved old files to archive/employee-6phase/
- [x] Validated: concise, actionable, tracking tools integrated

**✅ Phase 2: Delivery** (Completed)
- [x] Adapted Prepare-Build-Run for team context
- [x] Created 5 templates (adoption, readiness, canvas, policy, velocity)
- [x] Moved old files to archive/delivery-6phase/
- [x] Validated: team-specific tracking, realistic examples

**✅ Phase 3: Automation** (Completed)
- [x] Refactored to 3-phase structure (README + 3 phases)
- [x] Identified 18 templates (documented in phase files, creation pending)
- [x] Moved old files to archive/automation-6phase/
- [x] Integrated NIST AI RMF checkpoints
- [x] Validated: production-grade, comprehensive controls

**✅ Phase 4: Support Docs** (Completed)
- [x] README.md: Updated for 3-phase structure (completely rewritten)
- [x] CLAUDE.md: Updated with patterns and outstanding work
- [x] templates/README.md: Created template index
- [x] STATUS.md: Created project status tracker
- [ ] TRAINING.md: Framework-specific learning paths (PENDING)

**Next Session Work**:
- Improve TRAINING.md with more practical exercises (1h)

## Quality Criteria

Before considering a phase "done":
- [ ] ≤3 pages (target: 2 pages)
- [ ] ≥1 checklist or matrix per section
- [ ] All action items clear ("Do X" not "Consider X")
- [ ] No generic advice (remove or make specific)
- [ ] Examples concrete and realistic
- [ ] Links to other phases/docs functional
- [ ] Consistent formatting and structure
- [ ] User can complete in stated time (Prepare: 2h, Build: 4h, Run: ongoing)

## Important Principles

1. **Progressive complexity**: Employee (simple) → Delivery (moderate) → Automation (comprehensive)
2. **Risk-based**: Higher risk = more detailed controls, never skip prerequisite levels
3. **Practical**: Every section must have actionable guidance, no theory without practice
4. **Cloud-agnostic**: Reference GLOSSARY.md for AWS/GCP/Azure equivalences
5. **Maturity-aware**: Content must match target maturity level (don't explain RAG to Level 1)

## Files to Never Modify Without Consultation

- Core model in STRATEGY.md (Person→Project→Product)
- Maturity levels in SKILLS.md (1-4 definitions)
- Responsible AI principles in README.md
- Progressive prerequisites (cannot skip levels)

## Questions or Clarifications

When refactoring:
- Err on the side of **deletion** (remove unnecessary content)
- Prefer **showing** (examples, checklists) over **telling** (explanations)
- When in doubt about consolidation, ask user
- Maintain consistency across all 3 frameworks (same structure, similar formatting)
