part of 'auth_page_bloc.dart';

@freezed
class AuthPageState with _$AuthPageState {
  const AuthPageState._();
  factory AuthPageState.init() = _AuthPageStateInit;
  factory AuthPageState.loading() = _AuthPageStateLoading;
  factory AuthPageState.loaded({
    required bool isProcessing,
    @Default(AuthFormMode.register) AuthFormMode mode,
    String? name,
    String? mail,
    String? password,
    String? passwordConfirmation,
    String? error,
    @Default(false) bool isAuthorized,
  }) = _AuthPageStateLoaded;

  int get visibleVersion {
    // page needs to rebuild when changed
    // runtimeType or isProcessing or isAuthorized
    return map(
        init: (init) => init.runtimeType.hashCode,
        loading: (loading) => loading.runtimeType.hashCode,
        loaded: (loaded) =>
            Object.hash(runtimeType, loaded.isProcessing, loaded.isAuthorized));
  }

  String? get error => mapOrNull(loaded: (loaded) => loaded.error);
}
