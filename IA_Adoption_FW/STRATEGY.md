# Global Strategy - AI Adoption Framework

> Strategic overview of the "Person → Project → Product" model

## Overview

This AI adoption framework is structured around a progressive model in **3 categories** that reflect the reality of technology adoption: we start by developing **individual skills**, then apply them to **team processes**, before deploying them in **production to automate business processes**.

## "Person → Project → Product" Model

```
┌──────────────────────────────────────────────────────────────────────────┐
│                    AI ADOPTION JOURNEY                                    │
└──────────────────────────────────────────────────────────────────────────┘

    ┌──────────────────┐
    │     PERSON       │  ← Foundation: Individual skills
    │   (Employee)     │     Usage: Personal productivity
    │   Levels 1-2     │     Risk: Low
    └──────────────────┘     Timeline: Hours → Days
            ↓
    (Individual mastery acquired)
            ↓
    ┌──────────────────┐
    │     PROJECT      │  ← Build on: Individual maturity
    │   (Delivery)     │     Usage: Collective team processes
    │   Levels 2-3     │     Risk: Medium
    └──────────────────┘     Timeline: Weeks → Months
            ↓
    (Team experience validated)
            ↓
    ┌──────────────────┐
    │     PRODUCT      │  ← Build on: Processes + Skills
    │  (Automation)    │     Usage: Business APIs in production
    │   Levels 3-4     │     Risk: High-Critical
    └──────────────────┘     Timeline: Months → Quarters
```

### In Summary

> **Person → Project → Product** = "**I learn** → **We collaborate** → **We industrialize**"

This is a **progressive maturity model** where each level builds on the previous one, instead of trying to do everything at once!

- **Person (I learn)**: I develop my individual skills with AI
- **Project (We collaborate)**: We apply these skills to team processes
- **Product (We industrialize)**: We deploy in production to automate business processes

---

## The 3 Categories: Clear Demarcation

### 1. Person (Employee) - Individual Adoption

**Who**: Individuals (tech or non-tech)

**What**: Improve personal productivity with AI tools

**Examples**:
- Developer using GitHub Copilot
- Employee using ChatGPT or Claude for writing
- Professional using M365 Copilot
- Researcher using Perplexity or NotebookLM

**Demarcation**:
- **Personal** usage, not collective
- **Personal** data, no customer data
- **Low-medium** risk (impact limited to the individual)
- Budget **$20-50/month** per person

**Framework**: [employee/](employee/README.md)

---

### 2. Project (Delivery) - Team Integration

**Who**: Technical teams and leads

**What**: Integrate AI into collective delivery processes

**Examples**:
- AI-automated code review
- Collective documentation generation
- AI-assisted testing and refactoring
- Sprint planning with AI

**Demarcation**:
- **Collective** usage, team workflows
- **Internal team** data (code, docs, architecture)
- **Medium** risk (impact on team velocity)
- Budget **few k$/month** per team

**Prerequisites**: Team members master individual usage (Levels 1-2)

**Framework**: [delivery/](delivery/README.md)

---

### 3. Product (Automation) - Business Production

**Who**: Organizations, architects, SRE

**What**: Deploy AI applications in production to automate business processes

**Examples**:
- Publicly exposed AI API
- Customer chatbot in production
- Critical business automated workflow
- ML prediction or recommendation system

**Demarcation**:
- **Production** usage, 24/7 availability
- Sensitive **customer/business** data
- **High-critical** risk (business impact)
- Budget **tens to hundreds of k$/month**

**Prerequisites**:
- Individual maturity (Employee Levels 1-2)
- Team experience (Delivery Levels 2-3)

**Framework**: [automation/](automation/README.md)

---

## Comparative Table of Categories

| Criteria | Employee | Delivery | Automation |
|---------|----------|----------|------------|
| **Scope** | Individual | Team | Organization |
| **Maturity level** | 1-2 | 2-3 | 3-4 |
| **Risk** | Low-Medium | Medium | High-Critical |
| **Budget** | $20-50/month/person | Few k$/month/team | Tens-hundreds k$/month |
| **Timeline** | Hours → Days | Weeks → Months | Months → Quarters |
| **Governance** | LIGHT (1-2 pages) | MEDIUM (5-10 pages) | FULL (NIST AI RMF, AI CoE) |
| **Security** | Awareness | Pragmatic (OWASP basics) | Complete (Defense-in-depth) |
| **Operations** | Minimal (SaaS subscriptions) | Basic (MLOps basics) | Complete (MLOps/LLMOps) |
| **Data** | Personal only | Internal team (anonymized) | Customer/business (sensitive) |
| **Tech Stack** | SaaS only | SaaS + Light PaaS | SaaS/PaaS/IaaS |
| **Approval** | None (self-service) | Team Lead | Multi-gate (CoE, Legal, Security) |

## Maturity Progression

### Levels 1-4 Mapped to Categories

```
┌─────────────────────────────────────────────────────────────────────┐
│                        MATURITY LEVELS                               │
└─────────────────────────────────────────────────────────────────────┘

 Level 1                     Level 2                     Level 3                     Level 4
 BASIC                       INTERMEDIATE                ADVANCED                    EXPERT

 • SaaS only                 • SaaS + API usage + MCP    • RAG, custom ML            • Large model training
 • Prompt basics             • Prompt engineering        • Fine-tuning               • Complex infrastructure
 • Zero code                 • MCP Usage                 • MLOps basics              • Complete MLOps
 • Discovery                 • Data pipelines basics     • Production-ready          • Enterprise scale

 ├─────────────────────────────┤                         ├───────────────────────────────────────┤
 │     EMPLOYEE FRAMEWORK       │                         │        DELIVERY FRAMEWORK              │
 └─────────────────────────────┘                         └───────────────────────────────────────┘
                                                          ├───────────────────────────────────────────────┤
                                                          │        AUTOMATION FRAMEWORK                    │
                                                          └───────────────────────────────────────────────┘
```

### Detailed Maturity Grid

See [SKILLS.md](SKILLS.md) for the complete definition of 4 levels with measurable criteria per axis.

**Quick summary**:
- **Level 1**: SaaS only → **Employee Framework**
- **Level 2**: SaaS + API + MCP → **Employee → Delivery**
- **Level 3**: PaaS (RAG, custom ML) → **Delivery → Automation**
- **Level 4**: IA Factory & Worflow (A2A) → **Automation Framework**

## Framework Dependencies Diagram

```
┌──────────────────────────────────────────────────────────────────────┐
│                    FRAMEWORK DEPENDENCIES                             │
└──────────────────────────────────────────────────────────────────────┘

                     ┌───────────────────────┐
                     │  Employee Framework   │
                     │  (Foundation)         │
                     │                       │
                     │  Individual           │
                     │  skills               │
                     └───────────────────────┘
                               │
                               │ Prerequisites: Levels 1-2
                               ↓
                     ┌───────────────────────┐
                     │  Delivery Framework   │
                     │  (Build On)           │
                     │                       │
                     │  + Team processes     │
                     │  + Data handling      │
                     └───────────────────────┘
                               │
                               │ Prerequisites: Levels 2-3
                               ↓
                     ┌───────────────────────┐
                     │ Automation Framework  │
                     │ (Build On)            │
                     │                       │
                     │ + Production          │
                     │ + Full governance     │
                     │ + Complete MLOps      │
                     └───────────────────────┘
```

### Why This Layered Structure?

**1. Clear prerequisites**: Each framework assumes the previous one is mastered
- Cannot deploy to production if the team has no AI experience
- Cannot integrate AI in a team if individuals don't know how to use it

**2. Progressive risk management**: Risk increases with scope
- Individual: Low risk (simple management)
- Team: Medium risk (team governance)
- Prod: High-critical risk (full governance)

**3. Progressive investment**: Budget proportional to value
- $50/month to try (individual)
- Few k$/month to validate (team)
- Tens of k$/month to scale (prod)

---

## Major Divergences Between Frameworks

### Why Does 01-strategy.md Diverge Completely?

The `01-strategy.md` files of the 3 frameworks are **fundamentally different** because strategic objectives change radically:

#### Employee: Personal Discovery Strategy
- **Focus**: Find tools to improve MY productivity
- **Approach**: Trial-and-error, no formal analysis
- **Output**: List of SaaS tools to test
- **Decision**: Individual, no approval
- **Metric**: "Does it save me time?"

#### Delivery: Collective Integration Strategy
- **Focus**: Identify team integration patterns
- **Approach**: Guided experimentation (2-week sprints)
- **Output**: 1-2 patterns validated by the team
- **Decision**: Collective (team lead + retros)
- **Metric**: "Does it improve our velocity/quality?"

#### Automation: Business Use Case Strategy
- **Focus**: Identify AI use cases with business ROI
- **Approach**: Formal analysis, business case, metrics
- **Output**: Complete AI strategy (use cases, tech, data, owner)
- **Decision**: Multi-gate (CoE, Legal, Security)
- **Metric**: "What is the ROI? What are the risks?"

### Governance Differences

| Framework | Governance | Approval | Documentation | Audits |
|-----------|-------------|-------------|---------------|--------|
| **Employee** | LIGHT - Acceptable use policy (1-2 pages) | None (self-service) | Minimal | None |
| **Delivery** | MEDIUM - Team policies (5-10 pages) | Team Lead | Standard (wikis, READMEs) | Team retros |
| **Automation** | FULL - NIST AI RMF, AI CoE | Multi-gate (3+ approvals) | Complete (architecture, compliance) | Quarterly |

### Security Differences

| Framework | Posture | Controls | Responsibility |
|-----------|---------|-----------|----------------|
| **Employee** | Awareness - Best practices | Individual (MFA, no secrets) | Individual |
| **Delivery** | Pragmatic - OWASP basics | Collective (DLP basics, anonymization) | Tech Lead |
| **Automation** | Complete - Defense-in-depth (6 layers) | Production (SIEM, pentesting, audits) | CISO + AI CoE |

### Operations Differences

| Framework | MLOps | Deployment | Monitoring | DR/BC |
|-----------|-------|-------------|------------|-------|
| **Employee** | None | N/A (SaaS) | None | N/A |
| **Delivery** | Basics - Git versioning | Simple (staging/prod) | Basics (logs, errors) | Minimal |
| **Automation** | Complete - CI/CD, registry, drift | Multi-env (dev/staging/prod) | Complete (metrics, traces, alerts) | Complete (RPO/RTO) |

---

## No Prioritization, Just Mapping

**Important**: This file does **NOT** say which framework to use as a priority.

It **maps** the 3 categories and helps to:
- Understand the differences between frameworks
- Identify where you currently are
- Understand prerequisites to progress

**Prioritization depends on YOUR context**:
- Individual discovering AI? → Employee
- Team with AI skills? → Delivery
- Mature organization? → Automation

**All frameworks are valid** depending on your situation.

---

## Shared Principles

### The 6 Principles of Responsible AI

All frameworks share the same fundamental principles:

1. **Fairness**: Treat all users fairly
2. **Reliability and safety**: Safe and reliable operation
3. **Privacy and security**: Respect for privacy
4. **Inclusiveness**: Accessible to all
5. **Transparency**: Understandable and explainable
6. **Accountability**: Clear responsibility

See [README.md](README.md) for complete details.

### Cloud Agnosticism

All frameworks are designed to be applicable with any cloud provider.

