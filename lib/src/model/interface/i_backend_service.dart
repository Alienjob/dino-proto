import 'package:dino_proto/src/model/failure/failure.dart';
import 'package:dino_proto/src/service/dto/login_request.dart';
import 'package:dino_proto/src/service/dto/register_request.dart';
import 'package:dino_proto/src/service/dto/token_response.dart';
import 'package:dino_proto/src/service/dto/user_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IBackendService {
  Future<Either<Failure, UserResponse>> me();
  Future<Either<Failure, TokenResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, TokenResponse>> register(
      RegisterRequest registerRequest);
}
