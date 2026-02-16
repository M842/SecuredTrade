import 'package:flutter/cupertino.dart';

abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {}

class LoadKeyEvent extends HomeEvent {}

class GetSpotCurrencies extends HomeEvent {
  final String url;
  GetSpotCurrencies({required this.url});
}

class SentOTP extends HomeEvent {
  final BuildContext context;
  SentOTP(this.context);
}

class ApiManageRequest extends HomeEvent {
  final keyOtp, encrypt;
  ApiManageRequest({required this.encrypt, required this.keyOtp});
}
