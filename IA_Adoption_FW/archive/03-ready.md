# Phase 3 : Ready - Préparer l'environnement IA

## Vue d'ensemble

Cette phase décrit le processus organisationnel pour construire des workloads IA. Elle fournit des recommandations pour les décisions clés de design et de processus pour adopter l'IA à l'échelle, en se concentrant sur l'organisation des ressources et la connectivité.

## 1. Établir la gouvernance IA

### Organisation des ressources

La gouvernance IA nécessite une organisation appropriée des ressources et une gestion des politiques pour assurer des opérations sécurisées, conformes et cost-effective.

#### 1. Créer des groupements logiques séparés

**Segmentation recommandée** :
```
Organisation
├── Management Group: AI Workloads
│   ├── Internet-Facing AI (Online)
│   │   ├── Subscription: E-commerce AI
│   │   └── Subscription: Public API AI
│   └── Internal AI (Corporate)
│       ├── Subscription: Analytics AI
│       └── Subscription: Operations AI
```

**Principes de séparation** :
- **Workloads internet-facing** : Accès public, données non-sensibles
- **Workloads internes** : Données sensibles, accès restreint
- Empêche l'exposition accidentelle de données internes

Voir [GLOSSARY.md](GLOSSARY.md) pour les équivalences cloud (Organizations, VPC, IAM, etc.).

#### 2. Appliquer des politiques spécifiques IA

**Politiques baseline** :
- Contrôles d'accès (IAM)
- Chiffrement des données
- Logging et audit
- Tagging des ressources

**Politiques spécifiques IA** :
- Modèles autorisés/interdits
- Filtres de contenu requis
- Restrictions sur le fine-tuning
- Contrôles de coûts (budgets, quotas)

**Implémentation** : Utiliser les services de politiques cloud (voir [GLOSSARY.md](GLOSSARY.md) pour équivalences).

#### 3. Déployer les ressources IA dans des subscriptions dédiées

**Anti-pattern à éviter** : Centraliser toutes les ressources IA dans une seule subscription partagée

**Pattern recommandé** : Subscriptions par workload
```
Business Unit: Marketing
└── AI Workload: Customer Insights
    └── Subscription: marketing-ai-prod
        ├── ML Models
        ├── Data Storage
        └── Compute Resources
```

**Avantages** :
- Autonomie des équipes
- Isolation des coûts
- Blast radius limité
- Gouvernance héritée

## 2. Établir le réseau IA

### Sécurité réseau et performance

#### 1. Activer la protection DDoS (workloads internet-facing)

**Services par cloud** :
- **AWS** : AWS Shield (Standard/Advanced)
- **GCP** : Cloud Armor
- **Azure** : Azure DDoS Protection

**Implémentation** :
- Activer au niveau réseau/VPC
- Configurer les alertes
- Définir les thresholds de trafic

#### 2. Sécuriser l'accès opérationnel

**Principe de bastion/jumpbox** :
```
Internet
    ↓
[Bastion Host] ← Admin access
    ↓
[Private Network]
    ↓
[AI Resources]
```

Voir [GLOSSARY.md](GLOSSARY.md) pour services de bastion par cloud.

#### 3. Choisir la connectivité on-premises appropriée

**Option 1 : Connexion dédiée haute performance**
| Cloud | Service | Cas d'usage |
|-------|---------|-------------|
| AWS | Direct Connect | Gros volumes de données, latence faible |
| GCP | Cloud Interconnect | Training distribué, datasets massifs |
| Azure | ExpressRoute | Transferts réguliers et volumiques |

**Caractéristiques** :
- Bande passante : 1-100 Gbps
- Latence prévisible
- Coûts : $$$ (setup + mensuel)

**Option 2 : VPN pour volumes modérés**
| Cloud | Service | Cas d'usage |
|-------|---------|-------------|
| AWS | Site-to-Site VPN | Transferts occasionnels |
| GCP | Cloud VPN | Données modérées |
| Azure | VPN Gateway | PoCs et projets pilotes |

**Caractéristiques** :
- Bande passante : limitée par internet
- Latence variable
- Coûts : $ (setup minimal)

## 3. Établir la fiabilité IA

### Haute disponibilité et récupération

#### 1. Déployer sur plusieurs régions (production)

**Architecture multi-région** :
```
Region 1 (Primary)           Region 2 (Secondary)
├── AI Models                ├── AI Models (replica)
├── Data Storage             ├── Data Storage (replica)
└── Compute Resources        └── Compute Resources

         ↑                            ↑
         └────── Load Balancer ───────┘
```

**Services de load balancing** :
- **AWS** : Route 53 + Global Accelerator
- **GCP** : Cloud Load Balancing
- **Azure** : Traffic Manager / Front Door

**Stratégies de déploiement** :
- **Active-Active** : Trafic sur les deux régions
- **Active-Passive** : Failover automatique
- **Multi-active** : Routing géographique intelligent

#### 2. Vérifier la disponibilité des services

**Avant de déployer** :
- Vérifier la disponibilité régionale des services IA
- Confirmer les quotas disponibles
- Valider les modèles supportés par région

**Ressources par cloud** :
- **AWS** : [AWS Regional Services](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/)
- **GCP** : [GCP Product Availability](https://cloud.google.com/about/locations)
- **Azure** : [Azure Products by Region](https://azure.microsoft.com/explore/global-infrastructure/products-by-region/)

#### 3. Évaluer les quotas et limites

**Quotas communs à surveiller** :
- **Compute** : Nombre de GPUs, TPUs, instances
- **Inference** : Requests/minute, tokens/minute
- **Storage** : Capacité, IOPS
- **Networking** : Bande passante

**Actions préventives** :
- Demander des augmentations de quotas en avance
- Monitorer l'utilisation vs quotas
- Avoir un plan B (région alternative)

#### 4. Optimiser le placement des données (RAG)

**Principe de co-location** :
```
Region A
├── AI Model ←→ Data Storage (faible latence)
└── Vector Database

vs.

Region A: AI Model
Region B: Data Storage (haute latence ✗)
```

**Bonnes pratiques** :
- Co-localiser données et modèles dans la même région
- Utiliser le caching pour les données fréquemment accédées
- Répliquer les datasets critiques

#### 5. Répliquer les assets critiques

**Assets à répliquer** :
- Modèles fine-tunés
- Datasets RAG
- Modèles entraînés custom
- Données d'entraînement
- Configurations et paramètres

**Services de réplication** :
- **AWS** : S3 Cross-Region Replication
- **GCP** : Cloud Storage Transfer Service
- **Azure** : Storage Account Replication

## 4. Construire une fondation IA

### Deux approches

#### Option A : Utiliser une Landing Zone cloud

**Qu'est-ce qu'une Landing Zone ?**
Une configuration prédéfinie de l'environnement cloud avec :
- Réseau configuré
- Sécurité baseline
- Gouvernance et politiques
- Logging et monitoring
- Identity et accès

**Landing Zones par cloud** :
- **AWS** : [AWS Control Tower](https://aws.amazon.com/controltower/) + Landing Zone Accelerator
- **GCP** : [Google Cloud Setup Checklist](https://cloud.google.com/docs/enterprise/setup-checklist)
- **Azure** : [Azure Landing Zones](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/)

**Architecture IA dans Landing Zone** :
```
Landing Zone Foundation
├── Platform Resources (réseau, sécurité, identité)
└── Application Landing Zones
    ├── Standard Workloads
    └── AI Workloads ← Déployer ici
        ├── Internet-Facing AI
        └── Internal AI
```

#### Option B : Construire un environnement IA baseline

**Si vous n'utilisez pas de Landing Zone** :

**Hiérarchie des ressources baseline** :
```
Organization Root
├── Policies (IAM, Security, Compliance)
├── AI Workloads
│   ├── Online AI (internet-facing)
│   │   └── Deny access to internal data
│   └── Corporate AI (internal)
│       └── Deny public access
└── Platform Services
    ├── Networking (VPC, Subnets)
    ├── Security (KMS, Secrets)
    └── Monitoring (Logs, Metrics)
```

**Composants essentiels** :
1. **Réseau isolé** : VPC/VNet dédié pour l'IA
2. **Jumpbox** : Accès sécurisé pour la gestion
3. **Politiques** : Séparation Online/Corporate
4. **Monitoring** : Logs et métriques centralisés
5. **Sécurité** : Chiffrement, secrets management

## Architecture de référence

### Hiérarchie baseline pour workloads IA

```
┌─────────────────────────────────────────────────┐
│           Organization / Root Account            │
└─────────────────────────────────────────────────┘
                        │
        ┌───────────────┴───────────────┐
        ↓                               ↓
┌──────────────────┐          ┌──────────────────┐
│ Internal AI      │          │ Internet-Facing  │
│ (Corporate)      │          │ AI (Online)      │
└──────────────────┘          └──────────────────┘
        │                               │
        ↓                               ↓
┌──────────────────┐          ┌──────────────────┐
│ Subscription/    │          │ Subscription/    │
│ Project: Ops AI  │          │ Project: Web AI  │
└──────────────────┘          └──────────────────┘
        │                               │
        ↓                               ↓
  [Jumpbox Access]              [Public Endpoints]
        │                               │
        ↓                               ↓
   [AI Resources]                 [AI Resources]
```

**Principes clés** :
- Segmentation Online/Corporate
- Politiques deny explicites
- Accès managé (jumpbox pour Corporate)
- Monitoring unifié

## Checklist Ready

### 🚀 Startup
- [ ] Construire un environnement IA
- [ ] Choisir une architecture

### 🏢 Enterprise
- [ ] Établir la gouvernance IA
- [ ] Établir le réseau IA
- [ ] Établir la fiabilité IA
- [ ] Établir une fondation IA (Landing Zone ou Baseline)
- [ ] Choisir une architecture
- [ ] Définir les zones de design IA

## Prochaine étape

→ [Phase 4 : Govern](04-govern.md) - Gouverner l'IA
