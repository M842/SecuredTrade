import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/dca_spot/domain/repositories/spot_repository.dart';

class RunningBotsUseCase {
  final SpotRepository repository;

  RunningBotsUseCase(this.repository);

  Future<ApiResponse> execute() {
    return repository.getRunningBots();
  }
}
