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
  }) = _AuthPageStateLoaded;

  int get visibleVersion {
    // page needs to rebuild when changed
    // runtimeType or isProcessing or error
    return map(
        init: (init) => init.runtimeType.hashCode,
        loading: (loading) => loading.runtimeType.hashCode,
        loaded: (loaded) =>
            Object.hash(runtimeType, loaded.isProcessing, loaded.error));
  }

  String? get error => mapOrNull(loaded: (loaded) => loaded.error);
}
