import 'package:securedtrade/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json["token"],
    );
  }
}
