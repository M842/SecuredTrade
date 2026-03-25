import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/dca_spot/data/datasources/spot_remote_datasource.dart';
import 'package:securedtrade/features/dca_spot/domain/repositories/spot_repository.dart';

class SpotRepositoryImpl extends SpotRepository {
  final SpotRemoteDataSource remote;
  SpotRepositoryImpl(this.remote);
  @override
  Future<ApiResponse> getRunningBots() async {
    // TODO: implement getRunningBots
    return await remote.getRunningBots();
  }

  @override
  Future<ApiResponse> startBot(String pair) async {
    // TODO: implement startBot
    return await remote.startBot(pair);
  }

  @override
  Future<ApiResponse> stopBot(String pair) async {
    // TODO: implement stopBot
    return await remote.stopBot(pair);
  }
}
