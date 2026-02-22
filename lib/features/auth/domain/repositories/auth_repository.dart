import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<ApiResponse> register(String userName, String email, String password);

  Future<bool> checkAuthStatus();

  Future<void> logout();
}
