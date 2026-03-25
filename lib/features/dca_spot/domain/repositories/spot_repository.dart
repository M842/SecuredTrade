import 'package:securedtrade/core/network/api_response.dart';

abstract class SpotRepository {
  Future<ApiResponse> getRunningBots();
  Future<ApiResponse> startBot(String pair);
  Future<ApiResponse> stopBot(String pair);
}
