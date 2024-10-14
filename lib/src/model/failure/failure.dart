import 'package:dino_proto/src/model/validation_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  factory Failure.unexpected(String message) = _Unexpected;
  factory Failure.unauthorized() = _Unauthorized;
  factory Failure.validationFailure({required List<ValidationError> errors}) =
      _ValidadtionFailure;

  String get message {
    return map(
      unexpected: (unexpected) => unexpected.message,
      unauthorized: (_) => 'Unauthorized',
      validationFailure: (validationFailure) => validationFailure.errors
          .map((ValidationError e) => [e.code, e.description])
          .join('\n'),
    );
  }
}
