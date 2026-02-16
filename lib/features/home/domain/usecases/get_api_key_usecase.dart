import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/domain/repositories/home_repository.dart';

class GetApiKeyUseCase {
  final HomeRepository repository;
  GetApiKeyUseCase(this.repository);

  Future<ApiResponse> execute() {
    return repository.getApiKey();
  }
}
