# Phase 3: Ready - Prepare AI Environment

## Overview

Build AI landing zone: governance, network, reliability, foundation.

## 1. AI Governance

**Resource Organization**:
- Logical segmentation (internet-facing vs internal workloads)
- Dedicated subscriptions per workload (cost isolation, blast radius)
- AI-specific policies (approved models, content filters, cost controls)

**Cloud Equivalents**: See [GLOSSARY.md](../GLOSSARY.md)

## 2. AI Network

**DDoS Protection** (internet-facing workloads): AWS Shield, GCP Cloud Armor, Azure DDoS Protection

**Secure Access**: Bastion/jumpbox for admin access

**Equivalents**: See [GLOSSARY.md](../GLOSSARY.md)

## 3. AI Reliability

**High Availability Architecture**:
- Multi-region (critical production)
- Load balancing
- Auto-scaling

**Disaster Recovery**:
- Model and data backups (defined RTO/RPO)
- Cross-region replication
- Regular DR testing

## 4. AI Foundation

**Infrastructure as Code**: Terraform, Pulumi, CloudFormation

**Model Registry**: MLflow, SageMaker Model Registry, Vertex AI Model Registry

**Feature Store**: Centralize reusable features

**MLOps Baseline**:
- CI/CD pipelines (training + deployment)
- Model monitoring
- Versioning (code, data, models)

## Architecture Patterns Reference

For detailed production patterns with diagrams, tech stacks, and code examples, see:
→ **[Architecture Patterns](ARCHITECTURE_PATTERNS.md)** - RAG, Fine-tuning, Multi-Agent, Chatbot, Batch Processing

## Ready Checklist

- [ ] AI landing zone (governance, segmentation)
- [ ] DDoS protection + secure access
- [ ] HA + DR configured
- [ ] IaC + Model Registry + Feature Store
- [ ] MLOps baseline (CI/CD, monitoring, versioning)

## Next Step

→ [Phase 4: Govern](04-govern.md) - Complete AI governance
