import 'dart:convert';
import 'dart:math';
import 'package:securedtrade/features/auth/data/models/user_model.dart';
import 'package:securedtrade/config/path_config.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<ApiResponse> register(String userName, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    Map<dynamic, dynamic> params = {
      "username": email,
      "useremail": email,
      "password": password,
    };
    final res = await ApiClient().post(ApiEndpoints.login, data: params);
    print(res);
    Map data = json.decode(res.toString());

    return UserModel(
      id: Random().nextInt(0030).toString(),
      email: email,
      token: data[AppConstants.token_key],
    );
  }

  @override
  Future<ApiResponse> register(
    String userName,
    String email,
    String password,
  ) async {
    // TODO: implement register
    Map<dynamic, dynamic> params = {
      "username": email,
      "useremail": email,
      "password": password,
    };
    try {
      final res = await ApiClient().post(ApiEndpoints.signUp, data: params);
      print("REMOTE_RES$res");
      Map data = json.decode(res.toString());

      if (data.containsKey(AppConstants.apiError)) {
        return ApiResponse(
          status: false,
          data: null,
          message: data[AppConstants.apiError],
        );
      } else {
        return ApiResponse(status: true, data: data);
      }
    } catch (err) {
      return ApiResponse(status: false, message: err.toString());
    }
  }
}
