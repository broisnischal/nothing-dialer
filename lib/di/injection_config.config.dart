// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/dio/dio_config.dart' as _i5;
import '../core/dio/iconfig.dart' as _i3;

const String _staging = 'staging';
const String _development = 'development';
const String _production = 'production';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioBase = _$DioBase();
  gh.singleton<_i3.IConfig>(
    () => _i3.StagingConfig(),
    registerFor: {_staging},
  );
  gh.lazySingleton<_i4.Dio>(() => dioBase.dio(gh<_i3.IConfig>()));
  gh.singleton<_i3.IConfig>(
    () => _i3.DevConfig(),
    registerFor: {_development},
  );
  gh.singleton<_i3.IConfig>(
    () => _i3.ProdConfig(),
    registerFor: {_production},
  );
  return getIt;
}

class _$DioBase extends _i5.DioBase {}
