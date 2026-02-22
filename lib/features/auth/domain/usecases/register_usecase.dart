import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/domain/entities/user.dart';
import 'package:securedtrade/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<ApiResponse> execute(String userName,String email, String password) {
    return repository.register(userName,email, password);
  }
}
