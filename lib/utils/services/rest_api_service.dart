import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../data/model/local/generic_factory.dart';
import '../../data/model/remote/response/api_response_state.dart';
import '../../data/model/remote/response/base_api_response.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Interceptor _interceptor;

  factory ApiService() => _instance;
  late Dio _dio;

  ApiService._internal() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://staging.shilin.vn/api/v1',
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

  Future<ApiResponseState<TData>>
      requestGet<TData, TResponse extends BaseApiResponse<TData>>(
    String path,
    Map<String, String> queryParams,
    InitGeneric<TResponse> responseFactory,
  ) async {
    try {
      final responseData = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      final response = responseFactory(responseData.data);
      if (response.isSuccess)
        return ApiResponseState.completed(response.data);
      else
        return ApiResponseState.error(response.error);
    } on DioError catch (e) {
      return ApiResponseState.error(e.message);
    } catch (e) {
      return ApiResponseState.error(e.toString());
    }
  }

  Future<ApiResponseState<TData>>
      requestPost<TData, TResponse extends BaseApiResponse<TData>>(
    String path,
    dynamic body,
    InitGeneric<TResponse> responseFactory,
  ) async {
    try {
      final responseData = await _dio.post(
        path,
        data: body,
      );
      final response = responseFactory(responseData.data);
      if (response.isSuccess)
        return ApiResponseState.completed(response.data);
      else
        return ApiResponseState.error(response.error);
    } on DioError catch (e) {
      return ApiResponseState.error(e.message);
    } catch (e) {
      return ApiResponseState.error(e.toString());
    }
  }

  Future<ApiResponseState<TData>>
      requestPut<TData, TResponse extends BaseApiResponse<TData>>(
    String path,
    Map<String, String> body,
    InitGeneric<TResponse> responseFactory,
  ) async {
    try {
      final responseData = await _dio.put(
        path,
        data: body,
      );
      final response = responseFactory(responseData.data);
      if (response.isSuccess)
        return ApiResponseState.completed(response.data);
      else
        return ApiResponseState.error(response.error);
    } on DioError catch (e) {
      return ApiResponseState.error(e.message);
    } catch (e) {
      return ApiResponseState.error(e.toString());
    }
  }
}
