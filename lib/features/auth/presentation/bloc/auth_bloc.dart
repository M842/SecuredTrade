import 'dart:async';
import 'dart:convert';

import 'package:reown_appkit/appkit_modal.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/wallet_connection_service.dart';
import 'package:securedtrade/features/home/data/models/affilate_user_detail_model.dart';

import 'package:http/http.dart' as http;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  late String address;

  bool isSubscribed = false;

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
    on<MetamaskRequest>(walletConnecting);
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
    await wcConnectService!.initializeWallet(rootNavigatorKey.currentContext!);
    isSubscribed = wcConnectService!.appKitModal.isConnected;
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

  FutureOr<void> walletConnecting(
    MetamaskRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await wcConnectService!.connect().whenComplete(() async {
      if (wcConnectService!.appKitModal.isConnected) {
        address = (wcConnectService!.appKitModal.session!.getAddress(
          "eip155",
        ))!;
        final result = await getIsAffiliateUser();
        isSubscribed = result;

        if (!result) {
          emit(
            UserSubscriptionFailed(
              "Address not subscribed. Kindly complete subscription process",
            ),
          );
        } else {
          emit(UserSubscribed(isSubscribed: isSubscribed));
        }
      }
    });
  }

  Future getIsAffiliateUser() async {
    String url = "${AppConstants.getIsUserAffiliateUrl}$address";
    final httpResponse = await http.get(Uri.parse(url));
    Map params = json.decode(httpResponse.body);
    if (params[AppConstants.apiSuccessKey]) {
      AffiliateUserDetailModel m = affiliateUserDetailFromJson(
        httpResponse.body,
      );
      print(m.data.first.isNotEmpty);
      if (m.data.first.isNotEmpty) {
        return m.data.first.first.isActive;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
