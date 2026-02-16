import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/home/data/models/currencies_model.dart';
import 'package:securedtrade/features/home/domain/entities/home.dart';

abstract class HomeRepository {
  Future<ApiResponse> getHomeData();

  Future<ApiResponse> getApiKey();
  Future<List<CurrenciesModel>> getSpotCurrencyList(String url);
  Future<ApiResponse> sendOtp();

  Future<ApiResponse> saveApiKeys(Map<String, dynamic> encrypt, String keyOtp);
}
