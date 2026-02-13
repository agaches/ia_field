# Phase 3: Ready - Setup AI Delivery Environment

## Establish AI governance

### Access controls

**Define access policies**:
- Who can use AI tools in each environment
- What tools are available per role (developer, QA, ops)
- Approval requirements for production AI usage
- Audit logging for AI tool usage

**Example access matrix**:

| Role | Development | Staging | Production |
|------|-------------|---------|------------|
| Developer | Full AI access | AI assistive tools | Read-only AI insights |
| QA | AI test tools | Full AI test suite | AI monitoring only |
| Ops | AI troubleshooting | AI incident tools | Full AI ops tools |

### Approval workflows

**Define workflows for**:
- **AI-generated code** - Review process, approval gates, validation
- **AI-assisted decisions** - Human-in-the-loop requirements, escalation
- **AI tool usage** - When to use, when not to use, fallback procedures
- **Output validation** - Quality checks, security scans, compliance verification

**Example workflow** (AI code generation):
1. Developer requests AI code generation
2. AI generates code
3. Automated tests run
4. Code review (human + AI)
5. Approval gate
6. Merge to main branch

## Establish AI networking

### Integration strategy

**Core integrations**:
- **Version control** - AI tools access to repositories (with permissions)
- **CI/CD pipelines** - AI-assisted build, test, deploy automation
- **Communication** - Slack/Teams integrations for AI assistance
- **Documentation** - Wiki/knowledge base for AI context
- **Monitoring** - Observability platforms for AI insights

**Integration patterns**:
- API-based (REST, GraphQL)
- CLI tools
- IDE extensions
- Webhook triggers
- Platform plugins

### Network configuration

**For AI workload deployment** (if building AI applications):
- **Networking** - API gateways, load balancers
- **Segmentation** - Isolate AI workloads per environment
- **Connectivity** - Secure access to data sources and external APIs

> Adapt to your infrastructure: cloud, on-premise, hybrid

## Establish AI reliability

### Environment strategy

**Three environments minimum**:

| Environment | Purpose | AI Tool Configuration |
|-------------|---------|----------------------|
| **Development** | Experimentation, learning | Full AI access, relaxed policies |
| **Staging** | Validation, testing | Production-like AI setup, validation enabled |
| **Production** | Live systems | Controlled AI access, full validation, monitoring |

**Environment isolation**:
- Separate credentials per environment
- Different permission levels
- Cost controls per environment
- Data segregation (no production data in dev)

### Validation and rollout

**Validation checklist**:
- [ ] Tools accessible and functional
- [ ] Integrations working correctly
- [ ] Permissions properly configured
- [ ] Workflows documented and tested
- [ ] Team trained on tools
- [ ] Monitoring and logging operational
- [ ] Incident response procedures defined

**Rollout strategy**:
1. **Pilot team** (1-2 weeks) - Small group tests full setup
2. **Feedback iteration** - Fix issues, update documentation
3. **Staged rollout** - Expand to more teams gradually
4. **Full deployment** - All teams using AI-integrated delivery
5. **Continuous improvement** - Regular feedback, tool optimization

**Success metrics**:
- Tool adoption rate (% of team using AI tools)
- Time saved per phase (measured via surveys or time tracking)
- Quality improvements (fewer bugs, faster reviews, etc.)
- Team satisfaction (feedback surveys)

## Establish an AI foundation

### Build an AI environment

**Tool configuration by phase**:

For each delivery phase where you identified AI use cases:

1. **Acquire access** - Licenses, accounts, API keys
2. **Configure integration** - Connect to existing systems
3. **Set permissions** - Define who can use which tools
4. **Test functionality** - Validate tool works in your environment

| Phase | Tool Setup | Integration Points |
|-------|------------|-------------------|
| **Plan & Design** | LLM assistants, architecture tools | Requirements management, design tools, wiki |
| **Develop** | Code assistants (Copilot, Cursor, Claude Code) | IDE, Git, code review tools |
| **Test** | AI testing tools, test generators | CI/CD, test frameworks, coverage tools |
| **Release & Deploy** | Release automation, IaC assistants | CI/CD, deployment platforms, IaC tools |
| **Operate** | Operations AI, incident tools | Incident management, runbook systems |
| **Monitor** | AIOps, anomaly detection | Monitoring platforms, alerting systems |

> Start with 1-2 pilot phases, validate, then expand

**Infrastructure** (if deploying AI models):
- **Compute** - GPU resources, scalable compute for inference
- **Storage** - Object storage for models, data lakes for training data
- **Model Registry** - Version and track models (MLflow or platform registry)
- **Feature Store** - Centralize reusable features (optional for simple use cases)
- **CI/CD for ML** - Automated training, testing, deployment pipelines
- **Monitoring** - Model performance, drift detection

**Infrastructure as Code**:
- Define infrastructure in code (Terraform, Pulumi, etc.)
- Version control infrastructure changes
- Automated provisioning and teardown

> See [GLOSSARY.md](../GLOSSARY.md) for tool options

### Documentation and training

**Documentation requirements**:
- **Tool access** - How to get access, credentials, permissions
- **Usage guidelines** - When to use AI, best practices, dos and don'ts
- **Workflows** - Step-by-step processes for AI-integrated tasks
- **Validation** - How to validate AI outputs, quality gates
- **Troubleshooting** - Common issues, escalation paths
- **Examples** - Real usage examples, templates

**Training approach**:
- Hands-on workshops per phase
- Pair programming with AI tools
- Internal champions/experts per phase
- Regular knowledge sharing sessions

## Next Step

→ [Phase 4: Govern](04-govern.md) - Implement AI governance
