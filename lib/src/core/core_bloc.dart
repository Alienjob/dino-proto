import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'core_event.dart';
part 'core_state.dart';
part 'core_bloc.freezed.dart';

@singleton
class CoreBloc extends Bloc<CoreEvent, CoreState> {
  CoreBloc() : super(CoreState(token: null)) {
    on<_CoreEventInit>(_onInit);
    on<_CoreEventSetToken>(_onSetToken);
  }

  void _onInit(_CoreEventInit event, emit) {}

  void _onSetToken(_CoreEventSetToken event, emit) {
    emit(CoreState(token: event.token));
  }
}
