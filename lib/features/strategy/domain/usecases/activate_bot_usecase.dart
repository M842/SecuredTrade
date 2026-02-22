import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/strategy/domain/repositories/strategy_repository.dart';

class ActivateBotUseCase {
  final StrategyRepository repository;
  ActivateBotUseCase(this.repository);
  Future<ApiResponse> execute(String pair) {
    return repository.activateBot(pair);
  }
}
