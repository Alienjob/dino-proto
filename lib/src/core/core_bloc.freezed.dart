// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? token) setToken,
    required TResult Function() serverStarted,
    required TResult Function(int flips) webPageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? token)? setToken,
    TResult? Function()? serverStarted,
    TResult? Function(int flips)? webPageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? token)? setToken,
    TResult Function()? serverStarted,
    TResult Function(int flips)? webPageData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CoreEventInit value) init,
    required TResult Function(_CoreEventSetToken value) setToken,
    required TResult Function(_CoreEventServerStarted value) serverStarted,
    required TResult Function(_CoreEventWebPageData value) webPageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CoreEventInit value)? init,
    TResult? Function(_CoreEventSetToken value)? setToken,
    TResult? Function(_CoreEventServerStarted value)? serverStarted,
    TResult? Function(_CoreEventWebPageData value)? webPageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CoreEventInit value)? init,
    TResult Function(_CoreEventSetToken value)? setToken,
    TResult Function(_CoreEventServerStarted value)? serverStarted,
    TResult Function(_CoreEventWebPageData value)? webPageData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreEventCopyWith<$Res> {
  factory $CoreEventCopyWith(CoreEvent value, $Res Function(CoreEvent) then) =
      _$CoreEventCopyWithImpl<$Res, CoreEvent>;
}

/// @nodoc
class _$CoreEventCopyWithImpl<$Res, $Val extends CoreEvent>
    implements $CoreEventCopyWith<$Res> {
  _$CoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CoreEventInitImplCopyWith<$Res> {
  factory _$$CoreEventInitImplCopyWith(
          _$CoreEventInitImpl value, $Res Function(_$CoreEventInitImpl) then) =
      __$$CoreEventInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoreEventInitImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventInitImpl>
    implements _$$CoreEventInitImplCopyWith<$Res> {
  __$$CoreEventInitImplCopyWithImpl(
      _$CoreEventInitImpl _value, $Res Function(_$CoreEventInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoreEventInitImpl implements _CoreEventInit {
  _$CoreEventInitImpl();

  @override
  String toString() {
    return 'CoreEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoreEventInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? token) setToken,
    required TResult Function() serverStarted,
    required TResult Function(int flips) webPageData,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? token)? setToken,
    TResult? Function()? serverStarted,
    TResult? Function(int flips)? webPageData,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? token)? setToken,
    TResult Function()? serverStarted,
    TResult Function(int flips)? webPageData,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CoreEventInit value) init,
    required TResult Function(_CoreEventSetToken value) setToken,
    required TResult Function(_CoreEventServerStarted value) serverStarted,
    required TResult Function(_CoreEventWebPageData value) webPageData,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CoreEventInit value)? init,
    TResult? Function(_CoreEventSetToken value)? setToken,
    TResult? Function(_CoreEventServerStarted value)? serverStarted,
    TResult? Function(_CoreEventWebPageData value)? webPageData,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CoreEventInit value)? init,
    TResult Function(_CoreEventSetToken value)? setToken,
    TResult Function(_CoreEventServerStarted value)? serverStarted,
    TResult Function(_CoreEventWebPageData value)? webPageData,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _CoreEventInit implements CoreEvent {
  factory _CoreEventInit() = _$CoreEventInitImpl;
}

/// @nodoc
abstract class _$$CoreEventSetTokenImplCopyWith<$Res> {
  factory _$$CoreEventSetTokenImplCopyWith(_$CoreEventSetTokenImpl value,
          $Res Function(_$CoreEventSetTokenImpl) then) =
      __$$CoreEventSetTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$CoreEventSetTokenImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventSetTokenImpl>
    implements _$$CoreEventSetTokenImplCopyWith<$Res> {
  __$$CoreEventSetTokenImplCopyWithImpl(_$CoreEventSetTokenImpl _value,
      $Res Function(_$CoreEventSetTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$CoreEventSetTokenImpl(
      freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CoreEventSetTokenImpl implements _CoreEventSetToken {
  _$CoreEventSetTokenImpl(this.token);

  @override
  final String? token;

  @override
  String toString() {
    return 'CoreEvent.setToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventSetTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreEventSetTokenImplCopyWith<_$CoreEventSetTokenImpl> get copyWith =>
      __$$CoreEventSetTokenImplCopyWithImpl<_$CoreEventSetTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? token) setToken,
    required TResult Function() serverStarted,
    required TResult Function(int flips) webPageData,
  }) {
    return setToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? token)? setToken,
    TResult? Function()? serverStarted,
    TResult? Function(int flips)? webPageData,
  }) {
    return setToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? token)? setToken,
    TResult Function()? serverStarted,
    TResult Function(int flips)? webPageData,
    required TResult orElse(),
  }) {
    if (setToken != null) {
      return setToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CoreEventInit value) init,
    required TResult Function(_CoreEventSetToken value) setToken,
    required TResult Function(_CoreEventServerStarted value) serverStarted,
    required TResult Function(_CoreEventWebPageData value) webPageData,
  }) {
    return setToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CoreEventInit value)? init,
    TResult? Function(_CoreEventSetToken value)? setToken,
    TResult? Function(_CoreEventServerStarted value)? serverStarted,
    TResult? Function(_CoreEventWebPageData value)? webPageData,
  }) {
    return setToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CoreEventInit value)? init,
    TResult Function(_CoreEventSetToken value)? setToken,
    TResult Function(_CoreEventServerStarted value)? serverStarted,
    TResult Function(_CoreEventWebPageData value)? webPageData,
    required TResult orElse(),
  }) {
    if (setToken != null) {
      return setToken(this);
    }
    return orElse();
  }
}

abstract class _CoreEventSetToken implements CoreEvent {
  factory _CoreEventSetToken(final String? token) = _$CoreEventSetTokenImpl;

  String? get token;
  @JsonKey(ignore: true)
  _$$CoreEventSetTokenImplCopyWith<_$CoreEventSetTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoreEventServerStartedImplCopyWith<$Res> {
  factory _$$CoreEventServerStartedImplCopyWith(
          _$CoreEventServerStartedImpl value,
          $Res Function(_$CoreEventServerStartedImpl) then) =
      __$$CoreEventServerStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoreEventServerStartedImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventServerStartedImpl>
    implements _$$CoreEventServerStartedImplCopyWith<$Res> {
  __$$CoreEventServerStartedImplCopyWithImpl(
      _$CoreEventServerStartedImpl _value,
      $Res Function(_$CoreEventServerStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoreEventServerStartedImpl implements _CoreEventServerStarted {
  const _$CoreEventServerStartedImpl();

  @override
  String toString() {
    return 'CoreEvent.serverStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventServerStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? token) setToken,
    required TResult Function() serverStarted,
    required TResult Function(int flips) webPageData,
  }) {
    return serverStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? token)? setToken,
    TResult? Function()? serverStarted,
    TResult? Function(int flips)? webPageData,
  }) {
    return serverStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? token)? setToken,
    TResult Function()? serverStarted,
    TResult Function(int flips)? webPageData,
    required TResult orElse(),
  }) {
    if (serverStarted != null) {
      return serverStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CoreEventInit value) init,
    required TResult Function(_CoreEventSetToken value) setToken,
    required TResult Function(_CoreEventServerStarted value) serverStarted,
    required TResult Function(_CoreEventWebPageData value) webPageData,
  }) {
    return serverStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CoreEventInit value)? init,
    TResult? Function(_CoreEventSetToken value)? setToken,
    TResult? Function(_CoreEventServerStarted value)? serverStarted,
    TResult? Function(_CoreEventWebPageData value)? webPageData,
  }) {
    return serverStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CoreEventInit value)? init,
    TResult Function(_CoreEventSetToken value)? setToken,
    TResult Function(_CoreEventServerStarted value)? serverStarted,
    TResult Function(_CoreEventWebPageData value)? webPageData,
    required TResult orElse(),
  }) {
    if (serverStarted != null) {
      return serverStarted(this);
    }
    return orElse();
  }
}

abstract class _CoreEventServerStarted implements CoreEvent {
  const factory _CoreEventServerStarted() = _$CoreEventServerStartedImpl;
}

/// @nodoc
abstract class _$$CoreEventWebPageDataImplCopyWith<$Res> {
  factory _$$CoreEventWebPageDataImplCopyWith(_$CoreEventWebPageDataImpl value,
          $Res Function(_$CoreEventWebPageDataImpl) then) =
      __$$CoreEventWebPageDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int flips});
}

/// @nodoc
class __$$CoreEventWebPageDataImplCopyWithImpl<$Res>
    extends _$CoreEventCopyWithImpl<$Res, _$CoreEventWebPageDataImpl>
    implements _$$CoreEventWebPageDataImplCopyWith<$Res> {
  __$$CoreEventWebPageDataImplCopyWithImpl(_$CoreEventWebPageDataImpl _value,
      $Res Function(_$CoreEventWebPageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flips = null,
  }) {
    return _then(_$CoreEventWebPageDataImpl(
      flips: null == flips
          ? _value.flips
          : flips // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CoreEventWebPageDataImpl implements _CoreEventWebPageData {
  const _$CoreEventWebPageDataImpl({required this.flips});

  @override
  final int flips;

  @override
  String toString() {
    return 'CoreEvent.webPageData(flips: $flips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreEventWebPageDataImpl &&
            (identical(other.flips, flips) || other.flips == flips));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flips);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreEventWebPageDataImplCopyWith<_$CoreEventWebPageDataImpl>
      get copyWith =>
          __$$CoreEventWebPageDataImplCopyWithImpl<_$CoreEventWebPageDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String? token) setToken,
    required TResult Function() serverStarted,
    required TResult Function(int flips) webPageData,
  }) {
    return webPageData(flips);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String? token)? setToken,
    TResult? Function()? serverStarted,
    TResult? Function(int flips)? webPageData,
  }) {
    return webPageData?.call(flips);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String? token)? setToken,
    TResult Function()? serverStarted,
    TResult Function(int flips)? webPageData,
    required TResult orElse(),
  }) {
    if (webPageData != null) {
      return webPageData(flips);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CoreEventInit value) init,
    required TResult Function(_CoreEventSetToken value) setToken,
    required TResult Function(_CoreEventServerStarted value) serverStarted,
    required TResult Function(_CoreEventWebPageData value) webPageData,
  }) {
    return webPageData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CoreEventInit value)? init,
    TResult? Function(_CoreEventSetToken value)? setToken,
    TResult? Function(_CoreEventServerStarted value)? serverStarted,
    TResult? Function(_CoreEventWebPageData value)? webPageData,
  }) {
    return webPageData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CoreEventInit value)? init,
    TResult Function(_CoreEventSetToken value)? setToken,
    TResult Function(_CoreEventServerStarted value)? serverStarted,
    TResult Function(_CoreEventWebPageData value)? webPageData,
    required TResult orElse(),
  }) {
    if (webPageData != null) {
      return webPageData(this);
    }
    return orElse();
  }
}

abstract class _CoreEventWebPageData implements CoreEvent {
  const factory _CoreEventWebPageData({required final int flips}) =
      _$CoreEventWebPageDataImpl;

  int get flips;
  @JsonKey(ignore: true)
  _$$CoreEventWebPageDataImplCopyWith<_$CoreEventWebPageDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CoreState {
  String? get token => throw _privateConstructorUsedError;
  ServerStatus get serverStatus => throw _privateConstructorUsedError;
  int get flips => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoreStateCopyWith<CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res, CoreState>;
  @useResult
  $Res call({String? token, ServerStatus serverStatus, int flips});
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res, $Val extends CoreState>
    implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? serverStatus = null,
    Object? flips = null,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      serverStatus: null == serverStatus
          ? _value.serverStatus
          : serverStatus // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
      flips: null == flips
          ? _value.flips
          : flips // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoreStateLoadedImplCopyWith<$Res>
    implements $CoreStateCopyWith<$Res> {
  factory _$$CoreStateLoadedImplCopyWith(_$CoreStateLoadedImpl value,
          $Res Function(_$CoreStateLoadedImpl) then) =
      __$$CoreStateLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, ServerStatus serverStatus, int flips});
}

/// @nodoc
class __$$CoreStateLoadedImplCopyWithImpl<$Res>
    extends _$CoreStateCopyWithImpl<$Res, _$CoreStateLoadedImpl>
    implements _$$CoreStateLoadedImplCopyWith<$Res> {
  __$$CoreStateLoadedImplCopyWithImpl(
      _$CoreStateLoadedImpl _value, $Res Function(_$CoreStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? serverStatus = null,
    Object? flips = null,
  }) {
    return _then(_$CoreStateLoadedImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      serverStatus: null == serverStatus
          ? _value.serverStatus
          : serverStatus // ignore: cast_nullable_to_non_nullable
              as ServerStatus,
      flips: null == flips
          ? _value.flips
          : flips // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CoreStateLoadedImpl implements _CoreStateLoaded {
  _$CoreStateLoadedImpl(
      {this.token = null,
      this.serverStatus = ServerStatus.stopped,
      this.flips = 0});

  @override
  @JsonKey()
  final String? token;
  @override
  @JsonKey()
  final ServerStatus serverStatus;
  @override
  @JsonKey()
  final int flips;

  @override
  String toString() {
    return 'CoreState(token: $token, serverStatus: $serverStatus, flips: $flips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoreStateLoadedImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.serverStatus, serverStatus) ||
                other.serverStatus == serverStatus) &&
            (identical(other.flips, flips) || other.flips == flips));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, serverStatus, flips);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoreStateLoadedImplCopyWith<_$CoreStateLoadedImpl> get copyWith =>
      __$$CoreStateLoadedImplCopyWithImpl<_$CoreStateLoadedImpl>(
          this, _$identity);
}

abstract class _CoreStateLoaded implements CoreState {
  factory _CoreStateLoaded(
      {final String? token,
      final ServerStatus serverStatus,
      final int flips}) = _$CoreStateLoadedImpl;

  @override
  String? get token;
  @override
  ServerStatus get serverStatus;
  @override
  int get flips;
  @override
  @JsonKey(ignore: true)
  _$$CoreStateLoadedImplCopyWith<_$CoreStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
