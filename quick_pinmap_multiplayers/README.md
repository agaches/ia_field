# Pin Map Live Vote 📍

A real-time multiplayer voting map application using Firebase.

## 🚀 Setup Instructions

### 1. Firebase Configuration
1. Go to [Firebase Console](https://console.firebase.google.com/).
2. Create a new project.
3. **Firestore**: Enable Firestore Database (start in **Test mode** or **Locked mode**, then apply rules below).
4. **Authentication**: Enable **Authentication** and turn on **Email/Password** provider.
    - **Crucial**: Create an admin user manually in the "Users" tab (e.g., `admin@example.com` / `securepassword`).
5. **Storage**: Enable Firebase Storage.
6. **Config**:
    - Go to Project Settings -> General -> Your apps -> Web App.
    - Copy the `firebaseConfig` object.
    - Open `js/firebase-config.js` and paste the values (apiKey, projectId, etc.).

### 2. Apply Security Rules
- **Firestore**: Copy content from `firestore.rules` to the **Firestore Database > Rules** tab.
- **Storage**: Copy content from `storage.rules` to the **Storage > Rules** tab.

### 3. Usage
1. Open `public/admin.html` (or deployed URL).
2. Login with your admin credentials.
3. Upload a background map image.
4. Share `index.html` (or the deployed URL) with users.
5. Users click on the map to place/move their dot in real-time.

## 📦 Deployment (Firebase Hosting)
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Open terminal in `quick_pinmap_multiplayers/`.
3. Login: `firebase login`
4. Initialize project (if needed, but config files are ready):
    - `firebase use --add` (select your project alias).
5. Deploy everything (Rules + Hosting):
    ```bash
    firebase deploy
    ```
6. Your app is live at `https://YOUR-PROJECT-ID.web.app`.

## 🛠 Tech Stack
- **Frontend**: HTML5, CSS3, Vanilla JS
- **Backend**: Firebase (Firestore, Storage, Auth, Hosting)
- **Concept**: Serverless, Realtime, No-Build (Modules)
