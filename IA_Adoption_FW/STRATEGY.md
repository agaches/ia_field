# Global Strategy - AI Adoption Framework

> Strategic overview of the "Person → Project → Product" model

## Overview

This AI adoption framework is structured around a progressive model in **3 categories** that reflects the reality of technology adoption: start by developing **individual skills**, then apply them to **team processes**, before deploying them in **production to automate business processes**.

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

This is a **progressive maturity model** where each level builds on the previous one, instead of trying to do everything at once.

- **Person (I learn)**: Develop individual skills with AI
- **Project (We collaborate)**: Apply these skills to team processes
- **Product (We industrialize)**: Deploy in production to automate business processes

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
- **Low** risk (impact limited to the individual)
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
| **Risk** | Low | Medium | High-Critical |
| **Budget** | $20-50/month/person | Few k$/month/team | Tens-hundreds k$/month |
| **Timeline** | Hours → Days | Weeks → Months | Months → Quarters |
| **Governance** | LIGHT | MEDIUM | FULL (NIST AI RMF, AI CoE) |
| **Security** | Awareness | Pragmatic (OWASP basics) | Complete (Defense-in-depth) |
| **Operations** | Minimal (SaaS subscriptions) | Basic (CI/CD for AI tools) | Complete (MLOps/LLMOps) |
| **Data** | Personal only | Internal team (anonymized) | Customer/business (sensitive) |
| **Tech Stack** | SaaS only | SaaS + Light PaaS | SaaS/PaaS/IaaS |
| **Approval** | None (self-service) | Team Lead | Multi-gate (CoE, Legal, Security) |



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

All frameworks are designed to be applicable with any AI solution provider.

