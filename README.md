# My Portfolio

A personal portfolio app built with Flutter — runs on Android, iOS, Web, Windows, macOS, and Linux. Deployed to Firebase Hosting.

---

## Live Demo

> _Add your Firebase Hosting URL here once deployed, e.g.:_
> **[kenilraiyani.web.app](https://kenilraiyani.web.app)**

---

## Screenshots

> _Add screenshots here: `![Portfolio](screenshots/portfolio.png)`_

---

## Features

- **Cross-platform** — single codebase targeting 6 platforms (mobile, desktop, web)
- **Firebase Hosting** — deployed as a web app via `firebase deploy`
- **Responsive layout** — adapts between mobile and desktop viewports
- **Dart / Flutter** — modern declarative UI with Material Design

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter (Dart) |
| Hosting | Firebase Hosting |
| Platforms | Android · iOS · Web · Windows · macOS · Linux |

---

## Getting Started

### Prerequisites

- Flutter SDK installed ([flutter.dev](https://flutter.dev/docs/get-started/install))
- Firebase CLI installed (`npm install -g firebase-tools`)

### Run locally

```bash
git clone https://github.com/KenilRaiyani/My-Portfolio-master.git
cd My-Portfolio-master
flutter pub get

# Run on web
flutter run -d chrome

# Run on mobile
flutter run
```

### Deploy to Firebase

```bash
flutter build web
firebase deploy
```

---

## Project Structure

```
lib/              # Dart source — screens, widgets, data
assets/           # Images, fonts, and other static files
web/              # Web-specific entry point and manifest
android/          # Android platform code
ios/              # iOS platform code
windows/          # Windows platform code
linux/            # Linux platform code
macos/            # macOS platform code
flutter build web/  # Pre-built web output
```

---

## Deployment

This project is configured for Firebase Hosting. The `firebase.json` and `.firebaserc` files are already set up. After running `flutter build web`, deploy with:

```bash
firebase deploy --only hosting
```
