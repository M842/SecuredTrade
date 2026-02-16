import "package:securedtrade/config/path_config.dart";
import "package:securedtrade/features/strategy/data/datasources/stratregy_remote_datasource.dart";

class StrategyRepositoryImpl implements StrategyRepository {
  final StrategyRemoteDataSource remote;
  StrategyRepositoryImpl(this.remote);
  @override
  Future<ApiResponse> getTradeSetting(String pair) {
    // TODO: implement getTradeSetting
    return remote.getTradeSetting(pair);
  }
}
