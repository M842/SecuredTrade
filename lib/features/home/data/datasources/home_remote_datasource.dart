import 'dart:convert';

import 'package:securedtrade/features/home/data/models/home_model.dart';

import 'package:securedtrade/config/path_config.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResponse> getHomeData();
  Future<ApiResponse> getKey();

  Future<List<CurrenciesModel>> getSpotCurrencyList(String url);

  Future<ApiResponse> sendOtp();

  Future<ApiResponse> saveApisCredential(
    Map<String, dynamic> encrypt,
    String keyOtp,
  );
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<ApiResponse> getHomeData() async {
    // TODO: implement getHomeData

    final res = await ApiClient().post(ApiEndpoints.dashboard);
    Map data = json.decode(res.toString());
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true);
    } else {
      return ApiResponse(
        status: false,
        data: null,
        message: data[AppConstants.apiError],
      );
    }
  }

  @override
  Future<ApiResponse> getKey() async {
    // TODO: implement getKey
    final res = await ApiClient().post(ApiEndpoints.getApiKey);

    Map data = json.decode(res.toString());
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true);
    } else {
      return ApiResponse(status: false, message: data[AppConstants.apiError]);
    }
  }

  @override
  Future<List<CurrenciesModel>> getSpotCurrencyList(String url) async {
    // TODO: implement getSpotCoinList
    final res = await ApiClient().get(url);

    if (res.statusCode == 200) {
      List<dynamic> data = res.data as List;
      return data
          .map((toElement) => CurrenciesModel.fromJson(toElement))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<ApiResponse> sendOtp() async {
    // TODO: implement sendOtp

    final res = await ApiClient().post(ApiEndpoints.sendOtp);

    Map data = json.decode(res.toString());
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(status: false, message: data[AppConstants.apiError]);
    }
  }

  @override
  Future<ApiResponse> saveApisCredential(
    Map<String, dynamic> encrypt,
    String keyOTP,
  ) async {
    // TODO: implement saveApisCredential
    final apiKeyEnc = encrypt['apiKeyEnc'];
    final secretKeyEnc = encrypt['secretKeyEnc'];
    final aesKeyEnc = encrypt['aesKeyEnc'];
    final iv = encrypt['iv'];
    final res = await ApiClient().post(
      ApiEndpoints.apiBind,
      data: {
        "apiKeyEnc": apiKeyEnc,
        "secretKeyEnc": secretKeyEnc,
        "aesKeyEnc": aesKeyEnc,
        "iv": iv,
        "keyotp": keyOTP,
      },
    );
    print("SOURCE$res");
    Map data = json.decode(res.toString());
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(status: false, message: data[AppConstants.apiError]);
    }
  }
}
