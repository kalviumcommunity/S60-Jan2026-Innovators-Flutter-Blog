# Exploring Flutter Project Folder Structure and Understanding File Roles

## Introduction
This project is a basic Flutter counter application created using the default Flutter template.
This document explains the purpose of the main folders and files generated in a Flutter project.

## Counter App

## Folder and File Explanation

- lib/

  This folder contains all Dart source code of the application.
  The main.dart file is the entry point of the app and includes the UI and logic for the counter.

- android/

  Contains Android-specific configuration files and build settings.
  These files are used when running the app on Android devices.

- ios/

  Contains iOS-specific configuration and build files.
  Used for building and running the app on iOS devices.

- assets/

  This folder is used to store images, fonts, or other static resources.
  It is optional and not used in the basic counter app.

- test/

  Contains test files used to verify UI and application logic.
  The default widget_test.dart file is included.

- pubspec.yaml

  The main configuration file of the Flutter project.
  It manages dependencies, assets, and project settings.

## Supporting Files

- .gitignore  
  Specifies which files and folders Git should ignore, such as build files,
  cache files, and environment-specific configurations.

- README.md  
  Provides documentation about the project, including setup instructions,
  folder structure summary, and developer notes.

- build/  
  An auto-generated folder that contains compiled output of the Flutter app.
  This folder should not be modified manually.

- .dart_tool/ and .idea/  
  These folders store Dart SDK and IDE-specific configuration files.
  They are automatically generated and help the development environment function correctly.

## Folder Structure Screenshot

![Folder Structure](FolderStructure.png)

## Reflection
Understanding the Flutter project structure helps developers maintain clean code,
scale applications easily, and work efficiently in a team environment.