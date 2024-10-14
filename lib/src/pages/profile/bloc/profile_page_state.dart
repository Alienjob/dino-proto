part of 'profile_page_bloc.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  factory ProfilePageState.init() = _ProfilePageStateInit;
  factory ProfilePageState.loading() = _ProfilePageStateLoading;
  factory ProfilePageState.loaded({
    required bool isProcessing,
    User? user,
    String? error,
  }) = _ProfilePageStateDataRecieved;
}
