import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/dca_spot/domain/repositories/spot_repository.dart';

class StartBotUseCase {
  final SpotRepository repository;

  StartBotUseCase(this.repository);

  Future<ApiResponse> execute(String pair) {
    return repository.startBot(pair);
  }
}
