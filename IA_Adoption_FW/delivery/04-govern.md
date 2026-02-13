# Phase 4 : Govern - Gouvernance IA équipe (MEDIUM)

## Vue d'ensemble

La gouvernance pour l'usage IA en équipe établit des **politiques collectives**, des **processus de validation** et une **supervision adaptée**. L'objectif est d'assurer qualité et cohérence sans ralentir la livraison.

## 1. Évaluer les risques équipe

### Risques principaux pour l'usage collectif

| Risque | Description | Impact | Mitigation |
|--------|-------------|--------|------------|
| **Qualité du code généré** | Code IA non validé introduit des bugs | Défauts en production | Code review systématique |
| **Biais dans les livrables** | Outputs IA biaisés affectent le produit | Expérience utilisateur dégradée | Validation output process |
| **Fuite de données équipe** | Partage de code/données sensibles | IP compromise | DLP monitoring basique |
| **Inconsistance dans l'usage** | Chacun utilise l'IA différemment | Qualité variable | Standards d'équipe |
| **Dépendance excessive** | Équipe ne peut plus livrer sans IA | Perte d'autonomie | Formation continue |

### Framework d'évaluation des risques (simplifié)

Pour chaque nouveau tool ou pattern IA :

| Critère | Questions | Score (1-5) |
|---------|-----------|-------------|
| **Impact données** | Quelles données seront partagées ? | ? |
| **Impact qualité** | Comment valider les outputs ? | ? |
| **Impact productivité** | Quel gain vs risque ? | ? |
| **Impact équipe** | Tout le monde peut l'utiliser ? | ? |

**Seuil d'approbation** : Score moyen > 3 → Approuvé par team lead

## 2. Documenter les politiques d'équipe

### Structure de la politique (5-10 pages)

#### 1. Usage Acceptable
- Outils approuvés pour l'équipe
- Cas d'usage encouragés vs découragés
- Limites d'utilisation

#### 2. Data Handling
- Classification des données (public, internal, confidential)
- Règles de partage avec outils IA
- Anonymisation requise pour données sensibles

#### 3. Validation des Outputs
- Processus de code review pour code IA
- Validation pour documentation générée
- Tests requis pour code généré

#### 4. Approbations
- Qui approuve quoi (team lead, tech lead)
- Processus pour nouveaux outils
- Escalade pour cas complexes

#### 5. Monitoring et Métriques
- Dashboard équipe (adoption, qualité, coûts)
- Revues mensuelles
- Ajustements basés sur learnings

### Template de politique équipe

```markdown
# Politique IA - Équipe [Nom]

## 1. Outils Approuvés
- GitHub Copilot (tous les devs)
- ChatGPT Team (tech leads uniquement)
- Claude Code (seniors uniquement)

## 2. Data Handling
- ✅ Code non-propriétaire
- ⚠️ Architecture interne (après anonymisation)
- ❌ Credentials, secrets, données clients

## 3. Validation Requise
- Code review obligatoire pour tout code IA (pas de commit direct)
- Tests unitaires pour code critique
- Documentation review pour docs générées

## 4. Approbations
- Tech Lead : nouveaux outils, patterns expérimentaux
- Product Owner : features client-facing utilisant IA
- Sécurité : intégrations tierces

## 5. Métriques
- Adoption : % de PRs avec IA
- Qualité : taux de bugs dans code IA vs manuel
- Coûts : budget mensuel par dev
```

## 3. Appliquer les politiques

### Processus d'approbation pour nouveaux outils

```
Proposition d'outil
       ↓
Team Lead évalue (framework risques)
       ↓
   ┌───┴───┐
   │       │
Score < 3   Score ≥ 3
   │       │
   ↓       ↓
Rejeté   Approuvé
         ↓
      Essai (1 sprint)
         ↓
      Réévaluation
```

**Timeline** : 1-2 jours pour décision, 1 sprint pour validation

### Peer Review Process

**Pour code généré par IA** :
1. Developer marque le code comme "AI-generated" dans PR
2. Reviewer vérifie :
   - Logique correcte
   - Pas de vulnérabilités (secrets, injection)
   - Tests adéquats
   - Conformité standards équipe
3. Approbation ou demande de modifications

**Automation légère** :
- Pre-commit hooks : détection de secrets
- CI checks : tests obligatoires
- Linting : standards de code

## 4. Surveiller les métriques équipe

### Dashboard équipe (mise à jour mensuelle)

**Adoption** :
- % de PRs utilisant IA
- % de l'équipe utilisant activement les outils
- Outils les plus utilisés

**Qualité** :
- Taux de bugs : code IA vs code manuel
- Temps de review : code IA vs code manuel
- Régressions introduites

**Productivité** :
- Vélocité équipe (story points/sprint)
- Lead time (commit → production)
- Satisfaction développeur (survey trimestriel)

**Coûts** :
- Coût mensuel par développeur
- ROI estimé (gain productivité vs coût)

### Revues mensuelles

**Format** : 30min team meeting
1. Présenter les métriques du mois
2. Identifier ce qui marche / ne marche pas
3. Décider : continuer, ajuster, arrêter
4. Actions pour le mois suivant

## 5. AI CoE Optionnel

### Alternative : Platform Team

Pour équipes sans AI CoE dédié, le **platform team** ou **tech leads** peuvent :
- Maintenir la liste d'outils approuvés
- Organiser les formations internes
- Partager les best practices
- Coordonner avec d'autres équipes

**Pas de comité éthique formel** : les risques éthiques majeurs sont escaladés à la direction.

### Coordination inter-équipes

Si plusieurs équipes utilisent l'IA :
- Réunion mensuelle tech leads
- Partage des learnings
- Standardisation des outils (optionnel)
- Mutualisation des coûts (licences équipe)

## 6. Allocation des coûts

### Modèle de coûts équipe

**Par développeur** :
- GitHub Copilot : 10€/mois
- ChatGPT Team : 25€/mois
- Autres outils : variable

**Budget équipe** : (Nb devs × coût/dev) + buffer 20%

**Tracking** : Facturation mensuelle par équipe, dashboard dans finance tool

## Checklist Govern (Delivery)

### 🏢 Équipe

- [ ] Documenter la politique équipe (5-10 pages)
- [ ] Établir le processus d'approbation (team lead)
- [ ] Mettre en place le peer review process
- [ ] Créer le dashboard métriques équipe
- [ ] Planifier les revues mensuelles
- [ ] Allouer le budget équipe
- [ ] Former l'équipe aux politiques

## Prochaine étape

→ [Phase 5 : Secure](05-secure.md) - Sécuriser l'usage IA en équipe
