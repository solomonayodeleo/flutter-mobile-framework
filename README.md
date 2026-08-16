# Flutter Mobile Framework

Reusable Flutter foundation for Fusion mobile projects, combining the starter framework and the shared UI library in one repo.

## What this repo is for

This repository holds both the application framework and the shared UI building blocks for Flutter apps, including:

- app bootstrap and project scaffolding
- clean architecture folder structure
- MVVM and Riverpod setup
- dependency injection wiring
- routing and theme setup
- design tokens
- reusable widgets
- input components
- layout helpers
- shared styling utilities

## Architecture

This repo follows a clean, feature-friendly structure so it can be reused across multiple apps without becoming a dumping ground.

Recommended layers:

- `src/theme` for colors, text styles, and app-wide visual tokens
- `src/widgets` for reusable UI components
- `src/layout` for spacing, responsive helpers, and wrappers
- `src/extensions` for Flutter and Dart extensions
- `src/tokens` for brand-driven constants
- `src/bootstrap` for app startup and environment wiring
- `src/features` for starter feature examples

## Usage

Use this repo as the starting point for new Flutter apps and as the source of shared widgets and theme primitives.

## Development

```bash
flutter pub get
flutter test
```
