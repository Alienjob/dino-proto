import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/service/di/di.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
    });

    final core = getIt<CoreBloc>();

    if (core.state.token != null) {
      options.headers.addAll({
        "Authorization": "Bearer ${core.state.token}",
      });
    }
    return super.onRequest(options, handler);
  }
}
