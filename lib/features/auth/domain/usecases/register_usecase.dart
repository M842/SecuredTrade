import 'package:securedtrade/features/auth/domain/entities/user.dart';
import 'package:securedtrade/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<User> execute(String email, String password) {
    return repository.register(email, password);
  }
}
