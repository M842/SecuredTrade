import 'package:securedtrade/features/auth/domain/entities/user.dart';
import 'package:securedtrade/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<void> execute() {
    return repository.logout();
  }
}
