import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:securedtrade/config/env.dart';
import 'package:securedtrade/core/constants/app_strings.dart';
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

  Future<Response> post(String path, {dynamic params}) async {
    try {
      final response = await dio.post(path, data: params);
      return response;
    } on DioException catch (e) {
      print(e.response?.statusCode);
      throw NetworkException(NetworkException.getDioErrorMessage(e));
    }
  }

  Future<String> getOZoneTransactionStatus({required String txhash}) async {
    try {
      await Future.delayed(Duration(seconds: 5));
      String url = AppStrings.getTestNetOZoneTransactionResultUrl + txhash;

      final response = await http.get(Uri.parse(url));
      print(response);
      Map data = json.decode(response.body);
      if (data[AppStrings.apiResultKey] == AppStrings.apiSuccessKey) {
        return AppStrings.apiSuccessKey;
      } else {
        //print("RESP${data["revert_reason"]["parameters"][0]["value"]}");
        //return data["revert_reason"]["parameters"];
        String res = data["revert_reason"]["parameters"][0]["value"];
        return "$res transaction failed";
        //return "${res.toUpperCase()} Transaction failed ";
      }
    } catch (exce) {
      print("Exception${exce.toString()}");
      return exce.toString();
    }
  }
}
