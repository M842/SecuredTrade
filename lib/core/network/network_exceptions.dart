import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;

  static String getDioErrorMessage(dynamic error) {
    if (error is String) return error;

    try {
      if (error.type == DioErrorType.connectionTimeout) {
        return 'Connection timeout';
      } else if (error.type == DioErrorType.receiveTimeout) {
        return 'Receive timeout';
      } else if (error.type == DioErrorType.cancel) {
        return 'Request was cancelled';
      } else {
        return 'Unexpected error occurred';
      }
    } catch (e) {
      return 'Unexpected error';
    }
  }
}
