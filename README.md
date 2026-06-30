# Anglers Note

A fishing log app built with Flutter. Track fishing trips, record catches (species, size, etc.), and manage your tackle, all in one place.

[日本語版 README](README.ja.md)

## Features

- Fishing trip logs (date, location, notes — list and detail views)
- Catch records tied to each trip (species, size, photos)
- Tackle management (register and edit gear)
- Home dashboard showing trip count, catch count, and species ranking
- Location and weather lookup for each trip

## Tech Stack

- Flutter / Dart
- State management: Riverpod (`flutter_riverpod` / `riverpod_annotation`)
- Routing: `go_router`
- Local database: `drift` (SQLite)
- Location: `geolocator`
- Image picking: `image_picker`

## Project Structure

```
lib/src/
  core/        # database, services, shared widgets
  features/
    fishing_log/  # trip and catch records
    tackle/        # tackle management
    settings/      # settings
  routing/     # navigation/routes
```

## Setup & Run

```bash
flutter pub get
flutter run
```

If code generation is needed (drift/freezed/riverpod_annotation `.g.dart` files):

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Supported Platforms

iOS / Android / macOS / Web / Linux / Windows (standard Flutter multi-platform setup)
