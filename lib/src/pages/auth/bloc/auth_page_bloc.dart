import 'package:dino_proto/src/model/failure/failure.dart';
import 'package:dino_proto/src/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

part 'auth_page_bloc.freezed.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc() : super(AuthPageState.init()) {
    on<_AuthPageEventInit>(_onInit);
    on<_AuthPageEventMailChanged>(_onMailChanged);
    on<_AuthPageEventPasswordChanged>(_onPasswordChanged);
    on<_AuthPageEventSubmit>(_onSubmit);
    on<_AuthPageEventFailureRecieved>(_onFailureRecieved);
    on<_AuthPageEventTokenRecieved>(_onTokenRecieved);
  }

  void _onInit(_AuthPageEventInit event, emit) {
    emit(AuthPageState.loading());
  }

  void _onMailChanged(_AuthPageEventMailChanged event, emit) {}

  void _onPasswordChanged(_AuthPageEventPasswordChanged event, emit) {}

  void _onSubmit(_AuthPageEventSubmit event, emit) {}

  void _onFailureRecieved(_AuthPageEventFailureRecieved event, emit) {}

  void _onTokenRecieved(_AuthPageEventTokenRecieved event, emit) {}
}
