import 'package:dino_proto/src/service/api/api_client.dart';
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
  Future<dynamic> login();

  @POST('/api/register')
  Future<dynamic> register();
}
