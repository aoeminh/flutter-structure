import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Interceptor _interceptor;

  factory ApiService() => _instance;
  late Dio _dio;

  ApiService._internal() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: '',
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {
        "Accept": "application/json",
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _interceptor = InterceptorsWrapper(onError: (DioError error, handler) {});
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          logPrint: print));
    }
    _dio = Dio(baseOptions);
    _dio.interceptors.add(_interceptor);
  }



}
