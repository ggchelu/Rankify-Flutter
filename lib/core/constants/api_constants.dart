/// API Constants for OpenAI integration
class ApiConstants {
  ApiConstants._();

  /// Base URL for OpenAI API
  static const String openAiBaseUrl = 'https://api.openai.com/v1';

  /// Chat completions endpoint
  static const String chatCompletionsEndpoint = '/chat/completions';

  /// OpenAI Model to use
  static const String model = 'gpt-4o-mini';

  // ============================================================
  // TODO: Add your OpenAI API key here
  // Get your API key from: https://platform.openai.com/api-keys
  // ============================================================
  static const String openAiApiKey = 'YOUR_OPENAI_API_KEY_HERE';

  /// Check if API key is configured
  static bool get isApiKeyConfigured =>
      openAiApiKey != 'YOUR_OPENAI_API_KEY_HERE' && openAiApiKey.isNotEmpty;

  /// System prompt for ranking generation
  static const String systemPrompt = '''
You are a ranking expert. When asked for a ranking, you MUST return ONLY valid JSON in this exact format, no additional text:
{
  "title": "string - the ranking title",
  "items": [
    {
      "rank": 1,
      "name": "string - item name",
      "subtitle": "string - author, location, year, etc.",
      "description": "string - 1-2 sentences description",
      "rating": 4.5,
      "imageSearchTerm": "string - search term for finding an image"
    }
  ]
}

Rules:
- Return ONLY the JSON, no markdown, no explanations
- Always include exactly the number of items requested (default 10 if not specified)
- Rating should be between 1.0 and 5.0
- imageSearchTerm should be specific enough to find a relevant image
- Be accurate, informative, and helpful
''';
}
