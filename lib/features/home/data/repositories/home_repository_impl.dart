import 'package:securedtrade/config/path_config.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  HomeRepositoryImpl(this.remote);
  @override
  Future<ApiResponse> getHomeData() async {
    return await remote.getHomeData();
  }

  @override
  Future<ApiResponse> getApiKey() async {
    return remote.getKey();
  }

  @override
  Future<List<CurrenciesModel>> getSpotCurrencyList(String url) async {
    // TODO: implement getSpotCoinList
    return remote.getSpotCurrencyList(url);
  }

  @override
  Future<ApiResponse> sendOtp() async {
    // TODO: implement sendOtp
    return remote.sendOtp();
  }

  @override
  Future<ApiResponse> saveApiKeys(Map<String, dynamic> encrypt,String secretKey) {
    // TODO: implement saveApiKeys
    return remote.saveApisCredential(encrypt,secretKey);
  }
}
