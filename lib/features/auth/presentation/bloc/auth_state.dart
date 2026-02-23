
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}class AuthFailure2 extends AuthState {
  final String message;
  AuthFailure2(this.message);
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
