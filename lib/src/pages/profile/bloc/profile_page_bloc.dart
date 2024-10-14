import 'package:dino_proto/src/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

part 'profile_page_bloc.freezed.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageState.init()) {
    on<_ProfilePageEventInit>(_onInit);
    on<_ProfilePageEventDataRecieved>(_onDataRecieved);
    on<_ProfilePageEventErrorRecieved>(_onErrorRecieved);
  }

  void _onInit(_ProfilePageEventInit event, emit) {
    emit(ProfilePageState.loading());
  }

  void _onDataRecieved(_ProfilePageEventDataRecieved event, emit) {}
  void _onErrorRecieved(_ProfilePageEventErrorRecieved event, emit) {}
}
