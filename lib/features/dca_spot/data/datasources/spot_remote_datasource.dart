import 'dart:convert';

import 'package:securedtrade/config/path_config.dart';

abstract class SpotRemoteDataSource {
  Future<ApiResponse> getRunningBots();
  Future<ApiResponse> startBot(String pair);
  Future<ApiResponse> stopBot(String pair);
}

class SpotRemoteDataSourceImpl implements SpotRemoteDataSource {
  @override
  Future<ApiResponse> getRunningBots() async {
    // TODO: implement getRunningBots
    final resp = await ApiClient().post(ApiEndpoints.getRunningBots);
    print("GET_BOT_RUNNING${resp}");
    Map data = json.decode(resp.toString());
    final hasData = data["data"] != null && data["data"].isNotEmpty;
    if (!data.containsKey(AppConstants.apiError) && hasData) {
      return ApiResponse(status: true, data: resp.toString());
    } else {
      return ApiResponse(status: false, message: "No running bots found!");
    }
  }

  @override
  Future<ApiResponse> startBot(String pair) async {
    // TODO: implement startBot
    final resp = await ApiClient().post(
      ApiEndpoints.startBot,
      params: {"pair": pair},
    );
    Map data = json.decode(resp.toString());
    print("START_BOT${resp}");
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(status: false, message: AppConstants.apiError);
    }
  }

  @override
  Future<ApiResponse> stopBot(String pair) async {
    // TODO: implement stopBot
    final resp = await ApiClient().post(
      ApiEndpoints.stopBot,
      params: {"pair": pair},
    );
    print("STOP_BOT${resp}");
    Map data = json.decode(resp.toString());
    if (!data.containsKey(AppConstants.apiError)) {
      return ApiResponse(status: true, message: data[AppConstants.apiMessage]);
    } else {
      return ApiResponse(status: false, message: AppConstants.apiError);
    }
  }
}
