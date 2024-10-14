part of 'profile_page_bloc.dart';

@freezed
class ProfilePageEvent with _$ProfilePageEvent {
  factory ProfilePageEvent.init() = _ProfilePageEventInit;
  factory ProfilePageEvent.dataRecieved() = _ProfilePageEventDataRecieved;
  factory ProfilePageEvent.errorRecieved() = _ProfilePageEventErrorRecieved;
}
