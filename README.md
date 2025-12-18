# Rankify

A Flutter application that generates visual rankings using the OpenAI ChatGPT API. Users can ask any ranking question and receive beautifully presented results with ratings, descriptions, and visual elements.

**Technical Test for Labhouse**

---

## Demo

https://github.com/user-attachments/assets/499f2211-a95b-4979-aeb2-0c4fb0dad7da

---

## Table of Contents

1. [Setup Instructions](#setup-instructions)
2. [Features](#features)
3. [Architecture](#architecture)
4. [Technical Decisions](#technical-decisions)
5. [Future Improvements](#future-improvements)
6. [Project Summary](#project-summary)

---

## Setup Instructions

### Prerequisites

- Flutter SDK 3.7.0 or higher
- Dart 3.0.0 or higher
- OpenAI API key ([Get one here](https://platform.openai.com/api-keys))

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/rankify.git
   cd rankify
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Add your OpenAI API key

   Open `lib/core/constants/api_constants.dart` and replace the placeholder:
   ```dart
   static const String openAiApiKey = 'YOUR_OPENAI_API_KEY_HERE';
   ```

4. Generate Freezed models
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Run the application
   ```bash
   flutter run
   ```

### Platforms

- Android: Fully tested
- iOS: Fully tested

---

## Features

### Core Features

- **AI-Powered Rankings**: Integration with OpenAI GPT-4o-mini for generating accurate, contextual rankings
- **Visual Ranking Cards**: Each item displays rank, name, subtitle, description, and star rating
- **Detail View**: Bottom sheet with expanded information for each ranking item
- **Search History**: Persistent storage with dedicated History tab and pull-to-refresh
- **Input Validation**: API key check with user-friendly alert dialog
- **Smart Caching**: In-memory cache prevents redundant API calls for repeated queries

### UI/UX Features

- **Dark/Light Mode**: Toggle between themes with automatic system UI adaptation
- **Staggered Animations**: Smooth entry animations for ranking items using flutter_animate
- **Confetti Celebration**: Animated confetti on new ranking generation (not on cached results)
- **Shimmer Loading**: Skeleton loading states with animated AI indicator
- **Custom Typography**: Outfit and Plus Jakarta Sans font pairing via Google Fonts
- **Responsive Layout**: Adapts to different screen sizes
- **Tab Navigation**: Organized Search and History tabs

### Extra Features

- **Multi-language Support**: 5 languages (English, Spanish, French, German, Portuguese) with flag selector
- **Share Rankings**: Export ranking as formatted text to other apps
- **Splash Screen**: Branded launch screen with Labhouse logo
- **Custom App Icon**: Branded launcher icon for both platforms

---

## Architecture

The project follows Clean Architecture principles:

```
lib/
├── core/                    # Shared resources
│   ├── constants/           # API and app constants
│   ├── errors/              # Failure types (Freezed)
│   ├── theme/               # Colors, typography, theme data
│   └── widgets/             # Reusable UI components
│
├── data/                    # Data layer
│   ├── datasources/         # OpenAI API client (Dio)
│   └── repositories_impl/   # Repository implementations
│
├── domain/                  # Business logic
│   ├── entities/            # Data models (Freezed + JSON)
│   └── repositories/        # Repository interfaces
│
├── presentation/            # UI layer
│   ├── providers/           # Riverpod state management
│   ├── screens/             # App screens and widgets
│   └── widgets/             # Presentation-specific widgets
│
├── routes/                  # GoRouter navigation
└── main.dart
```

### Tech Stack

| Library | Purpose |
|---------|---------|
| flutter_riverpod | State management |
| freezed | Immutable data classes and unions |
| dio | HTTP client for API calls |
| go_router | Declarative navigation |
| flutter_animate | Smooth animations |
| cached_network_image | Image loading and caching |
| google_fonts | Custom typography |
| shared_preferences | Local storage for history |
| shimmer | Loading skeleton effects |
| confetti | Celebration animations |
| share_plus | Share functionality |

---

## Technical Decisions

### State Management
Chose Riverpod over alternatives (Bloc, Provider) for its compile-time safety, testability, and clean separation of concerns. Used `StateNotifierProvider` for explicit control over async state transitions.

### Error Handling
Implemented a `Failure` sealed class with Freezed to handle different error types (network, parsing, rate limit, unauthorized) with user-friendly messages.

### API Integration
Structured JSON output from ChatGPT ensures consistent parsing. The prompt engineering guarantees the response format matches the Freezed model structure.

### Caching Strategy
In-memory cache in the repository layer prevents redundant API calls. Returns a tuple `(Ranking, isFromCache)` to differentiate fresh vs cached results for UI feedback (confetti only on fresh).

### Theming
Theme-aware color system using BuildContext extensions for seamless dark/light mode switching. All UI components adapt automatically.

### Localization
Lightweight custom L10n implementation without external packages, supporting 5 languages with instant switching via Riverpod state.

---

## Future Improvements

Given more time, these enhancements would add value:

1. **Real Image Search**: Integrate Unsplash or Pexels API for contextually relevant images
2. **Offline Support**: Persist rankings to local database (Hive/SQLite) for offline viewing
3. **Voice Input**: Speech-to-text for hands-free query input
4. **Category Themes**: Visual themes that adapt based on ranking category
5. **Unit Tests**: Comprehensive test coverage for providers, repositories, and widgets
6. **Favorites**: Allow users to save and organize favorite rankings

---

## Project Summary

### Completed Requirements

| Requirement | Status |
|-------------|--------|
| OpenAI ChatGPT API integration | Done |
| API key not in repository (constant with placeholder) | Done |
| Clear README instructions | Done |
| iOS and Android support | Done |
| Visual ranking display (images, stars, info) | Done |

### Extra Features Implemented

| Feature | Description |
|---------|-------------|
| Dark/Light Mode | Theme toggle with full UI adaptation |
| Multi-language | 5 languages with flag selector |
| Share | Export rankings as text |
| Confetti | Celebration on new rankings |
| History Tab | Pull-to-refresh search history |
| Smart Cache | Avoids redundant API calls |

### Development Time

Approximately 5-6 hours

### Platform Tested

Android and iOS

---

## Repository Structure

Key files for review:

- `lib/core/constants/api_constants.dart` - API key location
- `lib/data/datasources/remote/openai_api.dart` - ChatGPT integration
- `lib/presentation/providers/ranking_provider.dart` - State management
- `lib/presentation/screens/` - UI implementation
- `lib/core/theme/app_colors.dart` - Theme system with dark/light support

---

Built with Flutter for the Labhouse technical test.
