# Flutter Blog App – UI & State Management Demo

## 📌 Project Overview
This Flutter application demonstrates core Flutter concepts through a single, well-structured app.  
It includes authentication screens and multiple feature demos to help understand UI building, navigation, and state management in Flutter.

The app is designed using **Material UI**, clean navigation, and modular screen architecture.

---

## 🚀 Features Implemented

### 🔐 Authentication
- Login Screen with email & password fields
- Signup Screen for new users
- Navigation to Dashboard after successful login

---

### 🧩 Flutter Concept Demos

#### 1️⃣ Stateless vs Stateful Widgets
- Demonstrates the difference between static UI (`StatelessWidget`) and dynamic UI (`StatefulWidget`)
- Shows how UI updates based on state changes

#### 2️⃣ State Management using `setState()`
- Simple counter application
- Increment and decrement buttons
- Background color changes when counter reaches a threshold
- Demonstrates Flutter’s reactive UI model

```dart
setState(() {
  _counter++;
});
```

### 🔹 Conditional UI Update

The background color of the screen changes dynamically:

White → Counter less than 5

Green → Counter is 5 or more

This demonstrates how Flutter reacts to state changes efficiently.

## 📸 Screenshots

Initial state
![Initial Counter State](assets/screenshots/counter_initial.png)

Updated state
![Initial Counter State](assets/screenshots/counter_initial.png)

## 💡 Key Learnings

#### StatelessWidget

UI does not change after build

Used for static content

#### StatefulWidget

UI updates dynamically

Maintains internal state

#### setState()

Notifies Flutter to rebuild only the affected widget tree

Essential for Flutter’s reactive UI model
---

## 📱 Responsive Design Implementation

### 3️⃣ MediaQuery and LayoutBuilder for Adaptive UI

This app includes comprehensive responsive design patterns to ensure the UI looks great on **phones, tablets, and desktops**.

#### What's Implemented

**MediaQuery Usage:**
- Dynamic screen dimension access (width, height)
- Device type detection (mobile/tablet/desktop)
- Adaptive padding, font sizes, and spacing
- Orientation detection (portrait/landscape)
- Safe area handling (notches, status bars)

**LayoutBuilder Usage:**
- Conditional layouts based on available constraints
- Different UI structures for different screen sizes
- Grid layouts with dynamic column counts
- Responsive navigation patterns

#### Key Features

✅ **Three-Breakpoint System:**
- Mobile: < 600px (phones)
- Tablet: 600-1200px (tablets)
- Desktop: ≥ 1200px (large tablets, laptops)

✅ **Responsive Components:**
- Adaptive typography (font sizes scale with screen)
- Flexible layouts (Column on mobile, Row on tablet)
- Dynamic grid columns (2 on mobile, 3 on tablet, 4 on desktop)
- Responsive spacing and padding

✅ **Examples Included:**
- Responsive Demo Screen: `screens/responsive_design_demo.dart`
- Blog Card Component: `widgets/responsive_blog_card.dart`
- Utility Functions: `utils/responsive_utils.dart`

#### Code Examples

**Example 1: Using MediaQuery for Adaptive UI**

```dart
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 600;

Container(
  width: screenWidth * 0.8,  // 80% of screen width
  padding: EdgeInsets.all(isMobile ? 12 : 24),
  child: Text('Responsive Container'),
)
```

**Example 2: Using LayoutBuilder for Conditional Layouts**

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return Column(         // Mobile: vertical layout
        children: [...],
      );
    } else {
      return Row(           // Tablet+: horizontal layout
        children: [...],
      );
    }
  },
)
```

**Example 3: Responsive Grid**

```dart
GridView.count(
  crossAxisCount: isMobile ? 2 : 4,  // 2 cols on mobile, 4 on desktop
  crossAxisSpacing: 16,
  mainAxisSpacing: 16,
  children: [...],
)
```

#### Testing Responsive Layouts

To test the responsive design on different device sizes:

```bash
# Test on Pixel 4 (mobile)
flutter run -d "Pixel 4"

# Test on Nexus 9 (tablet)
flutter run -d "Nexus 9"

# Test orientation changes
# Rotate emulator: Ctrl+← or Cmd+←
```

**Devices to Test:**
- Pixel 4 (412×869 px) – Modern phone
- Pixel 5 (412×914 px) – Phone with notch
- Nexus 9 (600×960 px) – Tablet
- iPad Pro (1024×1366 px) – Large tablet

#### When Layout Changes Apply

| Screen Size | Device Type | Layout | Columns |
|-----------|-----------|---------|---------|
| < 600px | Mobile Phone | Single column, vertical stacks | 2 |
| 600-1200px | Tablet | Two-column, side-by-side | 3 |
| ≥ 1200px | Desktop/Large Tablet | Multi-column grid | 4 |

#### Best Practices Applied

✅ Used relative sizing (%, proportions) instead of fixed pixels  
✅ Adaptive padding/margins based on screen size  
✅ Text sizes that scale with the device  
✅ Touch-friendly button sizes (minimum 48×48dp)  
✅ Safe area handling for notches and status bars  
✅ Orientation-aware layouts  
✅ Reusable responsive utilities for consistency  

#### Learn More

For comprehensive documentation on responsive design techniques, patterns, and best practices, see [RESPONSIVE_DESIGN.md](RESPONSIVE_DESIGN.md).

---

## 🎨 Managing Images, Icons, and Local Assets

### 4️⃣ Assets in Flutter

This app demonstrates how to properly add, register, and display images, icons, and other local assets in a Flutter application.

#### Asset Types Supported

- **Images**: JPEG, PNG, SVG, GIF, WebP
- **Icons**: Built-in Material Icons, Cupertino Icons, custom icon packs
- **Fonts**: Custom fonts for typography
- **Configuration Files**: JSON files, animation data, etc.

#### Project Asset Structure

```
blogapp/
├── assets/
│   ├── images/
│   │   ├── logo.svg
│   │   ├── banner.svg
│   │   └── background.svg
│   └── icons/
│       ├── star.svg
│       └── profile.svg
└── lib/
    ├── screens/
    │   └── asset_demo_screen.dart
    └── ...
```

#### Asset Registration in pubspec.yaml

Assets must be registered in the `pubspec.yaml` file under the `flutter:` section:

```yaml
flutter:
  uses-material-design: true
  
  # Assets directory registration
  assets:
    - assets/images/
    - assets/icons/
```

**Important**: Always use 2-space indentation in YAML files. Incorrect spacing will cause build errors.

#### Displaying Local Images

**Using Image.asset():**

```dart
Image.asset(
  'assets/images/logo.svg',
  width: 150,
  height: 150,
  fit: BoxFit.cover,
)
```

**Image Fit Options:**
- `BoxFit.cover` – Fills space, may crop image
- `BoxFit.contain` – Fits entire image, may have empty space
- `BoxFit.fill` – Stretches to fill space
- `BoxFit.fitWidth` – Fits width, may crop height
- `BoxFit.fitHeight` – Fits height, may crop width

**Using Images in Container Decorations:**

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.svg'),
      fit: BoxFit.cover,
    ),
  ),
  child: Center(
    child: Text(
      'Welcome to Flutter!',
      style: TextStyle(color: Colors.white, fontSize: 22),
    ),
  ),
)
```

#### Using Built-in Icons

**Material Design Icons:**

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.star, color: Colors.amber, size: 32),
    SizedBox(width: 10),
    Text('Starred', style: TextStyle(fontSize: 18)),
  ],
)
```

**Popular Material Icons:**
- `Icons.home` – Home icon
- `Icons.favorite` – Heart icon
- `Icons.star` – Star icon
- `Icons.settings` – Settings icon
- `Icons.person` – Person/profile icon
- `Icons.search` – Search icon

**Cupertino (iOS-style) Icons:**

```dart
import 'package:flutter/cupertino.dart';

Icon(CupertinoIcons.heart, color: Colors.red, size: 32)
```

**Common Cupertino Icons:**
- `CupertinoIcons.heart` – Heart
- `CupertinoIcons.star` – Star
- `CupertinoIcons.person` – Person
- `CupertinoIcons.settings` – Settings

#### Combining Assets and Icons

```dart
class AssetShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Local image asset
        Image.asset('assets/images/logo.svg', width: 120),
        
        SizedBox(height: 20),
        
        Text('Powered by Flutter', style: TextStyle(fontSize: 20)),
        
        SizedBox(height: 20),
        
        // Material design icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, color: Colors.blue, size: 36),
            SizedBox(width: 10),
            Icon(Icons.android, color: Colors.green, size: 36),
            SizedBox(width: 10),
            Icon(Icons.apple, color: Colors.grey, size: 36),
          ],
        ),
      ],
    );
  }
}
```

#### Common Asset Errors and Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| Image not displaying | Asset not registered in pubspec.yaml | Add asset path under `flutter: assets:` |
| "Missing asset" exception | Asset file path doesn't exist | Verify file path and ensure file is saved |
| YAML parse error | Incorrect indentation | Use exactly 2 spaces per indentation level |
| Hot reload doesn't show new assets | Cache not updated | Run `flutter pub get` after adding new images |
| Blurry images | Image too small for display size | Use appropriate resolution assets |

#### Asset Resolution Best Practices

✅ **Organize assets by type** – Separate images, icons, fonts into folders  
✅ **Use consistent naming** – Use lowercase with underscores (e.g., `user_profile.png`)  
✅ **Optimize file sizes** – Compress images before adding to project  
✅ **Handle different resolutions** – Create 1x, 2x, 3x variants for images  
✅ **Test on multiple devices** – Verify assets look good on different screen sizes  
✅ **Run pub get** – Always run `flutter pub get` after modifying pubspec.yaml  

#### Asset Demo Screen

The app includes a comprehensive `AssetDemoScreen` that showcases:

- Local image usage with `Image.asset()`
- Material Design icons
- Cupertino (iOS-style) icons
- Local asset icons
- Combined layouts mixing images, icons, and text

View the implementation in [lib/screens/asset_demo_screen.dart](lib/screens/asset_demo_screen.dart)

---