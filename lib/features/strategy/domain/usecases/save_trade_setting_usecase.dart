import 'package:securedtrade/config/path_config.dart';

class SaveTradeSettingUseCase {
  final StrategyRepository repository;
  SaveTradeSettingUseCase(this.repository);
  Future<ApiResponse> execute(Map<dynamic, dynamic> params) {
    return repository.saveTradeSetting(params);
  }
}
