import 'package:securedtrade/config/path_config.dart';

class StopBotUseCase {
  final StrategyRepository repository;
  StopBotUseCase(this.repository);
  Future<ApiResponse> execute(String pair) {
    return repository.stopBot(pair);
  }
}
