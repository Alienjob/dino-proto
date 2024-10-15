import 'dart:async';
import 'dart:math';

import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/model/failure/failure.dart';
import 'package:dino_proto/src/model/interface/i_backend_service.dart';
import 'package:dino_proto/src/model/user.dart';
import 'package:dino_proto/src/service/dto/user_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

part 'profile_page_bloc.freezed.dart';

@injectable
class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc(this._backendService, this._coreBloc)
      : super(ProfilePageState.init()) {
    on<_ProfilePageEventInit>(_onInit);
    on<_ProfilePageEventDataRecieved>(_onDataRecieved);
    on<_ProfilePageEventErrorRecieved>(_onErrorRecieved);
  }

  final IBackendService _backendService;
  final CoreBloc _coreBloc;

  StreamSubscription? _coreSub;

  @override
  Future<void> close() {
    _coreSub?.cancel();
    return super.close();
  }

  void _onInit(_ProfilePageEventInit event, emit) async {
    emit(ProfilePageState.loading());

    _coreSub?.cancel();
    _coreSub =
        _coreBloc.stream.listen(((event) => _onCoreStateChange(event, emit)));
    _onCoreStateChange(_coreBloc.state, emit);
  }

  void _onDataRecieved(_ProfilePageEventDataRecieved event, emit) {
    emit(ProfilePageState.loaded(
        isProcessing: false, error: null, user: event.userResponse.toModel()));
  }

  void _onErrorRecieved(_ProfilePageEventErrorRecieved event, emit) {
    emit(ProfilePageState.loaded(
        isProcessing: false, error: event.failure.message));
  }

  void _onCoreStateChange(CoreState state, emit) async {
    if (state.token == null) {
      emit(ProfilePageState.loaded(isProcessing: false, error: 'No token'));
    } else {
      emit(ProfilePageState.loaded(isProcessing: true, error: null));
      final response = await _backendService.me();
      response.fold(
        (failure) {
          add(ProfilePageEvent.errorRecieved(failure: failure));
        },
        (userResponse) {
          add(ProfilePageEvent.dataRecieved(userResponse: userResponse));
        },
      );
    }
  }
}
