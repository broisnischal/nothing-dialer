import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nothing_dialer/di/injection_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies(String env) {
  $initGetIt(getIt, environment: env);
}

abstract class Env {
  static const development = 'development';
  static const production = 'production';
  static const staging = 'staging';
}
