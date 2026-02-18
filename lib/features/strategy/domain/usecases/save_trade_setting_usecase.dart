import 'package:securedtrade/config/path_config.dart';

class SaveTradeSettingUseCase {
  final StrategyRepository repository;
  SaveTradeSettingUseCase(this.repository);
  Future<ApiResponse> execute(Map<String, dynamic> params) {
    return repository.saveTradeSetting(params);
  }
}
