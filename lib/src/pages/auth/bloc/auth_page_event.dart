part of 'auth_page_bloc.dart';

@freezed
class AuthPageEvent with _$AuthPageEvent {
  factory AuthPageEvent.init() = _AuthPageEventInit;
  factory AuthPageEvent.modeChanged(AuthFormMode mode) =
      _AuthPageEventModeChanged;
  factory AuthPageEvent.nameChanged(String value) = _AuthPageEventNameChanged;
  factory AuthPageEvent.mailChanged(String value) = _AuthPageEventMailChanged;
  factory AuthPageEvent.passwordChanged(String value) =
      _AuthPageEventPasswordChanged;
  factory AuthPageEvent.passwordConfirmationChanged(String value) =
      _AuthPageEventPasswordConfirmationChanged;
  factory AuthPageEvent.submit(AuthFormMode mode) = _AuthPageEventSubmit;
  factory AuthPageEvent.failureRecieved(Failure failure) =
      _AuthPageEventFailureRecieved;
  factory AuthPageEvent.tokenRecieved(String token) =
      _AuthPageEventTokenRecieved;
}
