
import 'package:securedtrade/features/auth/domain/repositories/auth_repository.dart';

class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<bool> execute() {
    return repository.checkAuthStatus();
  }
}
