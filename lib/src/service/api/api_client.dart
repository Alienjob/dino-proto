import 'package:dino_proto/src/service/api/api_client.dart';
import 'package:dino_proto/src/service/dto/token_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@module
abstract class RetrofitInjectableModule {
  ApiClient getService() => _ApiClient(Dio());
}

@RestApi(baseUrl: 'https://testwork.shot.dinolab.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/api/me')
  Future<dynamic> me();

  @POST('/api/login')
  Future<TokenResponse> login(
    @Body() dynamic loginRequest,
  );

  @POST('/api/register')
  Future<TokenResponse> register(
    @Body() dynamic registerRequest,
  );
}
