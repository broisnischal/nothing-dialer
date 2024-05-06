import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nothing_dialer/core/dio/iconfig.dart';

@module
abstract class DioBase {
  @lazySingleton
  Dio dio(IConfig config) => Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          connectTimeout: const Duration(seconds: 5000),
          receiveTimeout: const Duration(seconds: 5000),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
  // ..interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) async {
  //         final userToken = await getToken();
  //         options.headers['Authorization'] = 'Bearer $userToken';
  //         handler.next(options);
  //       },
  //       onResponse: (response, requestionProvider) async {
  //         debugPrint(response.data.toString());
  //         requestionProvider.next(response);
  //       },
  //       onError: (error, errorInterceptionHanlder) async {
  //         errorInterceptionHanlder.next(error);
  //       },
  //     ),
  //   )
}

Future<String> getToken() async {
  // get from flutter secure storage
  return 'token';
}
