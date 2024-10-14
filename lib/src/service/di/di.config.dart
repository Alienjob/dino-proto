// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../model/interface/i_backend_service.dart' as _i4;
import '../../pages/auth/bloc/auth_page_bloc.dart' as _i6;
import '../api/api_client.dart' as _i3;
import '../backend_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final retrofitInjectableModule = _$RetrofitInjectableModule();
    gh.factory<_i3.ApiClient>(() => retrofitInjectableModule.getService());
    gh.factory<_i4.IBackendService>(
        () => _i5.BackendService(gh<_i3.ApiClient>()));
    gh.factory<_i6.AuthPageBloc>(
        () => _i6.AuthPageBloc(gh<_i4.IBackendService>()));
    return this;
  }
}

class _$RetrofitInjectableModule extends _i3.RetrofitInjectableModule {}
