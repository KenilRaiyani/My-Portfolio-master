# My Portfolio

A personal portfolio app built with Flutter — runs on Android, iOS, Web, Windows, macOS, and Linux. Deployed to Firebase Hosting.

---

## Live Demo

https://kenilportfolio.web.app/

---

## Screenshots

<img width="1895" height="911" alt="image" src="https://github.com/user-attachments/assets/644e95fd-c308-49fb-8d56-f98e8dba7a48" />
<img width="1897" height="907" alt="image" src="https://github.com/user-attachments/assets/4a22ca93-e803-4ef2-b8b9-e02901a11399" />
<img width="1896" height="906" alt="image" src="https://github.com/user-attachments/assets/0320b47b-118a-4884-91c2-51f341edd909" />
<img width="1900" height="905" alt="image" src="https://github.com/user-attachments/assets/a6bd68c6-637c-4ea0-8d1a-6e80c97fc0c3" />





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
