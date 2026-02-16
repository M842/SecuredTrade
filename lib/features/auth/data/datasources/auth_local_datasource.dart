import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<String> getToken();
  Future<void> saveLogin(String token);
  Future<void> clearLogin();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  static const _key = 'auth_token';
  @override
  Future<void> clearLogin() async {
    // TODO: implement clearLogin
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  @override
  Future<String> getToken() async {
    // TODO: implement isLoggedIn
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? '';
  }

  @override
  Future<void> saveLogin(String token) async {
    // TODO: implement saveLogin
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }
}
