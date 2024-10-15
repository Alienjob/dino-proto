part of 'profile_page_bloc.dart';

@freezed
class ProfilePageEvent with _$ProfilePageEvent {
  factory ProfilePageEvent.init() = _ProfilePageEventInit;
  factory ProfilePageEvent.dataRecieved({
    required UserResponse userResponse,
  }) = _ProfilePageEventDataRecieved;
  factory ProfilePageEvent.errorRecieved({
    required Failure failure,
  }) = _ProfilePageEventErrorRecieved;
}
