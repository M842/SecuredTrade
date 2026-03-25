import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/dca_spot/domain/repositories/spot_repository.dart';

class StopBotUseCase2 {
  final SpotRepository repository;

  StopBotUseCase2(this.repository);

  Future<ApiResponse> execute(String pair) {
    return repository.stopBot(pair);
  }
}
