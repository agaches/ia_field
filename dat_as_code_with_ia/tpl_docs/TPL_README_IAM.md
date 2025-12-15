# Documentation IAM - Projet Application
<!-- changer Application pour le nom de l'application -->

## Table des matières
<!-- insérer sommaire de la page -->

## Vue d'ensemble
<!-- insérer une courte description de la partie IAM -->

## Profils IAM

<!-- identifier tous les profils et fournir des informations pertinentes 
exemple
### Équipe DevOps
- GI
- Équipe Migration 
- Équipe éditeur Application

### Équipe Product
- Équipe produit en charge de Application (Marketing)

### Équipe Run
- Équipe produit en charge de Application (Marketing)
- Équipe éditeur Application

### Équipe Readers
- Managers internes Migration Application
- Équipe métier en charge de Application (Marketing)

-->

## Service Accounts

<!-- lister sous forme de tableau les services accounts, leurs profils et leurs droits 
exemple 

| Service Account | Description                            | Droits spécifiques |
| --------------- | -------------------------------------- | ------------------ |
| sa-vm-app-bdd   | Gestion des instances Base de données  | storage.objectUser |
| sa-vm-app-admin | Gestion des instances d'administration | storage.objectUser |
| sa-vm-app-etl   | Gestion des instances ETL              | storage.objectUser |
| sa-vm-app-event | Gestion des instances Event Bus        | storage.objectUser |
| sa-vm-app-sftp  | Gestion des instances SFTP             | storage.objectUser |

-->

## Matrices des droits

<!-- Créer un tableau global, avec en colonne les différents profils et en ligne tous les rôles affectés.
Dans chaque case, vous indiquerez si le profil a le rôle affecté avec un ✓, sinon laissez vide.

| Rôle                       | DevOps | Product |  Run  | Readers |
| -------------------------- | :----: | :-----: | :---: | :-----: |
| **Rôles Compute Engine**   |
| compute.admin              |   ✓    |         |       |         |
| compute.instanceAdmin.v1   |   ✓    |         |       |         |
| compute.instanceAdmin      |   ✓    |         |       |         |
| compute.viewer             |        |    ✓    |   ✓   |         |
| **Rôles Storage**          |
| storage.objectAdmin        |   ✓    |    ✓    |   ✓   |         |
| **Rôles IAM**              |
| iam.serviceAccountAdmin    |   ✓    |         |       |         |
| iam.serviceAccountUser     |        |    ✓    |   ✓   |         |
| **Rôles Base**             |
| editor                     |   ✓    |         |       |         |
| reader                     |        |    ✓    |   ✓   |    ✓    |
| **Rôles Spécifiques**      |
| iap.tunnelResourceAccessor |   ✓    |    ✓    |   ✓   |         |
| backupdr.admin             |   ✓    |         |       |         |
| file.editor                |   ✓    |    ✓    |   ✓   |         |
| file.viewer                |        |         |       |    ✓    |
| logging.admin              |   ✓    |         |       |         |
-->

## Rôle Custom

<!-- pour chaque role custom, s'il en existe, créer un tableau Role | Description listant les différents droits associés. S'il n'existe pas de role custom, indiquer "Pas de rôle custom"

exemple

### Rôles Custom MyCustomRole

| Rôle                             | Description                                  |
| -------------------------------- | -------------------------------------------- |
| roles/editor                     | Accès éditeur global                         |
| roles/compute.admin              | Administration des ressources Compute Engine |
| roles/compute.instanceAdmin.v1   | Administration des instances v1              |
| roles/compute.instanceAdmin      | Administration des instances                 |
| roles/storage.objectAdmin        | Administration des objets Storage            |
| roles/iap.tunnelResourceAccessor | Accès aux tunnels IAP                        |
| roles/iam.serviceAccountAdmin    | Administration des Service Accounts          |
| roles/backupdr.admin             | Administration des backups                   |
| roles/file.editor                | Edition des ressources Filestore             |
| roles/logging.admin              | Administration des logs                      |
-->

## API Projet activées

<!-- lister les API activées par le Projet sous forme de tableau Catégorie, Apis

exemple
| Catégorie     | APIs                                                                                   |
| ------------- | -------------------------------------------------------------------------------------- |
| **Core APIs** | • iam.googleapis.com<br>• monitoring.googleapis.com<br>• secretmanager.googleapis.com  |
| **Storage**   | • artifactregistry.googleapis.com<br>• storage.googleapis.com<br>• file.googleapis.com |
| **Compute**   | • compute.googleapis.com<br>• container.googleapis.com<br>• vpcaccess.googleapis.com   |
| **Database**  | • sqladmin.googleapis.com                                                              |

-->

# Fin du document
