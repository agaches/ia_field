// User Application Logic
import { db } from './firebase-config.js';
import { collection, doc, setDoc, onSnapshot, serverTimestamp } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-firestore.js";

// --- Configuration ---
const COLLECTION_VOTES = "votes";
const COLLECTION_CONFIG = "config";
const DOC_CONFIG_SETTINGS = "settings";
const THROTTLE_DELAY = 1000; // 1 second

// --- State ---
let userId = null;
let lastVoteTime = 0;
const mapContainer = document.getElementById('map-container');
const mapImage = document.getElementById('map-image');
const dotsLayer = document.getElementById('dots-layer');

// --- Initialization ---
async function init() {
    userId = getOrCreateUserId();
    console.log("UserID:", userId);

    // Load Map Image Config
    loadMapConfig();

    // Setup Event Listeners
    setupInteraction();

    // Start Listening for Votes
    subscribeToVotes();
}

// --- User Identity ---
function getOrCreateUserId() {
    let id = localStorage.getItem('pinmap_user_id');
    if (!id) {
        // Fallback for older browsers or insecure contexts
        if (typeof crypto.randomUUID === 'function') {
            id = crypto.randomUUID();
        } else {
             id = 'user_' + Math.random().toString(36).substr(2, 9);
        }
        localStorage.setItem('pinmap_user_id', id);
    }
    return id;
}

// --- Map Config ---
function loadMapConfig() {
    // Listen for config changes (admin updates image)
    const configDocRef = doc(db, COLLECTION_CONFIG, DOC_CONFIG_SETTINGS);
    
    // Note: This relies on the document existing. 
    // If it doesn't exist, we just keep the default image.
    onSnapshot(configDocRef, (docSnap) => {
        if (docSnap.exists()) {
            const data = docSnap.data();
            if (data.mapUrl) {
                // Preload image to avoid flickering
                const img = new Image();
                img.onload = () => {
                    mapImage.src = data.mapUrl;
                };
                img.src = data.mapUrl;
            }
        }
    });
}

// --- Interaction Handling ---
function setupInteraction() {
    // We use click, which covers mouse click and touch tap.
    // The browser natively handles scroll-vs-tap: scrolling over the map doesn't trigger click.
    mapContainer.addEventListener('click', handleMapClick);
}

function handleMapClick(event) {
    const now = Date.now();
    if (now - lastVoteTime < THROTTLE_DELAY) {
        console.log("Throttled");
        // Optional: specific visual feedback for throttling
        return;
    }

    // Identify if the click was on a dot (which might block the container if not careful)
    // CSS pointer-events: none on dots handles this, so event always hits container or image
    
    // Changement ici : on vise l'image, pas le contamp
    const rect = mapImage.getBoundingClientRect();
    
    // Calculate click position relative to the container
    const xPx = event.clientX - rect.left;
    const yPx = event.clientY - rect.top;

    // Convert to percentage
    const xPct = (xPx / rect.width) * 100;
    const yPct = (yPx / rect.height) * 100;

    // Boundary check (0-100%) to ensure we don't vote outside
    const finalX = Math.max(0, Math.min(100, xPct));
    const finalY = Math.max(0, Math.min(100, yPct));

    console.log(`Vote at: ${finalX.toFixed(2)}%, ${finalY.toFixed(2)}%`);

    // Save to Firestore
    saveVote(finalX, finalY);
    
    // We don't necessarily need to optimistically render because the snapshot listener 
    // usually fires extremely fast for local writes (latency compensation).
    // But for "Vibe" we can rely on the listener.
    
    lastVoteTime = now;
}

// --- Firestore Integration ---
async function saveVote(x, y) {
    try {
        const userVoteRef = doc(db, COLLECTION_VOTES, userId);
        
        // Write to Firestore
        // This will trigger the snapshot listener locally almost instantly
        await setDoc(userVoteRef, {
            x: x,
            y: y,
            timestamp: serverTimestamp(),
            userId: userId
        });
    } catch (error) {
        console.error("Error saving vote:", error);
        alert("Failed to save vote. Check console for details.");
    }
}

function subscribeToVotes() {
    const q = collection(db, COLLECTION_VOTES);
    
    onSnapshot(q, (snapshot) => {
        snapshot.docChanges().forEach((change) => {
            const data = change.doc.data();
            const docId = change.doc.id;

            if (change.type === "added" || change.type === "modified") {
                renderDot({ 
                    id: docId, 
                    x: data.x, 
                    y: data.y, 
                    isMine: docId === userId 
                });
            }
            if (change.type === "removed") {
                removeDot(docId);
            }
        });
    }, (error) => {
        console.error("Error listening to votes:", error);
    });
}

// --- Rendering ---
function renderDot({ id, x, y, isMine }) {
    let dot = document.getElementById(`dot-${id}`);
    
    // Create if not exists
    if (!dot) {
        dot = document.createElement('div');
        dot.id = `dot-${id}`;
        dot.className = 'vote-dot';
        dotsLayer.appendChild(dot);
    }

    // Apply specific styles
    if (isMine) {
        dot.classList.add('my-dot');
    }

    // Update position
    dot.style.left = `${x}%`;
    dot.style.top = `${y}%`;
}

function removeDot(id) {
    const dot = document.getElementById(`dot-${id}`);
    if (dot) {
        dot.remove();
    }
}

// Start
init();
