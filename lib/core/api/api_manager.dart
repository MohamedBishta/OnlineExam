import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../local/storage_service.dart';

@injectable
class ApiManager {
  late Dio dio;

  static final ApiManager _instance = ApiManager._();

  factory ApiManager() => _instance;

  ApiManager._() {
    dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await StorageService.readSecureData();
          if (token != null && token.isNotEmpty) {
            options.headers["token"] = token;
            print('Token attached: $token');
          } else {
            print('No token found in secure storage!');
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/posts')) {
            return false;
          }
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  ///  Common header merger function
  Future<Map<String, dynamic>> _mergeHeaders(Map<String, dynamic>? headers) async {
    String? token = await StorageService.readSecureData();

    final mergedHeaders = {
      ...?headers, // Custom headers first (optional)
    };

    if (token != null && token.isNotEmpty) {
      mergedHeaders['Authorization'] = 'Bearer $token';
    } else {
      print('Token is missing when merging headers!');
    }

    return mergedHeaders;
  }

  /// GET
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  }) async {
    final mergedHeaders = await _mergeHeaders(headers);

    return dio.get(
      endPoint,
      queryParameters: param,
      options: Options(
        headers: mergedHeaders,
        validateStatus: (status) => true,
      ),
    );
  }

  /// POST
  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    final mergedHeaders = await _mergeHeaders(headers);

    return dio.post(
      endPoint,
      data: body,
      options: Options(
        headers: mergedHeaders,
        contentType: contentType,
        validateStatus: (status) => true,
      ),
    );
  }

  /// DELETE
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    final mergedHeaders = await _mergeHeaders(headers);

    return dio.delete(
      endPoint,
      data: body,
      options: Options(
        headers: mergedHeaders,
        validateStatus: (status) => true,
      ),
    );
  }

  ///  PUT
  Future<Response> put({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final mergedHeaders = await _mergeHeaders(headers);

    return dio.put(
      endPoint,
      data: body,
      options: Options(
        headers: mergedHeaders,
        validateStatus: (status) => true,
      ),
    );
  }

  /// PATCH
  Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final mergedHeaders = await _mergeHeaders(headers);

    return dio.patch(
      endPoint,
      data: body,
      options: Options(
        headers: mergedHeaders,
        validateStatus: (status) => true,
      ),
    );
  }

  /// Get token manually if needed
  Future<String?> getToken() async {
    String? token = await StorageService.readSecureData();

    if (token == null || token.isEmpty) {
      print('Token not found or empty');
    } else {
      print('Token retrieved: $token');
    }

    return token;
  }
}
