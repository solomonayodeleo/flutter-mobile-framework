# Flutter Mobile UI Library

Reusable Flutter UI foundations for Fusion mobile projects.

## What this repo is for

This repository is intended to hold shared, reusable UI building blocks for Flutter apps, including:

- design tokens
- theme primitives
- reusable widgets
- input components
- layout helpers
- shared styling utilities

## Architecture

This library follows a clean, feature-friendly structure so it can be reused across multiple apps without becoming a dumping ground.

Recommended layers:

- `src/theme` for colors, text styles, and app-wide visual tokens
- `src/widgets` for reusable UI components
- `src/layout` for spacing, responsive helpers, and wrappers
- `src/extensions` for Flutter and Dart extensions
- `src/tokens` for brand-driven constants

## Usage

Import the library from your Flutter app and build screens with the shared widgets and theme primitives.

## Development

```bash
flutter pub get
flutter test
```

