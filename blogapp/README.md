# Flutter + Firebase Blog Application

A comprehensive blog application built with Flutter and Firebase.

## Documentation

### API Documentation
- **Postman Collection**: [docs/flutter_firebase_postman.json](docs/flutter_firebase_postman.json)
- **Version**: 1.0.0
- **Base URL**: https://your-app.firebaseapp.com
- **Authentication**: Firebase ID Token
- **Last Updated**: 2025-01-16

### Architecture Documentation
- **Architecture Guide**: [ARCHITECTURE.md](ARCHITECTURE.md)
  - System overview and tech stack
  - Directory structure
  - Data flow diagrams
  - Firebase integration details
  - Service implementations
  - Deployment guidelines

## Screenshots

### Flutter App Interface
![Flutter Demo Home Page](https://drive.google.com/file/d/1jzhqwlhDC-ipBpnOdE0adIlhLcHSJ0qP/view?usp=sharing)


## How to Use API Documentation

1. **Import into Postman**:
   - Open Postman
   - Click "Import" → Select [docs/flutter_firebase_postman.json](docs/flutter_firebase_postman.json)
   - Collection will load with all Firebase endpoints

2. **Configure Variables**:
   - Replace `YOUR_API_KEY` with your Firebase Web API Key
   - Replace `YOUR_PROJECT_ID` with your Firebase Project ID
   - Replace `YOUR_BUCKET_NAME` with your Storage Bucket
   - Replace `YOUR_ID_TOKEN` with user's ID token from authentication

3. **Available Endpoints**:
   - Firebase Authentication (Sign Up, Sign In, Sign Out)
   - Firestore Blog Posts (CRUD operations)
   - Firestore Comments (Add, Retrieve)
   - Firebase Storage (Upload, Download Images)

## Getting Started

### Prerequisites
- Flutter SDK 3.10.4 or higher
- Firebase project configured
- Android Studio or Xcode for native development

### Installation
```bash
flutter pub get
flutter run
```

### Firebase Setup
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
2. Add Firebase credentials to `lib/utils/firebase_config.dart`
3. Enable Authentication, Firestore, and Storage

## Project Structure
See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed directory structure and organization.

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Documentation](https://dart.dev/guides)
