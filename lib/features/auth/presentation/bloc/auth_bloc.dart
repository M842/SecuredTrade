import 'dart:async';
import 'dart:convert';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/domain/usecases/logout_usecase.dart';
import 'package:securedtrade/features/auth/domain/usecases/register_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  bool isSubscribed = true;

  AuthBloc(
    this.checkAuthStatusUseCase,
    this.loginUseCase,
    this.registerUseCase,
    this.logoutUseCase,
  ) : super(AuthInitial()) {
    on<AppStarted>(initial);
    on<LoginRequest>(onLoginRequested);
    on<RegisterRequest>(register);
    on<Logout>(logout);
  }
  Future<void> onLoginRequested(
    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase.execute(event.email, event.password);
      emit(Authenticated());
    } on NetworkException catch (e) {
      emit(AuthFailure('Login failed: ${e.message}'));
    } catch (_) {
      emit(AuthFailure('Something went wrong'));
    }
  }

  FutureOr<void> initial(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final t = await checkAuthStatusUseCase.execute();
    emit(t ? Authenticated() : Unauthenticated());
  }

  FutureOr<void> register(
    RegisterRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      ApiResponse apiResponse = await registerUseCase.execute(
        event.userName,
        event.email,
        event.password,
      );
      //Map data = json.decode(resp.toString());
      /*  token = data[AppConstants.apiToken];
      UserPrefs.saveUser(data[AppConstants.apiToken].toString());
*
       */
      if (apiResponse.status) {
        emit(RegisterSuccess());
      } else {
        emit(AuthFailure2(apiResponse.message.toString()));
      }
    } catch (ex) {
      emit(AuthFailure2(ex.toString()));
    }
  }

  FutureOr<void> logout(Logout event, Emitter<AuthState> emit) async {
    await logoutUseCase.execute();
  }
}
