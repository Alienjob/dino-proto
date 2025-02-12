import 'package:dino_proto/src/model/failure/failure.dart';
import 'package:dino_proto/src/model/interface/i_backend_service.dart';
import 'package:dino_proto/src/model/validation_error.dart';
import 'package:dino_proto/src/service/api/api_client.dart';
import 'package:dino_proto/src/service/dto/login_request.dart';
import 'package:dino_proto/src/service/dto/register_request.dart';
import 'package:dino_proto/src/service/dto/token_response.dart';
import 'package:dino_proto/src/service/dto/user_response.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IBackendService)
class BackendService implements IBackendService {
  final ApiClient _apiClient;

  BackendService(this._apiClient);

  @override
  Future<Either<Failure, UserResponse>> me() async {
    try {
      final response = await _apiClient.me();
      return Right(response);
    } on DioException catch (e) {
      final errors = e.response?.data['errors'];
      if (errors != null) {
        return Left(Failure.validationFailure(
          errors: List<ValidationError>.from(errors.map((e) {
            return ValidationError.fromJson(e);
          })),
        ));
      }
      return Left(Failure.unexpected(e.toString()));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenResponse>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _apiClient.login(
        loginRequest.toJson(),
      );
      return Right(response);
    } on DioException catch (e) {
      final errors = e.response?.data['errors'];
      if (errors != null) {
        return Left(Failure.validationFailure(
          errors: List<ValidationError>.from(errors.map((e) {
            return ValidationError.fromJson(e);
          })),
        ));
      }
      return Left(Failure.unexpected(e.toString()));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenResponse>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _apiClient.register(
        registerRequest.toJson(),
      );
      return Right(response);
    } on DioException catch (e) {
      final errors = e.response?.data['errors'];
      if (errors != null) {
        return Left(Failure.validationFailure(
          errors: List<ValidationError>.from(errors.map((e) {
            return ValidationError.fromJson(e);
          })),
        ));
      }
      return Left(Failure.unexpected(e.toString()));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}
