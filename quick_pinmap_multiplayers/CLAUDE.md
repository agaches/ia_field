# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Pin Map Live Vote is a real-time multiplayer voting application where users click on an image to place/move their dot. Built with vanilla JavaScript and Firebase, it uses a serverless, no-build architecture.

## Development Commands

**No build system** - This is a zero-build application using ES modules directly from CDN.

```bash
# Firebase deployment (requires firebase-tools installed globally)
npm install -g firebase-tools
firebase login
firebase deploy                    # Deploy rules + hosting

# Select/switch Firebase project
firebase use --add
```

## Architecture

### Stack
- **Frontend**: Vanilla JavaScript (ES6 modules), HTML5, CSS3
- **Backend**: Firebase (Firestore, Storage, Auth, Hosting)
- **No package.json** - Dependencies loaded from CDN URLs in source files

### Key Files
- `public/js/firebase-config.js` - Firebase SDK initialization and exports (configure credentials here)
- `public/js/app.js` - User voting interface logic
- `public/js/admin.js` - Admin interface logic (image upload, vote reset)
- `public/index.html` - User-facing voting page
- `public/admin.html` - Admin dashboard (requires Firebase Auth login)
- `firestore.rules` / `storage.rules` - Database and storage security rules

### Data Model

**Collection: `votes`** (Document ID = User UUID)
- `x`, `y` (number): Position as percentage 0-100 (not pixels) for responsive display
- `userId` (string): UUID for security rule validation
- `timestamp` (serverTimestamp): Last update time

**Collection: `config/settings`**
- `mapUrl`: Background image URL from Firebase Storage

### Key Patterns

1. **Percentage-based coordinates**: All positions stored as percentages (0-100%) to ensure consistent display across device sizes. Calculation: `xPercent = (clickX / containerWidth) * 100`

2. **Real-time sync**: Firestore `onSnapshot()` listeners drive all UI updates - no polling

3. **One vote per user**: Document ID uses userId (UUID from localStorage) to enforce single vote

4. **Vote throttling**: 1-second delay between submissions to prevent spam (implemented in `app.js`)

5. **Authentication split**: Users are anonymous (UUID-based), admins use Firebase Email/Password auth. Security enforced via Firestore rules.

### Security Model

Firestore rules enforce:
- `config`: Public read, authenticated (admin) write
- `votes`: Public read, users can only create/update their own document
- Delete votes: Authenticated users only (admin)
