import 'package:securedtrade/config/path_config.dart';

class GetTradeSettingUseCase {
  final StrategyRepository repository;
  GetTradeSettingUseCase(this.repository);
  Future<ApiResponse> execute(String pair) {
    return repository.getTradeSetting(pair);
  }
}
