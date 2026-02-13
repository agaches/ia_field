# Cloud-Agnostic AI Adoption Framework

> Lightweight AI adoption framework, cloud vendor agnostic, based on Cloud Adoption Framework best practices.

## 3 AI Adoption Categories

| Category | For Whom? | Risk | Maturity | Framework |
|----------|-----------|------|----------|-----------|
| **Employee** | Individuals | Low-Medium | Levels 1-2 | [employee/](employee/) |
| **Delivery** | Teams | Medium | Levels 2-3 | [delivery/](delivery/) |
| **Automation** | Organizations | High-Critical | Levels 3-4 | [automation/](automation/) |

**Progression**: Employee → Delivery → Automation (don't skip steps)

See [00-strategy-global.md](00-strategy-global.md) for complete model and detailed descriptions.

## Quick Guide: Which Framework?

- **Personal productivity** (Copilot, ChatGPT) → [Employee](employee/)
- **Team processes** (code review, testing) → [Delivery](delivery/)
- **Production apps** (chatbot, API) → [Automation](automation/)
- **Never used AI?** → Start with [Employee](employee/)

More Q&A in [00-strategy-global.md](00-strategy-global.md)

## Skills and Training

- **Assess your level**: [SKILLS.md](SKILLS.md) - 4 maturity levels, self-assessment matrix
- **Training paths**: [TRAINING.md](TRAINING.md) - Progression by level (1→2, 2→3, 3→4)

## 6-Phase Structure

All frameworks follow the same structure, adapted to their scope:

```
STRATEGY → PLAN → READY → GOVERN ⟷ SECURE ⟷ MANAGE
```

Each framework directory contains:
- `01-strategy.md` - Define vision and use cases
- `02-plan.md` - Plan adoption and skills
- `03-ready.md` - Prepare environment
- `04-govern.md` - Governance policies
- `05-secure.md` - Security practices
- `06-manage.md` - Operations and lifecycle

## Getting Started

1. Read [00-strategy-global.md](00-strategy-global.md) for the complete model
2. Assess your level with [SKILLS.md](SKILLS.md)
3. Choose your framework based on maturity and scope
4. Follow the 6 phases in order

## Additional Resources

- **Glossary**: [GLOSSARY.md](GLOSSARY.md) - Cloud service equivalences (AWS/GCP/Azure)
- **References**: NIST AI RMF, MITRE ATLAS, OWASP Generative AI (see framework docs)

---

Inspired by Microsoft Cloud Adoption Framework, adapted to be cloud-agnostic and practical.
