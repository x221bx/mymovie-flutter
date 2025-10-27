# Movie App

A Flutter application for discovering movies using TMDB API with modern UI and state management.

## Features

- Browse popular movies
- Search movies in real-time
- View detailed movie information
- Add/remove movies to favorites
- Dark/Light theme switching
- User authentication (Login/Signup)
- Guest access option

## Tech Stack

- **Flutter** - Cross-platform framework
- **Provider** - State management
- **TMDB API** - Movie database
- **Shared Preferences** - Local storage
- **Material Design** - UI components

## Getting Started

### Prerequisites
- Flutter SDK (3.9.2+)
- TMDB API Key

### Installation

1. Clone the repo
   ```bash
   git clone <repository-url>
   cd mymovie
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Add TMDB API Key
   - Open `lib/services/api_service.dart`
   - Replace `apiKey` with your TMDB key

4. Run the app
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart
├── models/movie.dart
├── providers/movie_provider.dart
├── services/api_service.dart
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── movie_list_screen.dart
│   ├── movie_details_screen.dart
│   └── favorites_screen.dart
└── screen/SplashScreen.dart
```

## Dependencies

- http: ^1.2.1
- provider: ^6.1.2
- shared_preferences: ^2.2.3
- cached_network_image: ^3.3.1
- intl: ^0.19.0
