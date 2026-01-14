# 🚀 Project Plan: Pin Map Live Vote

## Phase 1: Setup & Configuration
- [ ] **Firebase Setup**:
    - [ ] Create a new project in Firebase Console.
    - [ ] Enable **Firestore Database** (start in Test mode initially, then switch to locked).
    - [ ] Enable **Storage** (for image hosting).
    - [ ] Enable **Authentication** (Email/Password for Admin).
    - [ ] Get Firebase Web Configuration (API Keys).
- [ ] **Project Structure**:
    - [ ] Create `index.html` (User view).
    - [ ] Create `admin.html` (Admin interface).
    - [ ] Create `css/style.css` (Shared styles).
    - [ ] Create `js/firebase-config.js` (Shared Firebase init).
    - [ ] Create `js/app.js` (User logic).
    - [ ] Create `js/admin.js` (Admin logic).

## Phase 2: Frontend Core (User UI & Logic)
- [x] **Layout & Styling**:
    - [x] Build the main container for the image map.
    - [x] Implement CSS for the "Image Map Wrapper" ensuring `position: relative`.
    - [x] ensure the marker overlay layer sits precisely on top of the image.
- [x] **User Identification**:
    - [x] Implement `getOrCreateUserId()` logic using `localStorage` (UUID generation).
- [x] **Coordinate System**:
    - [x] Implement click/tap event listener on the image container.
    - [x] **Logic**: Calculate click position as **Percentage (%)** relative to image width/height ($X\% = \frac{ClickX}{Width} \times 100$).
- [x] **Mobile & UX**:
    - [x] Add visual feedback immediately on local click (optimistic UI via Firestore).
    - [x] Implement debounce/throttle (1 sec delay) to prevent spam.
    - [x] Handle touch events to differentiate between scrolling and voting (e.g., prevent accidental taps).

## Phase 3: Backend & Data Sync (Firestore)
- [x] **Data Integration**:
    - [x] **Write**: Function to save vote to Firestore (`collection: votes`, `docId: userId`).
        - Fields: `x` (number), `y` (number), `timestamp` (serverTimestamp).
    - [x] **Read**: specific Firestore listener (`onSnapshot`) to listen for real-time updates.
- [x] **Rendering**:
    - [x] Create a rendering function to draw dots based on % coordinates.
    - [x] Handle "Move" vs "New": If a doc ID already exists in the DOM, animate/move it; otherwise create new.
- [x] **Security Rules**:
    - [x] Write Firestore rules:
        - `read`: allow public.
        - `write`: allow if `request.auth.uid == userId` OR simply check if document ID matches client-claimed ID (for anonymous usage).
        - `delete`: deny public.

## Phase 4: Admin Interface
- [x] **Authentication**:
    - [x] Implement a simple Login form on `admin.html`.
    - [x] Protect admin functions behind `firebase.auth().onAuthStateChanged`.
- [x] **Image Management**:
    - [x] Create File Input for image upload.
    - [x] Upload logic to **Firebase Storage**.
    - [x] Store/Update the "Active Image URL" in a Firestore config document (e.g., `config/settings`).
    - [x] Update Client `app.js` to load the image from this configuration dynamically.
- [x] **Management Tools**:
    - [x] **Reset**: Button to batch delete all documents in the `votes` collection.
    - [x] **Export**: Script to generate a visual snapshot or download JSON data of coordinates.

## Phase 5: Deployment & Polish
- [x] **Final Polish**:
    - [x] Verify responsive behavior on Mobile vs Desktop.
    - [x] Check dot sizing logic (should dots remain px magnitude or scale?).
- [x] **Deployment (Firebase Hosting)**:
    - [x] Create `public` folder and move web assets (`.html`, `js`, `css`).
    - [x] Create `firebase.json` configuration.
    - [x] Update documentation for `firebase deploy`.

