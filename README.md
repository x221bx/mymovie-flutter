# Movie App 🎬

A complete Flutter application for discovering and managing movies using The Movie Database (TMDB) API.

## 📱 Features

- **Movie Discovery**: Browse popular movies from TMDB
- **Real-time Search**: Search movies instantly
- **Detailed Views**: Comprehensive movie information
- **Favorites Management**: Add/remove movies to favorites
- **Theme Switching**: Dark/Light mode with persistence
- **User Authentication**: Login/Signup with validation
- **Guest Access**: Continue without account
- **Responsive Design**: Works on all screen sizes

## 🛠️ Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Provider** - State management solution
- **TMDB API** - Movie database integration
- **Shared Preferences** - Local data persistence
- **Material Design** - Modern UI components

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.9.2+)
- TMDB API Key (get from [TMDB](https://www.themoviedb.org/settings/api))

### Installation

1. **Clone & Setup**
   ```bash
   git clone <your-repo-url>
   cd mymovie
   flutter pub get
   ```

2. **Configure API**
   - Open `lib/services/api_service.dart`
   - Replace `apiKey` with your TMDB API key

3. **Run**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── movie.dart           # Movie data model
├── providers/
│   └── movie_provider.dart  # State management
├── services/
│   └── api_service.dart     # TMDB API calls
├── screens/
│   ├── home_screen.dart     # Welcome screen
│   ├── login_screen.dart    # User login
│   ├── signup_screen.dart   # User registration
│   ├── movie_list_screen.dart # Movies grid
│   ├── movie_details_screen.dart # Movie details
│   └── favorites_screen.dart # Favorite movies
└── screen/
    └── SplashScreen.dart    # Splash screen
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1
  provider: ^6.1.2
  shared_preferences: ^2.2.3
  cached_network_image: ^3.3.1
  intl: ^0.19.0
```

## 🎥 Demo Video

[Watch the demo video here](https://your-video-link.com)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

---

**Built with ❤️ using Flutter**
