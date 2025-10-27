import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Movie> _popularMovies = [];
  List<Movie> _searchResults = [];
  List<Movie> _favoriteMovies = [];
  bool _isLoading = false;
  String _error = '';
  bool _isDarkMode = false;

  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get searchResults => _searchResults;
  List<Movie> get favoriteMovies => _favoriteMovies;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get isDarkMode => _isDarkMode;

  MovieProvider() {
    loadThemePreference();
    loadFavorites();
  }

  Future<void> fetchPopularMovies() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _popularMovies = await _apiService.fetchPopularMovies();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _searchResults = await _apiService.searchMovies(query);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final movie = await _apiService.fetchMovieDetails(movieId);
      // Update the movie in popular movies if it exists
      final index = _popularMovies.indexWhere((m) => m.id == movieId);
      if (index != -1) {
        _popularMovies[index] = movie;
      }
      return movie;
    } catch (e) {
      _error = e.toString();
      throw e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Movie movie) {
    if (_favoriteMovies.any((m) => m.id == movie.id)) {
      _favoriteMovies.removeWhere((m) => m.id == movie.id);
    } else {
      _favoriteMovies.add(movie);
    }
    saveFavorites();
    notifyListeners();
  }

  bool isFavorite(int movieId) {
    return _favoriteMovies.any((movie) => movie.id == movieId);
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    saveThemePreference();
    notifyListeners();
  }

  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> saveThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    _favoriteMovies = favoritesJson
        .map((json) => Movie.fromJson(jsonDecode(json)))
        .toList();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = _favoriteMovies
        .map((movie) => jsonEncode(movie.toJson()))
        .toList();
    await prefs.setStringList('favorites', favoritesJson);
  }
}
