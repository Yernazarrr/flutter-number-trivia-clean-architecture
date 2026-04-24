// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/network/network_info.dart' as _i6;
import '../core/theme/theme_cubit.dart' as _i596;
import '../features/data/datasources/number_api_client.dart' as _i584;
import '../features/data/datasources/number_local_data_source.dart' as _i970;
import '../features/data/datasources/number_remote_data_source.dart' as _i775;
import '../features/data/repositories/number_repository_impl.dart' as _i1070;
import '../features/domain/repositories/number_repository.dart' as _i470;
import '../features/domain/usecases/get_concrete_number_use_case.dart' as _i228;
import '../features/domain/usecases/get_random_number_use_case.dart' as _i383;
import '../features/presentation/bloc/number_bloc.dart' as _i420;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i148;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i596.ThemeCubit>(() => _i596.ThemeCubit());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i161.InternetConnection>(
      () => networkModule.internetConnection,
    );
    gh.lazySingleton<_i584.NumberApiClient>(
      () => networkModule.apiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.factory<_i775.NumberRemoteDataSource>(
      () => _i775.NumberRemoteDataSourceImpl(gh<_i584.NumberApiClient>()),
    );
    gh.factory<_i970.NumberLocalDataSource>(
      () => _i970.NumberLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i470.NumberRepository>(
      () => _i1070.NumberRepositoryImpl(
        remoteDataSource: gh<_i775.NumberRemoteDataSource>(),
        localDataSource: gh<_i970.NumberLocalDataSource>(),
        networkInfo: gh<_i6.NetworkInfo>(),
      ),
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
    gh.factory<_i420.NumberBloc>(
      () => _i420.NumberBloc(
        getConcreteNumber: gh<_i228.GetConcreteNumberUseCase>(),
        getRandomNumber: gh<_i383.GetRandomNumberUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i148.StorageModule {}

class _$NetworkModule extends _i851.NetworkModule {}
