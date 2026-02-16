import 'dart:convert';
import 'dart:math';
import 'package:securedtrade/features/auth/data/models/user_model.dart';
import 'package:securedtrade/config/path_config.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    Map<dynamic, dynamic> params = {"username": email, "password": password};
    final res = await ApiClient().post(ApiEndpoints.login, data: params);

    Map data = json.decode(res.toString());

    return UserModel(
      id: Random().nextInt(0030).toString(),
      email: email,
      token: data[AppConstants.token_key],
    );
  }

  @override
  Future<UserModel> register(String email, String password) async {
    // TODO: implement register
    Map<dynamic, dynamic> params = {"username": email, "password": password};
    final res = await ApiClient().post(ApiEndpoints.signUp, data: params);
    print(res);
    Map data = json.decode(res.toString());
    return UserModel(
      id: Random().nextInt(0030).toString(),
      email: email,
      token: data[AppConstants.token_key],
    );
  }
}
