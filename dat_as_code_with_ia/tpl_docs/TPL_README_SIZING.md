# Dimensionnement des ressources (Sizing) - Application

<!-- changer Application pour le nom de l'application -->

## Table des matières
<!-- créer table des matières avec liens -->

<!-- A créer pour chaque environnement 
créer une ancre markdown du nom de l'env pour y accéder plus facilement
-->
## Environnement de production

### Dimensionnement serveurs

<!-- faire un dimensionnement des serveurs avec ce type de tableau

| Composant       | Machine type   | vCPU | RAM   | Boot Disk | Data Disk | Profile   | Zone           |
| --------------- | -------------- | ---- | ----- | --------- | --------- | --------- | -------------- |
| Serveur Front   | n2d-standard-4 | 4    | 16 GB | 150 GB    | 300 GB    | highlevel | europe-west9-a |
| Serveur Back    | n2-standard-8  | 8    | 32 GB | 100 GB    | 1024 GB   | normal    | europe-west9-a |
| Base de Données | n2-highmem-2   | 2    | 16 GB | 64 GB     | 50 GB     | normal    | europe-west9-a |

-->

### Dimensionnement composants

<!-- faire un dimensionnement des composants autres que serveurs avec un tableau reprenant les composants, la zone, leur sizing ou sku et les infos techniques 

comme pour les serveurs, mais adaptés aux composants

| Composant       | Machine type   | vCPU | RAM   | Boot Disk | Data Disk | Profile   | Zone           |
| --------------- | -------------- | ---- | ----- | --------- | --------- | --------- | -------------- |
| Serveur Front   | n2d-standard-4 | 4    | 16 GB | 150 GB    | 300 GB    | highlevel | europe-west9-a |
| Serveur Back    | n2-standard-8  | 8    | 32 GB | 100 GB    | 1024 GB   | normal    | europe-west9-a |
| Base de Données | n2-highmem-2   | 2    | 16 GB | 64 GB     | 50 GB     | normal    | europe-west9-a |

-->


## Différences entre environnements
<!-- Identifier les différences entre environnement et l'associer au composant concerné

exemple :

| Composant                 | Production       | Recette          | Différence                    |
| ------------------------- | ---------------- | ---------------- | ----------------------------- |
| Serveur Front profile     | highlevel        | normal           | Profil moins élevé en recette |
| Serveur Front boot disk   | 150 GB           | 150 GB           | Identique                     |
| Serveur Front data disk   | 300 GB           | 300 GB           | Identique                     |
| Serveur Back type         | n2-standard-8    | n2-standard-8    | Identique                     |
| Serveur Back disks        | 100 GB + 1024 GB | 100 GB + 1024 GB | Identique                     |
| Base de Données type      | n2-highmem-2     | n2-highmem-2     | Identique                     |
| Base de Données boot disk | 64 GB            | 150 GB           | Plus grand en recette         |

-->

# Fin du document