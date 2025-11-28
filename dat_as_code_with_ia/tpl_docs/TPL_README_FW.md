# Documentation réseau Application
<!-- changer Application pour le nom de l'application -->

## Sommaire
<!-- insérer sommaire -->

## Aperçu
<!-- insérer court aperçu -->

## Composants

<!-- insérer composants techniques identifiés sous forme de listes 
exemple:
### Serveurs
- **VMs Admin** : Machines d'administration avec plages IP définies
- **Serveur Front** : Serveur Application principal avec compte de service dédié
- **Serveur Back** : Serveur de traitement avec compte de service dédié
- **Base de Données** : Serveur de base de données (anciennement Gestionnaire) avec compte de service dédié

-->

## Diagramme des Flux Réseau

<!-- insérer schéma mermaid flowchart entre les composants réseaux identifiés

Sert-toi de ces informations pour le style :
- serveur en rectangle par défaut et fill:#bbdefb,stroke:#1565c0,color:#1565c0 
- bases de données en forme de base de donnée et fill:#ffecb3,stroke:#ff6f00,color:#ff6f00
- stockage en forme de [[ ]] et fill:#c8e6c9,stroke:#2e7d32,color:#2e7d32
- éléments extérieur fill:#f5f5f5,stroke:#616161,color:#616161

exemple

mermaid
flowchart TB
    subgraph "Réseau Application"
        Admin["VMs Admin\n(vm_admin_ranges)"]
        Front["Serveur Front\n(compte de service)"]
        Back["Serveur Back\n(compte de service)"]
        BDD["Base de Données\n(compte de service)"]
        
        Admin ->|TCP: HTTPS + ports Application| Back
        Admin ->|TCP: HTTPS + ports Application| BDD
        
        Back <->|TCP: HTTPS + ports Application| BDD
        Front <->|TCP: HTTPS + ports Application| BDD

        classDef default fill:#f9f,stroke:#333,stroke-width:2px;
        classDef adminClass fill:#ddf,stroke:#333,stroke-width:2px;
        class Admin adminClass;
    end
-->

## 🌐 Flux Réseau

### Matrice de flux réseau

<!-- insérer flux réseaux identifiés dans la matrice de flux, sous forme de tableau, avec les colonnes Source, Destination, Protocole, Ports, Commentaire, et idéalement regroupés 

exemple:
| Source    | Destination    | Protocole | Ports                     |
| --------- | -------------- | --------- | ------------------------- |
| Admin VMs | Front          | TCP       | HTTPS, Application        |
| Admin VMs | Back           | TCP       | HTTPS, Application        |
| Admin VMs | BDD            | TCP       | HTTPS, Application        |
| Front     | Back           | TCP       | HTTPS, Application        |
| Front     | BDD            | TCP       | HTTPS, Application        |
| Front     | Linux Client   | TCP       | SSH, Application          |
| Front     | Windows Client | TCP       | SSH, Windows, Application |
| Back      | BDD            | TCP       | HTTPS, Application        |
| Back      | Linux Client   | TCP       | SSH, Application          |
| Back      | Windows Client | TCP       | SSH, Windows, Application |
-->

## ⚠️ Elements de Sécurité

<!-- insérer liste des éléments de sécurité identifiés 
exemple :
- Tous les flux utilisent des comptes de service pour l'authentification
- Toutes les règles incluent la journalisation complète des métadonnées
- Priorité constante (799) pour toutes les règles
- Uniquement les ports HTTPS et Application spécifiques
- Les règles EGRESS utilisent des plages IP pour les destinations en raison des limitations GCP sur l'utilisation des comptes de service dans les règles EGRESS
- Les règles INGRESS maintiennent les restrictions des comptes de service pour un contrôle de sécurité approprié
- Toutes les communications sont unidirectionnelles lorsque possible pour maintenir le principe du moindre privilège

-->

# Fin du document