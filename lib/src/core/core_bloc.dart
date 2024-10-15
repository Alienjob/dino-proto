import 'dart:io';

import 'package:dino_proto/src/pages/task/local_server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'core_event.dart';
part 'core_state.dart';
part 'core_bloc.freezed.dart';

enum ServerStatus { waiting, ready, stopped }

@singleton
class CoreBloc extends Bloc<CoreEvent, CoreState> {
  CoreBloc() : super(CoreState()) {
    on<_CoreEventInit>(_onInit);
    on<_CoreEventSetToken>(_onSetToken);
    on<_CoreEventServerStarted>(_onServerStarted);
    on<_CoreEventWebPageData>(_onWebPageData);
  }

  HttpServer? server;

  void _onInit(_CoreEventInit event, emit) {
    emit(state.copyWith(serverStatus: ServerStatus.waiting));
    createServer().then((server) {
      server = server;
      add(const CoreEvent.serverStarted());
    });
  }

  void _onSetToken(_CoreEventSetToken event, emit) {
    emit(state.copyWith(token: event.token));
  }

  void _onServerStarted(_CoreEventServerStarted event, emit) {
    emit(state.copyWith(serverStatus: ServerStatus.ready));
  }

  void _onWebPageData(_CoreEventWebPageData event, emit) {
    emit(state.copyWith(flips: event.flips));
  }
}
