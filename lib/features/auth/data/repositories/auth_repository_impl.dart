import 'package:securedtrade/features/auth/domain/entities/user.dart';

import 'package:securedtrade/config/path_config.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;
  final ApiClient apiClient;
  AuthRepositoryImpl(this.remote, this.local, this.apiClient);

  @override
  Future<User> login(String email, String password) async {
    final user = await remote.login(email, password);
    local.saveLogin(user.token);
    apiClient.setToken(user.token);

    return user;
  }

  @override
  Future<bool> checkAuthStatus() async {
    // TODO: implement isLoggedIn
    final token = await local.getToken();
    apiClient.setToken(token);
    return token.isEmpty ? false : true;
  }

  @override
  Future<User> register(String email, String password) async {
    // TODO: implement register
    return await remote.register(email, password);
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    await local.clearLogin();
  }
}
