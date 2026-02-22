import 'package:dio/dio.dart';
import 'package:securedtrade/config/env.dart';
import 'package:securedtrade/core/network/network_exceptions.dart';

class ApiClient {
  final Dio dio;
  ApiClient._internal(this.dio);
  static final ApiClient _instance = ApiClient._internal(
    Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  );

  factory ApiClient() => _instance;

  void setToken(String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Future.delayed(Duration(seconds: 1));
    print('✅ TOKEN SET: ${dio.options.headers['Authorization']}');
    print('🆔 ApiClient hash: ${hashCode}');
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw NetworkException(NetworkException.getDioErrorMessage(e));
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    print('🆔 ApiClient hash (post): ${hashCode} $data');
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      print(e.response?.statusCode);
      throw NetworkException(NetworkException.getDioErrorMessage(e));
    }
  }
}
