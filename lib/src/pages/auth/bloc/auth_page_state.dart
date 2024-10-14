part of 'auth_page_bloc.dart';

@freezed
class AuthPageState with _$AuthPageState {
  factory AuthPageState.init() = _AuthPageStateInit;
  factory AuthPageState.loading() = _AuthPageStateLoading;
  factory AuthPageState.loaded({
    required bool isProcessing,
    String? mail,
    String? password,
    String? error,
  }) = _AuthPageStateDataRecieved;
}
