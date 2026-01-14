// Admin Application Logic
import { db, storage, auth } from './firebase-config.js';
import { signInWithEmailAndPassword, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js";
import { ref, uploadBytes, getDownloadURL } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-storage.js";
import { collection, getDocs, deleteDoc, doc, setDoc } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-firestore.js";

// DOM Elements
const loginSection = document.getElementById('login-section');
const adminControls = document.getElementById('admin-controls');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');
const loginBtn = document.getElementById('login-btn');
const mapUpload = document.getElementById('map-upload');
const updateMapBtn = document.getElementById('update-map-btn');
const uploadStatus = document.getElementById('upload-status');
const resetVotesBtn = document.getElementById('reset-votes-btn');

// --- Auth ---
onAuthStateChanged(auth, (user) => {
    if (user) {
        // User is signed in
        loginSection.style.display = 'none';
        adminControls.style.display = 'block';
    } else {
        // User is signed out
        loginSection.style.display = 'block';
        adminControls.style.display = 'none';
    }
});

loginBtn.addEventListener('click', async () => {
    const email = emailInput.value;
    const password = passwordInput.value;
    try {
        await signInWithEmailAndPassword(auth, email, password);
    } catch (error) {
        alert("Login failed: " + error.message);
    }
});

// --- Map Update ---
updateMapBtn.addEventListener('click', async () => {
    const file = mapUpload.files[0];
    if (!file) {
        alert("Please select a file first.");
        return;
    }

    uploadStatus.innerText = "Uploading...";
    
    try {
        // 1. Upload to Storage
        const storageRef = ref(storage, 'maps/' + file.name);
        await uploadBytes(storageRef, file);
        
        // 2. Get URL
        const url = await getDownloadURL(storageRef);
        console.log("File available at", url);
        
        // 3. Update Firestore Config
        await setDoc(doc(db, "config", "settings"), {
            mapUrl: url,
            updatedAt: new Date()
        }, { merge: true });

        uploadStatus.innerText = "Success! Map updated.";
    } catch (error) {
        console.error("Upload failed:", error);
        uploadStatus.innerText = "Error: " + error.message;
    }
});

// --- Reset Votes ---
resetVotesBtn.addEventListener('click', async () => {
    if (!confirm("Are you SURE? This will delete ALL votes.")) return;
    
    try {
        resetVotesBtn.disabled = true;
        resetVotesBtn.innerText = "Deleting...";
        
        // Note: Client-side batch delete functionality is limited if there are thousands of docs.
        // For Scale: Use a Cloud Function.
        // For Vibe/Prototype: This is fine.
        const querySnapshot = await getDocs(collection(db, "votes"));
        
        const deletePromises = [];
        querySnapshot.forEach((document) => {
            deletePromises.push(deleteDoc(doc(db, "votes", document.id)));
        });

        await Promise.all(deletePromises);
        alert(`Deleted ${deletePromises.length} votes.`);
    } catch (error) {
        console.error("Reset failed:", error);
        alert("Error resetting votes: " + error.message);
    } finally {
        resetVotesBtn.disabled = false;
        resetVotesBtn.innerText = "RESET ALL VOTES";
    }
});
