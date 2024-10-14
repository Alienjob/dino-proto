import 'package:dino_proto/src/model/enum/auth_form_mode.dart';
import 'package:dino_proto/src/model/failure/failure.dart';
import 'package:dino_proto/src/model/interface/i_backend_service.dart';
import 'package:dino_proto/src/model/user.dart';
import 'package:dino_proto/src/model/validation_error.dart';
import 'package:dino_proto/src/service/dto/login_request.dart';
import 'package:dino_proto/src/service/dto/register_request.dart';
import 'package:dino_proto/src/service/dto/token_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

part 'auth_page_bloc.freezed.dart';

@injectable
class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc(this._backendService) : super(AuthPageState.init()) {
    on<_AuthPageEventInit>(_onInit);
    on<_AuthPageEventModeChanged>(_onModeChanged);
    on<_AuthPageEventNameChanged>(_onNameChanged);
    on<_AuthPageEventMailChanged>(_onMailChanged);
    on<_AuthPageEventPasswordChanged>(_onPasswordChanged);
    on<_AuthPageEventPasswordConfirmationChanged>(
        _onPasswordConfirmationChanged);
    on<_AuthPageEventSubmit>(_onSubmit);
    on<_AuthPageEventFailureRecieved>(_onFailureRecieved);
    on<_AuthPageEventTokenRecieved>(_onTokenRecieved);
  }

  final IBackendService _backendService;

  void _onInit(_AuthPageEventInit event, emit) {
    emit(AuthPageState.loaded(
      mail: '',
      password: '',
      isProcessing: false,
      error: null,
    ));
  }

  void _onModeChanged(_AuthPageEventModeChanged event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded).copyWith(mode: event.mode));
    }
  }

  void _onNameChanged(_AuthPageEventNameChanged event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded).copyWith(name: event.value));
    }
  }

  void _onMailChanged(_AuthPageEventMailChanged event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded).copyWith(mail: event.value));
    }
  }

  void _onPasswordChanged(_AuthPageEventPasswordChanged event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded).copyWith(password: event.value));
    }
  }

  void _onPasswordConfirmationChanged(
      _AuthPageEventPasswordConfirmationChanged event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded)
          .copyWith(passwordConfirmation: event.value));
    }
  }

  void _onSubmit(_AuthPageEventSubmit event, emit) async {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded)
          .copyWith(isProcessing: true, error: null));
      final mail = (state as _AuthPageStateLoaded).mail;
      final password = (state as _AuthPageStateLoaded).password;
      final name = (state as _AuthPageStateLoaded).name;
      final passwordConfirmation =
          (state as _AuthPageStateLoaded).passwordConfirmation;

      if (event.mode == AuthFormMode.login) {
        if ((mail ?? '').isEmpty || (password ?? '').isEmpty) {
          add(AuthPageEvent.failureRecieved(Failure.validationFailure(errors: [
            ValidationError(
                code: 0, description: 'Mail and password are required')
          ])));
          return;
        }
        final response = await _backendService
            .login(LoginRequest(email: mail!, password: password!));

        if (response is Failure) {
          add(AuthPageEvent.failureRecieved(response as Failure));
        } else {
          add(AuthPageEvent.tokenRecieved(
              (response as TokenResponse).accessToken));
        }
      } else {
        if ((mail ?? '').isEmpty ||
            (password ?? '').isEmpty ||
            (name ?? '').isEmpty ||
            (passwordConfirmation ?? '').isEmpty) {
          add(AuthPageEvent.failureRecieved(Failure.validationFailure(errors: [
            ValidationError(code: 0, description: 'All fields are required')
          ])));
          return;
        }
        if (passwordConfirmation != password) {
          add(AuthPageEvent.failureRecieved(Failure.validationFailure(errors: [
            ValidationError(code: 0, description: 'Passwords do not match')
          ])));
          return;
        }

        final response = await _backendService.register(RegisterRequest(
          email: mail!,
          password: password!,
          name: name!,
        ));

        if (response is Failure) {
          add(AuthPageEvent.failureRecieved(response as Failure));
        } else {
          add(AuthPageEvent.tokenRecieved(
              (response as TokenResponse).accessToken));
        }
      }
    }
  }

  void _onFailureRecieved(_AuthPageEventFailureRecieved event, emit) {
    if (state is _AuthPageStateLoaded) {
      emit((state as _AuthPageStateLoaded)
          .copyWith(error: event.failure.message, isProcessing: false));
      emit((state as _AuthPageStateLoaded)
          .copyWith(error: null, isProcessing: false));
    }
  }

  void _onTokenRecieved(_AuthPageEventTokenRecieved event, emit) {
    emit((state as _AuthPageStateLoaded)
        .copyWith(isProcessing: false, error: 'Unemplemented'));
  }
}
