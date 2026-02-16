import 'dart:convert';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

abstract class StrategyRemoteDataSource {
  Future<ApiResponse> getTradeSetting(String pair);
}

class StrategyRemoteDataSourceImpl implements StrategyRemoteDataSource {
  @override
  Future<ApiResponse> getTradeSetting(String pair) async {
    // TODO: implement getTradeSetting
    final resp = await ApiClient().post(
      ApiEndpoints.getTradeSetting,
      data: {"pair": "SOLUSDT"},
    );
    Map data = json.decode(resp.toString());
    print(data);
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
}
