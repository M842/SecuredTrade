
import 'package:securedtrade/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
Future<User> register(String email, String password);

  Future<bool> checkAuthStatus();

  Future<void>logout();

}
