import 'package:securedtrade/config/path_config.dart';

class CheckTokenStatusUseCase {
  final HomeRepository repository;

  CheckTokenStatusUseCase(this.repository);

  Future<ApiResponse> execute() {
    return repository.checkTokenStatus();
  }
}
