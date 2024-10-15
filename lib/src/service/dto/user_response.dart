import 'package:dino_proto/src/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const UserResponse._();

  factory UserResponse({
    required String email,
    required String name,
    required String avatar,
  }) = _UserResponse;

  User toModel() => User(
        email: email,
        name: name,
        avatar: avatar,
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
