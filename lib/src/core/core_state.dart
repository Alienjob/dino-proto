part of 'core_bloc.dart';

@freezed
class CoreState with _$CoreState {
  factory CoreState({required String? token}) = _CoreStateLoaded;
}
