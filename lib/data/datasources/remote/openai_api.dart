import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/entities/ranking.dart';
import '../../../domain/entities/ranking_item.dart';

/// OpenAI API client for generating rankings
class OpenAiApi {
  OpenAiApi({Dio? dio}) : _dio = dio ?? _createDio();

  final Dio _dio;

  static Dio _createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.openAiBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ApiConstants.openAiApiKey}',
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    ));
    return dio;
  }

  /// Generate ranking from user query
  Future<Ranking> generateRanking(String query) async {
    try {
      final response = await _dio.post(
        ApiConstants.chatCompletionsEndpoint,
        data: {
          'model': ApiConstants.model,
          'messages': [
            {'role': 'system', 'content': ApiConstants.systemPrompt},
            {'role': 'user', 'content': query},
          ],
          'temperature': 0.7,
          'max_tokens': 2000,
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      log('OpenAI Response: $content');

      // Parse the JSON response
      final jsonData = _extractJson(content);
      final parsedJson = json.decode(jsonData) as Map<String, dynamic>;

      // Build ranking from response
      final items = (parsedJson['items'] as List)
          .map((item) => RankingItem.fromJson(item as Map<String, dynamic>))
          .toList();

      return Ranking(
        title: parsedJson['title'] as String? ?? query,
        items: items,
        query: query,
        createdAt: DateTime.now(),
      );
    } on DioException catch (e) {
      log('DioException: ${e.message}');
      throw _mapDioError(e);
    } catch (e) {
      log('Error generating ranking: $e');
      throw const Failure.parsing(message: 'Failed to parse ranking response');
    }
  }

  /// Extract JSON from response (handles markdown code blocks)
  String _extractJson(String content) {
    // Remove markdown code blocks if present
    var cleaned = content.trim();
    if (cleaned.startsWith('```json')) {
      cleaned = cleaned.substring(7);
    } else if (cleaned.startsWith('```')) {
      cleaned = cleaned.substring(3);
    }
    if (cleaned.endsWith('```')) {
      cleaned = cleaned.substring(0, cleaned.length - 3);
    }
    return cleaned.trim();
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const Failure.network();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return const Failure.unauthorized();
        } else if (statusCode == 429) {
          return const Failure.rateLimit();
        }
        return Failure.server(message: 'Server error: $statusCode');
      default:
        return const Failure.unknown();
    }
  }
}

