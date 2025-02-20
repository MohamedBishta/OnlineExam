import 'package:dio/dio.dart';
import 'package:online_exam/core/exceptions/exceptions.dart';

import '../utils/result.dart';

Future<Result<T>> apiExecutor<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success<T>(result);
  } on DioException catch (dioEx) {
    // Handle Dio-specific exceptions

    return Err(ex: _handleDioException(dioEx));
  } on Exception catch (ex) {
    return (Err(ex: ex));
  }
}

Exception _handleDioException(DioException dioEx) {
  switch (dioEx.type) {
    // Network-related errors
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return NetworkError('Network error: ${dioEx.message}');

    // Client-related errors (4xx status codes)
    case DioExceptionType.badResponse:
      if (dioEx.response?.statusCode != null &&
          dioEx.response!.statusCode! >= 400 &&
          dioEx.response!.statusCode! < 500) {
        return ClientError(
            'Client error: ${dioEx.response?.statusCode} - ${dioEx.response?.statusMessage}');
      } else {
        return ServerError(
            'Server error: ${dioEx.response?.statusCode} - ${dioEx.response?.statusMessage}');
      }

    // Server-related errors (5xx status codes)
    case DioExceptionType.badCertificate:
      return ServerError('Invalid certificate: ${dioEx.message}');

    // Other errors
    case DioExceptionType.cancel:
      return ClientError('Request was cancelled: ${dioEx.message}');
    case DioExceptionType.unknown:
      return NetworkError('Unknown error: ${dioEx.message}');
  }
}
