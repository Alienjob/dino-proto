part of 'core_bloc.dart';

@freezed
class CoreEvent with _$CoreEvent {
  factory CoreEvent.init() = _CoreEventInit;
  factory CoreEvent.setToken(String? token) = _CoreEventSetToken;
  const factory CoreEvent.serverStarted() = _CoreEventServerStarted;
  const factory CoreEvent.webPageData({required int flips}) =
      _CoreEventWebPageData;
}
