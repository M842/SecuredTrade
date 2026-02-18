import 'package:securedtrade/config/path_config.dart';

abstract class StrategyRepository {
  Future<ApiResponse> getTradeSetting(String pair);
  Future<ApiResponse> saveTradeSetting(Map<String,dynamic>params);
}
