/// App-wide constants
class AppConstants {
  AppConstants._();

  static const String appName = 'Rankify';
  static const String appTagline = 'Discover rankings powered by AI';

  /// Suggested queries for the home screen
  static const List<String> suggestedQueries = [
    'Top 10 books on entrepreneurship',
    'Best 5 cities to visit in Europe',
    'Top 10 movies of all time',
    'Best programming languages to learn in 2024',
    'Top 10 restaurants in New York',
    'Best 5 productivity apps',
    'Top 10 albums of the 2000s',
    'Best beaches in the world',
  ];

  /// Maximum history items to keep
  static const int maxHistoryItems = 20;

  /// Animation durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration staggerDelay = Duration(milliseconds: 50);
}
