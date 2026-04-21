// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../features/data/datasources/number_local_data_source.dart' as _i970;
import '../features/data/datasources/number_remote_data_source.dart' as _i775;
import '../features/data/repositories/number_repository_impl.dart' as _i1070;
import '../features/domain/repositories/number_repository.dart' as _i470;
import '../features/domain/usecases/get_concrete_number_use_case.dart' as _i228;
import '../features/domain/usecases/get_random_number_use_case.dart' as _i383;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
    );
    gh.factory<_i470.NumberRepository>(() => _i1070.NumberRepositoryImpl());
    gh.factory<_i775.NumberRemoteDataSource>(
      () => _i775.NumberRemoteDataSourceImpl(),
    );
    gh.factory<_i970.NumberLocalDataSource>(
      () => _i970.NumberLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i228.GetConcreteNumberUseCase>(
      () => _i228.GetConcreteNumberUseCase(
        numberRepository: gh<_i470.NumberRepository>(),
      ),
    );
    gh.lazySingleton<_i383.GetRandomNumberUseCase>(
      () => _i383.GetRandomNumberUseCase(
        numberRepository: gh<_i470.NumberRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
