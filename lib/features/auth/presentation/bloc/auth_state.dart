import 'package:securedtrade/features/auth/data/models/burn_nfts_list_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class NFtsBurnSuccessState extends AuthState {
  final String message;
  NFtsBurnSuccessState(this.message);
}

class NFTsBurnFailedState extends AuthState {
  final String message;
  NFTsBurnFailedState(this.message);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

class AuthFailure2 extends AuthState {
  final String message;
  AuthFailure2(this.message);
}

class GetUserHeldBurnNFTs extends AuthState {
  final List<NFTsBurnModelList> nftsBurnList;

  GetUserHeldBurnNFTs({required this.nftsBurnList});
}

class RegisterSuccess extends AuthState {}

class UserSubscribed extends AuthState {
  final bool isSubscribed;
  UserSubscribed({required this.isSubscribed});
}

class UserSubscriptionFailed extends AuthState {
  final String message;
  UserSubscriptionFailed(this.message);
}
