import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supported locales
enum AppLocale {
  en('🇺🇸', 'English'),
  es('🇪🇸', 'Español'),
  fr('🇫🇷', 'Français'),
  de('🇩🇪', 'Deutsch'),
  pt('🇧🇷', 'Português');

  const AppLocale(this.flag, this.name);
  final String flag;
  final String name;
}

/// Locale provider
final localeProvider = StateProvider<AppLocale>((ref) => AppLocale.en);

/// Translations
class L10n {
  static String t(AppLocale locale, String key) => _translations[locale]![key]!;

  static const Map<AppLocale, Map<String, String>> _translations = {
    AppLocale.en: {
      'appName': 'Rankify',
      'tagline': 'Discover rankings powered by AI',
      'whatToRank': 'What would you\nlike to rank?',
      'placeholder': 'e.g., "Top 10 books on entrepreneurship"',
      'generate': 'Generate Ranking',
      'tryAsking': 'Try asking about',
      'recentSearches': 'Recent searches',
      'clearHistory': 'Clear',
      'results': 'Results',
      'generating': 'Rankify is generating your ranking...',
      'wait': 'This may take a few seconds',
      'noRanking': 'No ranking generated',
      'about': 'About',
    },
    AppLocale.es: {
      'appName': 'Rankify',
      'tagline': 'Descubre rankings con IA',
      'whatToRank': '¿Qué te gustaría\nclasificar?',
      'placeholder': 'Ej: "Los 10 mejores libros de negocios"',
      'generate': 'Generar Ranking',
      'tryAsking': 'Prueba preguntar sobre',
      'recentSearches': 'Búsquedas recientes',
      'clearHistory': 'Limpiar',
      'results': 'Resultados',
      'generating': 'Rankify está generando tu ranking...',
      'wait': 'Esto puede tardar unos segundos',
      'noRanking': 'No se generó ranking',
      'about': 'Acerca de',
    },
    AppLocale.fr: {
      'appName': 'Rankify',
      'tagline': 'Découvrez les classements par IA',
      'whatToRank': 'Que voulez-vous\nclasser?',
      'placeholder': 'Ex: "Top 10 livres business"',
      'generate': 'Générer le Classement',
      'tryAsking': 'Essayez de demander',
      'recentSearches': 'Recherches récentes',
      'clearHistory': 'Effacer',
      'results': 'Résultats',
      'generating': 'Rankify génère votre classement...',
      'wait': 'Cela peut prendre quelques secondes',
      'noRanking': 'Aucun classement généré',
      'about': 'À propos',
    },
    AppLocale.de: {
      'appName': 'Rankify',
      'tagline': 'Entdecke KI-Rankings',
      'whatToRank': 'Was möchten Sie\nbewerten?',
      'placeholder': 'z.B. "Top 10 Business-Bücher"',
      'generate': 'Ranking Erstellen',
      'tryAsking': 'Versuche zu fragen',
      'recentSearches': 'Letzte Suchen',
      'clearHistory': 'Löschen',
      'results': 'Ergebnisse',
      'generating': 'Rankify erstellt Ihr Ranking...',
      'wait': 'Dies kann einige Sekunden dauern',
      'noRanking': 'Kein Ranking erstellt',
      'about': 'Über',
    },
    AppLocale.pt: {
      'appName': 'Rankify',
      'tagline': 'Descubra rankings com IA',
      'whatToRank': 'O que você gostaria\nde classificar?',
      'placeholder': 'Ex: "Top 10 livros de negócios"',
      'generate': 'Gerar Ranking',
      'tryAsking': 'Tente perguntar sobre',
      'recentSearches': 'Buscas recentes',
      'clearHistory': 'Limpar',
      'results': 'Resultados',
      'generating': 'Rankify está gerando seu ranking...',
      'wait': 'Isso pode levar alguns segundos',
      'noRanking': 'Nenhum ranking gerado',
      'about': 'Sobre',
    },
  };
}

