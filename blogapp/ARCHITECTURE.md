# Architecture Overview

## System Overview

### Tech Stack
- **Frontend**: Flutter (Dart) - Cross-platform mobile application
- **Backend Services**: Firebase
- **Authentication**: Firebase Authentication
- **Database**: Cloud Firestore
- **Storage**: Firebase Storage
- **Build Platforms**: Android, iOS, Web, Windows, macOS, Linux

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     Flutter Blog Application                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────┐  │
│  │   Presentation   │  │   Business Logic │  │  Services    │  │
│  │   Layer (Screens)│  │   (State Mgmt)   │  │  (Firebase)  │  │
│  └──────────────────┘  └──────────────────┘  └──────────────┘  │
│           │                    │                     │          │
│           └────────────────────┴─────────────────────┘          │
│                                │                                │
└────────────────────────────────┼────────────────────────────────┘
                                 │
                        ┌────────▼───────────┐
                        │   Firebase Backend  │
                        └─────────┬──────────┘
                                 │
                    ┌────────────┼────────────┐
                    │            │            │
              ┌─────▼──┐  ┌──────▼─┐  ┌──────▼─────┐
              │  Auth   │  │Firestore├──┤  Storage   │
              └─────────┘  └─────────┘  └────────────┘
```

---

## Directory Structure

```
lib/
├── main.dart                          # Application entry point
├── screens/                           # UI screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   └── forgot_password_screen.dart
│   ├── blog/
│   │   ├── blog_list_screen.dart
│   │   ├── blog_detail_screen.dart
│   │   ├── create_blog_screen.dart
│   │   └── edit_blog_screen.dart
│   └── profile/
│       ├── profile_screen.dart
│       └── user_settings_screen.dart
├── widgets/                           # Reusable UI components
│   ├── blog_card_widget.dart
│   ├── comment_section_widget.dart
│   └── image_carousel_widget.dart
├── services/                          # Firebase service layer
│   ├── auth_service.dart             # Firebase Auth operations
│   ├── firestore_service.dart        # Firestore CRUD operations
│   ├── storage_service.dart          # Firebase Storage operations
│   └── notification_service.dart     # Push notifications (optional)
├── models/                            # Data models
│   ├── user_model.dart
│   ├── blog_post_model.dart
│   └── comment_model.dart
├── utils/                             # Helper functions
│   ├── constants.dart
│   ├── validators.dart
│   └── firebase_config.dart
└── theme/                             # App theming
    └── app_theme.dart
```

---

## Data Flow

### User Authentication Flow
```
1. User enters email/password → SignUp/Login Screen
2. Screen calls → AuthService.signUp() or AuthService.signIn()
3. AuthService sends request → Firebase Authentication API
4. Firebase returns → ID Token + User ID
5. Token stored → Secure local storage (via FlutterSecureStorage)
6. Navigation → Blog List Screen
```

### Blog Post Creation Flow
```
1. User fills form → Create Blog Screen
2. User uploads image (optional) → Image picker
3. Submit triggers → FirestoreService.createBlogPost()
4. Image uploaded first → StorageService.uploadImage()
5. Firebase Storage returns → Download URL
6. Blog post created → FirestoreService with image URL
7. Firestore returns → New document ID
8. Navigation → Blog Detail Screen (with new post)
```

### Blog Post Retrieval Flow
```
1. App loads → Blog List Screen
2. Screen calls → FirestoreService.getAllBlogPosts()
3. FirestoreService queries → Firestore collection
4. Firestore returns → List of documents (paginated)
5. UI rebuilds → Display blog cards
6. User taps post → Navigate to Blog Detail Screen
7. Call → FirestoreService.getBlogPostById()
8. Retrieve post details + comments → Display
```

### Comment Flow
```
1. User reads blog post → Blog Detail Screen
2. User submits comment → FirestoreService.addComment()
3. Comment stored → Firestore subcollection (posts/{postId}/comments)
4. Real-time listener → Updates comment list
5. UI rebuilds → Show new comment
```

---

## Firebase Setup and Integration

### Firebase Products Used

#### 1. **Firebase Authentication**
- **Purpose**: User sign-up, sign-in, and session management
- **Implementation**:
  - Email/Password authentication
  - ID tokens for API requests
  - Secure token storage locally
  
#### 2. **Cloud Firestore**
- **Purpose**: Store and sync blog posts, comments, and user data
- **Collections**:
  - `users/` - User profiles and metadata
  - `posts/` - Blog posts (title, content, author, timestamp, likes)
  - `posts/{postId}/comments` - Comments as subcollections
  
- **Security Rules** (Example):
  ```
  rules_version = '2';
  service cloud.firestore {
    match /databases/{database}/documents {
      match /posts/{document=**} {
        allow read: if request.auth != null;
        allow create: if request.auth != null;
        allow update, delete: if resource.data.author == request.auth.uid;
      }
    }
  }
  ```

#### 3. **Firebase Storage**
- **Purpose**: Store blog post images and user avatars
- **Structure**:
  - `blog_images/{postId}/` - Blog post images
  - `user_avatars/{userId}/` - User profile pictures

#### 4. **Firestore Real-Time Listeners**
- Comments and likes update in real-time
- StreamBuilder in Flutter listens to changes

---

## Key Service Implementations

### AuthService
```dart
// Authentication operations
- signUp(email, password) → Creates user account
- signIn(email, password) → Authenticates user
- signOut() → Logs out user
- resetPassword(email) → Sends reset email
- getCurrentUser() → Returns current authenticated user
- getIdToken() → Retrieves ID token for API calls
```

### FirestoreService
```dart
// Blog post operations
- createBlogPost(post) → Adds new post
- getBlogPosts() → Retrieves all posts (with pagination)
- getBlogPostById(postId) → Fetches single post
- updateBlogPost(postId, data) → Updates existing post
- deleteBlogPost(postId) → Removes post

// Comment operations
- addComment(postId, comment) → Adds comment to post
- getComments(postId) → Retrieves post comments
- deleteComment(postId, commentId) → Removes comment

// Real-time streams
- streamBlogPosts() → Watches posts collection
- streamComments(postId) → Watches comments subcollection
```

### StorageService
```dart
// File operations
- uploadImage(file, path) → Uploads image to Firebase Storage
- deleteImage(path) → Deletes image from storage
- getDownloadUrl(path) → Generates download URL
```

---

## Deployment and Maintenance

### Build and Deployment
- **Android**: `flutter build apk` → Upload to Google Play Store
- **iOS**: `flutter build ios` → Upload to Apple App Store
- **Web**: `flutter build web` → Deploy to Firebase Hosting
- **Other**: Windows, macOS, Linux builds via Flutter CLI

### Environment Configuration
- `lib/utils/firebase_config.dart` - Firebase credentials
- `.env` file (not committed) - Sensitive data
- `android/local.properties` - Local build settings

### New Contributor Onboarding
1. Clone repository
2. Install Flutter SDK
3. Create Firebase project
4. Add Firebase credentials to `firebase_config.dart`
5. Run `flutter pub get`
6. Run `flutter run` on target platform

### Documentation Update Checklist
- [ ] Update API documentation (Postman collection) when adding Firebase endpoints
- [ ] Update data models in this ARCHITECTURE.md if Firestore schema changes
- [ ] Document new screens in Directory Structure
- [ ] Add new service methods to respective service section
- [ ] Update data flow diagrams if workflows change
- [ ] Update version number in pubspec.yaml and API docs

---

## Versioning and Metadata

**Current Version**: 1.0.0  
**Base URL**: https://your-app.firebaseapp.com  
**Authentication**: Firebase ID Token  
**Last Updated**: 2025-01-16  

---

## API Documentation

API endpoints are documented in the Postman Collection: [docs/flutter_firebase_postman.json](flutter_firebase_postman.json)

Import this file into Postman to explore all Firebase API endpoints with:
- Request/response examples
- Authentication headers
- Query parameters
- Error handling
