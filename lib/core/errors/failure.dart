import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// App failure types
@freezed
class Failure with _$Failure {
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.server({String? message}) = ServerFailure;
  const factory Failure.parsing({String? message}) = ParsingFailure;
  const factory Failure.rateLimit({String? message}) = RateLimitFailure;
  const factory Failure.unauthorized({String? message}) = UnauthorizedFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;

  const Failure._();

  String get displayMessage {
    return when(
      network: (msg) => msg ?? 'No internet connection. Please try again.',
      server: (msg) => msg ?? 'Server error. Please try again later.',
      parsing: (msg) => msg ?? 'Error processing response.',
      rateLimit: (msg) => msg ?? 'Too many requests. Please wait a moment.',
      unauthorized: (msg) => msg ?? 'Invalid API key. Check your configuration.',
      unknown: (msg) => msg ?? 'Something went wrong. Please try again.',
    );
  }
}

