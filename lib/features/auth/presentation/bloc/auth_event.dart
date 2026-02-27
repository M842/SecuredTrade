import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {

}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}

class MetamaskRequest extends AuthEvent {}


class RegisterRequest extends AuthEvent {
  final String email,password,userName;


  RegisterRequest({required this.email, required this.password,
    required this.userName});
}

class Logout extends AuthEvent {}
