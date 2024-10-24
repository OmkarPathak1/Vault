# Password Manager App

## Overview

This Password Manager app is a Flutter application designed to securely store and manage user passwords. It features a user-friendly interface for generating, saving, and retrieving passwords. The app uses Flutter Secure Storage for secure data storage and incorporates the Provider package for state management.

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── password_model.dart
├── providers/
│   └── password_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── master_password_screen.dart
│   ├── password_detail_screen.dart
│   ├── password_generation_screen.dart
│   └── password_storage_screen.dart
├── utils/
│   └── theme.dart
├── widgets/
│   ├── password_card.dart
│   ├── password_detail_view.dart
│   └── password_form.dart
└── analysis_options.yaml
```

### Main Entry Point

- **`main.dart`**: This is the entry point of the application. It initializes the app and sets up the necessary providers and theme configurations.

### Models

- **`models/password_model.dart`**: This file defines the `Password` model, which represents the password entity with properties such as name, username, password, and URL. It also includes methods for serialization and deserialization.

### Providers

- **`providers/password_provider.dart`**: This file contains the `PasswordProvider` class, which manages the state of the passwords. It includes methods to add, update, and delete passwords, as well as to load passwords from secure storage.

### Screens

- **`screens/home_screen.dart`**: The main home screen of the app that provides an overview and navigation to other sections.
- **`screens/login_screen.dart`**: The login screen where users can enter their master password to access the app.
- **`screens/master_password_screen.dart`**: The screen for setting or updating the master password.
- **`screens/password_detail_screen.dart`**: Displays detailed information about a specific password and allows editing.
- **`screens/password_generation_screen.dart`**: A screen to generate new passwords with customizable options.
- **`screens/password_storage_screen.dart`**: Shows a list of stored passwords and provides options to add new passwords.

### Utilities

- **`utils/theme.dart`**: Contains the theme configuration for the application, defining colors, fonts, and other styling details.

### Widgets

- **`widgets/password_card.dart`**: A reusable widget to display password information in a card format.
- **`widgets/password_detail_view.dart`**: A widget to display detailed view of a password, including editing options.
- **`widgets/password_form.dart`**: A form widget used in various screens for entering or editing password details.

### Analysis Configuration

- **`analysis_options.yaml`**: Configures the Dart analyzer with custom lint rules, error severity settings, and other analysis options to maintain code quality.

## Setup Instructions

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/password_manager.git
   cd password_manager
   ```

2. **Install dependencies**:
   ```sh
   flutter pub get
   ```

3. **Run the app**:
   ```sh
   flutter run
   ```

## Usage

### Generating Passwords

1. Navigate to the Password Generation screen.
2. Customize your password options (symbols, numbers, uppercase, lowercase).
3. Generate and save the password.

### Viewing and Editing Passwords

1. Navigate to the Password Storage screen.
2. Tap on a password card to view details.
3. Edit the details and save the changes.

### Managing Master Password

1. Set a master password when launching the app for the first time.
2. Change the master password from the settings screen if needed.

