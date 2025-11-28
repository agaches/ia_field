# Infrastructure APPLICATION
Ce repository contient le code Terraform pour déployer l'infrastructure APPLICATION sur Google Cloud Platform.

<!-- remplacer Application par son nom -->


## Documentation interne

<!-- insérer lien vers page confluence -->

## Description

<!-- insérer description du projet -->

## Architecture interne

<!-- insérer schéma mermaid flowchart 

Sert-toi de ces informations pour le style :
- serveur en rectangle par défaut et fill:#bbdefb,stroke:#1565c0,color:#1565c0 
- bases de données en forme de base de donnée et fill:#ffecb3,stroke:#ff6f00,color:#ff6f00
- stockage en forme de [[ ]] et fill:#c8e6c9,stroke:#2e7d32,color:#2e7d32
- éléments extérieur fill:#f5f5f5,stroke:#616161,color:#616161

exemple

mermaid
graph TB
    subgraph "Infrastructure Application GCP"
        Front["Serveur Front<br/>- Administration centrale<br/>- Base de données<br/>4vCPU/16GB"]:::server
        Back["Serveur Back<br/>- Gestion du stockage<br/>- Cache MSDP<br/>8vCPU/32GB"]:::server
        BDD["Base de Données<br/>- Gestion des sauvegardes<br/>2vCPU/16GB"]:::server
        Storage[[Google Cloud Storage<br/>Stockage long terme]]:::storage
        
        Front --> Back
        Front --> BDD
        Back --> Storage
        Back <--> BDD
        
        subgraph "Clients"
            Linux["Machines Linux"]:::external
            Windows["Machines Windows"]:::external
            FileStore["FileStore GCP"]:::external
            CloudSQL[(Bases Cloud SQL)]:::database
        end
        
        Front --> Linux 
        Front --> Windows
        Back --> Linux
        Back --> Windows
        Back --> FileStore
        Back --> CloudSQL
    end

classDef server fill:#bbdefb,stroke:#1565c0,color:#1565c0
classDef database fill:#ffecb3,stroke:#ff6f00,color:#ff6f00
classDef storage fill:#c8e6c9,stroke:#2e7d32,color:#2e7d32
classDef external fill:#f5f5f5,stroke:#616161,color:#616161
-->

## Exploitation

<!-- demander en interaction la page confluence d'exploitation et insérer lien vers page confluence exploitation -->

<!-- 
Insérer lien vers page conflulence exploitation

Créer un sous-répertoire de /docs nommé /dex
Créer fichier /docs/dex/readme.md à partir de TPL_README_DEX.md

Pour chaque composant technique identifié dans le schéma d'architecture, 
- créer un fichier à partir du template TPL_README_PROCEDURE.md
- Insérer lien vers page procedure du composant technique
exemple:
* [Serveur web](./docs/dex/procedures_serveur.md)
* [CloudSQL](./docs/dex/procedures_cloudsql.md)
* [Storage](./docs/dex/procedures_storage.md)
 -->

## 📁 Structure du Repository

<!-- insérer structure repo
exemple :

```
├── modules/
│   └── tf-module-projet/     # Module principal
├── environments/
│   ├── sandbox/              # Environnement Sandbox
│   ├── dev/                  # Environnement Dev
│   ├── rec/                  # Environnement Rec
│   ├── prep/                # Environnement Prep
│   └── prod/                # Environnement Prod
└── scripts/                  # Scripts de configuration
```
 -->

## 🏗️ Prérequis

<!-- insérer prérequis techniques (Terraform et autres identifiés dans le code) -->

## Description de la gestion IAM

<!-- 
créer un fichier à partir du template TPL_README_IAM.md
insérer lien vers page iam
exemple: [IAM](./docs/doc_iam.md)
 -->

## 🌐 Configuration Réseau

<!-- 
créer un fichier à partir du template TPL_README_FW.md
insérer lien vers page FW
exemple: [Configuration réseau](./docs/doc_fw.md)
 -->

## 📊 Dimensionnement des Environnements

<!-- 
créer un fichier à partir du template TPL_README_SIZING.md
insérer lien vers page sizing
exemple: [SIZING](./docs/doc_sizing.md)

insérer un lien vers chaque env de la page sizing
 -->

## 🔒 Variables et Secrets

<!-- 
  insérer la liste des variables nécessaires pour l'exécution

exemple :
Les variables sensibles sont gérées via Vault et incluent :
- `cloudsql_admin_password`
- `cloudsql_sa_user_password`
- `vault_ldap_password`
- `ssh_admin_public`
 -->

## ⚠️ Points d'Attention

<!-- 
  lister les points d'attention qui te paraissent importants sur ce code sous forme de liste numérotée

  exemple :
  1. Toujours vérifier les quotas GCP avant déploiement
2. Les mots de passe et clés SSH doivent être configurés dans Vault
3. Le déploiement complet peut prendre jusqu'à 1 heure
4. Le déploiement des Compute Engine porte une opération post-déploiement d'installation de prérequiss
  -->

## 🤝 Support

<!-- 
 indiquer ici comment contacter l'équipe

Pour toute question ou assistance :
- Créer une issue dans ce repository
- Contacter l'équipe Produit APP
-->

# Fin du document