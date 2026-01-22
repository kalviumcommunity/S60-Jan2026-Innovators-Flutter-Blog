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