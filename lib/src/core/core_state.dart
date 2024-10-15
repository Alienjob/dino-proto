part of 'core_bloc.dart';

@freezed
class CoreState with _$CoreState {
  factory CoreState({
    @Default(null) String? token,
    @Default(ServerStatus.stopped) ServerStatus serverStatus,
    @Default(0) int flips,
  }) = _CoreStateLoaded;
}
