import 'package:dio/dio.dart';

import '../ultis/dotenv.dart';

class DioClient {
  late Dio dio;

  final baseUrl = 'https://api.themoviedb.org/3';

  void initDio() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 8),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters
              .addAll({'api_key': '7c168dfdd30dcb538ea10624d13f3d62'});
          return handler.next(options); //continue
        },
      ),
    );
  }
}
