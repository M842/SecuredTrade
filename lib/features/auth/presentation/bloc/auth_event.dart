import 'package:flutter/cupertino.dart';
import 'package:securedtrade/features/auth/data/models/burn_nfts_list_model.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}

class MetamaskRequest extends AuthEvent {}

class BurnNFTsEvent extends AuthEvent {
  String payload, tokenId, burnAmt;
  BurnNFTsEvent(this.payload, this.tokenId, this.burnAmt);
}

class RegisterRequest extends AuthEvent {
  final String email, password, userName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.userName,
  });
}
// class GetUserIdFromAddressEvent extends AuthEvent {
//   final String address;
//   GetUserIdFromAddressEvent(this.address);
// }

class UserHeldNFTsDetailEvent extends AuthEvent {}

class Logout extends AuthEvent {}
