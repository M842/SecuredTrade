import 'dart:convert';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

abstract class StrategyRemoteDataSource {
  Future<ApiResponse> getTradeSetting(String pair);
  Future<ApiResponse> activateBot(String pair);
  Future<ApiResponse> saveSmartSetting(Map<dynamic, dynamic> params);
}

class StrategyRemoteDataSourceImpl implements StrategyRemoteDataSource {
  @override
  Future<ApiResponse> getTradeSetting(String pair) async {
    // TODO: implement getTradeSetting
    final resp = await ApiClient().post(
      ApiEndpoints.getTradeSetting,
      data: {"pair": pair},
    );

    print(resp);

    final Map<String, dynamic> mData = resp.data is Map
        ? resp.data
        : json.decode(resp.toString());

    if (mData.containsKey(AppConstants.apiError)) {
      return ApiResponse(
        status: false,
        message: mData[AppConstants.apiError],
        data: mData,
      );
    }
    final data = mData["data"];
    if (data == null || (data is Map && data.isEmpty)) {
      return ApiResponse(
        status: false,
        message: "Please set up trade setting first",
        data: null,
      );
    }

    SpotTradeSettingModel m = spotTradeSettingModelFromJson(resp.toString());

    return ApiResponse(status: true, data: m);
  }

  @override
  Future<ApiResponse> saveSmartSetting(Map<dynamic, dynamic> params) async {
    // TODO: implement saveSmartSetting
    final resp = await ApiClient().post(
      ApiEndpoints.saveTradeSetting,
      data: params,
    );
    Map data = json.decode(resp.toString());

    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(
        status: false,
        data: null,
        message: data[AppConstants.apiError],
      );
    }
  }

  @override
  Future<ApiResponse> activateBot(String pair) async {
    // TODO: implement activateBot
    final resp = await ApiClient().post(
      ApiEndpoints.createBot,
      data: {"pair": pair},
    );
    Map data = json.decode(resp.toString());
    print(data);
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(
        status: false,
        data: null,
        message: data[AppConstants.apiError],
      );
    }
  }
}
