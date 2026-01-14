// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import { getFirestore } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-firestore.js";
import { getStorage } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-storage.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAdabubZ9VBb76zv7iJJC9y59JLfS2xtZY",
  authDomain: "pin-map-vote.firebaseapp.com",
  projectId: "pin-map-vote",
  storageBucket: "pin-map-vote.firebasestorage.app",
  messagingSenderId: "222653568640",
  appId: "1:222653568640:web:27be44611104a2ee9c7865",
  measurementId: "G-QZZVBEKW6X"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const storage = getStorage(app);
const auth = getAuth(app);

export { db, storage, auth };
