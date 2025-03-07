import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/strings_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class ApiManager {
  late Dio dio;

  static final ApiManager _instance = ApiManager._();

  factory ApiManager() {
    return _instance;
  }

  ApiManager._() {
    dio = Dio(BaseOptions(headers: {'token': StringsManager.token}));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }

  Future<Response> get(
      {required String endPoint,
        Map<String, dynamic>? param,
        Map<String, dynamic>? headers}) {
    return dio.get(
      endPoint,
      queryParameters: param,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response> post(
      {required String endPoint,
        required Map<String, dynamic> body,
        Map<String, dynamic>? headers,
        String? contentType}) {
    return dio.post(endPoint,
        data: body,
        options: Options(
          headers: headers,
          contentType: contentType,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> delete(
      {required String endPoint,
        Map<String, dynamic>? body,
        Map<String, dynamic>? headers}) {
    return dio.delete(endPoint,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> put(
      {required String endPoint,
        required Map<String, dynamic> body,
        Map<String, dynamic>? headers}) {
    return dio.put(endPoint,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) {
    return dio.patch(
      endPoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true, // Allow all status codes
      ),
    );
  }
}