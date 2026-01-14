# 📄 Cahier des Charges : "Pin Map Live Vote"

## 1. Objectif du projet
Créer une application web minimaliste permettant à plusieurs utilisateurs simultanés de cliquer sur une image pour y déposer un point. Les points doivent apparaître en temps réel sur les écrans de tous les participants.

## 2. Fonctionnalités Principales

### Page utilisateur
*   **Accès :** Pas d'inscription. Un identifiant unique (UUID) est généré et stocké dans le navigateur (LocalStorage) pour reconnaître l'utilisateur au retour.
*   **Vote Unique :** Un utilisateur = Un point.
    *   Si l'utilisateur clique une première fois, un point apparaît.
    *   S'il clique ailleurs, son point existant se *déplace* vers la nouvelle position (mise à jour).
*   **Interaction :**
    *   Clic ou Tap pour voter.
    *   *Mobile :* Gestion soignée du conflit "Scroll vs Vote" (ex: limiter le vote au double-tap ou zone spécifique).
    *   *Anti-spam :* Délai de sécurité (throttle) de 1 seconde entre deux actions.
*   **Temps ~réel :** L'utilisateur voit apparaître et bouger les points des autres participants en direct.
*   **Feedback visuel :** Animation fluide lors de l'ajout ou du déplacement d'un point.

### Page administrateur (Sécurisée)
*   **Accès :** Interface dédiée, protégée (Authentification Firebase simple ou mot de passe robuste).
*   **Gestion Image :**
    *   Formulaire d'upload pour changer l'image de fond.
    *   L'image est stockée sur **Firebase Storage** et se met à jour pour tous les clients.
*   **Actions :**
    *   **Export :** Export de la "carte de chaleur" (Image + Points) ou des données brutes.
    *   **Reset :** Bouton de zone rouge pour effacer tous les votes et recommencer une session.

## 3. Contraintes Techniques (Spécial Vibe Coding)

*   **Frontend :** HTML5, CSS3, JavaScript (Vanilla).
    *   *Rendu :* Utiliser un conteneur propre. Privilégier une structure performante (Canvas ou SVG overlay) plutôt que des milliers de DIVs si la densité de points est élevée, mais pour un besoin simple, des marqueurs en overlay CSS suffisent.
*   **Backend : Firebase**.
    *   **Firestore :** Base de données temps réel.
    *   **Storage :** Pour héberger l'image de fond uploadée.
    *   **Sécurité :** Définir des **Règles de Sécurité (Security Rules)** strictes.
        *   *Public :* Droit de `read` global. Droit de `write/update` uniquement sur son propre document (vérification ID). Interdiction de `delete`.
        *   *Admin :* Droits complets.
*   **Responsive Design (Point Critique) :**
    *   Les coordonnées des points (X, Y) doivent être enregistrées en **pourcentage (%)** et non en pixels.
    *   *Exemple :* Si je clique au milieu, on enregistre `x: 50%, y: 50%`.
    *   *Raison :* Cela garantit que si un participant est sur mobile et l'autre sur un grand écran, le point s'affiche au même endroit relatif sur la courbe.

## 4. Structure des Données
Une seule collection dans la base de données : `votes`

| Champ | Type | Description |
| :--- | :--- | :--- |
| `id` | string | **Identifiant unique de l'utilisateur (UUID)**. Sert d'ID au document pour garantir 1 vote / personne. |
| `x` | number | Position horizontale en % (ex: 45.5) |
| `y` | number | Position verticale en % (ex: 80.2) |
| `timestamp` | date | Heure de la dernière mise à jour |

## 5. Maquette (Wireframe mental)

*   **Header :** Titre simple (ex: "Sondage Hype Cycle").
*   **Zone centrale :** L'image de la courbe qui prend toute la largeur disponible avec une toute petite marge dans une map
*   **Overlay :** Les points rouges ou bleus, semi-transparents en aera de la map contenant l'image.
*   **Footer :** Footer simple (texte statique)


### Conseil pour la mise en ligne
Une fois que l'IA a généré le code :
1. Crée un projet gratuit sur **Firebase Console**.
2. Copie les clés API qu'il te donne dans le code généré.
3. Héberge le fichier HTML sur **GitHub Pages**.