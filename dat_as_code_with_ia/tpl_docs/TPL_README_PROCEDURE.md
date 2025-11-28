# Documentation Technique - Exploitation Composant
<!-- renommer Composant par le nom du composant technique cible -->

## Supervision
<!-- insérer ici la liste des élément, alerting, supervision identifiés dans le code
exemple :
- Métriques disponibles:
  - Utilisation disque
  - Utilisation mémoire
  - État des instances
  - Statut health check
 -->

 ## Sauvegarde
<!-- insérer ici la description des mécanismes de sauvegarde et restauration du composant technique
 -->

## Procédures Opérationnelles

### Maintenance
<!-- insérer ici les éléments de maintenance automatisée identifiés dans le code
exemple :
1. **Mise à jour instances**:
   - Rolling update automatique via MIG
   - Max indisponible: 1 instance en DEV, 2 en PROD
   - Période de grâce: 3600s après démarrage

2. **Gestion capacité**:
   - Autoscaling basé sur CPU (seuil: 65%)
   - Scaling manuel possible via GCP Console
 -->

### Logs
<!-- insérer ici les informations sur les logs identifiées dans le code
exemple :
- Logs système: /var/log/messages
- Logs SFTP: /var/log/secure
- Logs service: journalctl -u app-sftp.service
 -->

## Gestion d'incident

### Vérifications Courantes
<!-- insérer ici les procédures courantes avec leurs commandes pour tester le service du composant technique
1. **Connexion SFTP**:
   ```bash
   # Test connexion
   sftp -P 2222 ftpuserapp@<IP_LB>
   
   # Vérification service
   systemctl status app-sftp.service
   ```

2. **Health Check**:
   ```bash
   # Test port
   nc -vz localhost 2222
   
   # Logs health check
   tail /var/log/messages | grep health-check
   ```
 -->


### Problèmes Courants
<!-- insérer ici un tableau reprenant les problèmes courants, sous forme Problème | Vérification | Solution
exemple

| Problème           | Vérification        | Solution                                                 |
| ------------------ | ------------------- | -------------------------------------------------------- |
| Échec connexion    | Statut service SFTP | Redémarrer service: `systemctl restart app-sftp.service` |
| Instance unhealthy | Logs health check   | Vérifier port 2222 et service                            |
| Problème montage   | Check Filestore     | Remonter: `mount -a`                                     |

 -->
