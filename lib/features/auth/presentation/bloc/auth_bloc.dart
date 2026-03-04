import 'dart:async';
import 'dart:convert';

import 'package:reown_appkit/appkit_modal.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/constants/web3_constants.dart';
import 'package:securedtrade/core/services/wallet_connection_service.dart';
import 'package:securedtrade/core/services/web3_service.dart';
import 'package:securedtrade/features/home/data/models/affilate_user_detail_model.dart';

import 'package:http/http.dart' as http;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  late String address, chainId, topic;
  bool isSubscribed = false, isWalletConnect = false;

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
    on<SubscribeInvestEvent>(subscribeInvest);
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
    isWalletConnect = wcConnectService!.appKitModal.isConnected;
    if (isWalletConnect) {
      final result = await getIsAffiliateUser();
      isSubscribed = result;
    }
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
    wcConnectService!.disconnect();
    await logoutUseCase.execute();
  }

  FutureOr<void> walletConnecting(
    MetamaskRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await wcConnectService!.connect().whenComplete(() async {
      if (wcConnectService!.appKitModal.isConnected) {
        isWalletConnect = wcConnectService!.appKitModal.isConnected;
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
    chainId = wcConnectService!.appKitModal.session!.chainId;
    topic = wcConnectService!.appKitModal.session!.topic!;
    address = (wcConnectService!.appKitModal.session!.getAddress("eip155"))!;
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

  FutureOr<void> subscribeInvest(
    SubscribeInvestEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final web3 = Web3Service(Web3Constants.rpcUrl);
      final result = await web3.getContract(
        abi: Web3Constants.secureTradeAbiJson,
        contractAddress: Web3Constants.contractAddress,
        functionName: Web3Constants.contractFunctionName,
        params: [],
      );
      BigInt mStake = result.first as BigInt;

      final contract = await web3.loadContract(
        Web3Constants.secureTradeAbiJson,
        Web3Constants.contractAddress,
      );

      final mAddress = EthereumAddress.fromHex(address);
      await wcConnectService!.appKitModal
          .requestWriteContract(
            topic: topic,
            chainId: Web3Constants.chianId,
            deployedContract: contract,
            functionName: Web3Constants.buy,

            transaction: Transaction(
              from: mAddress,
              value: EtherAmount.fromBigInt(EtherUnit.wei, mStake),
            ),
          )
          .then((txn) async {
            print(txn);
            if (txn.toString().contains("5000")) {
              SnackbarHelper.show(
                rootNavigatorKey.currentContext!,
                message: txn[AppStrings.apiMessage].toString(),
              );
            } else {
              final result = await ApiClient().getOZoneTransactionStatus(
                txhash: txn,
              );
              if (result == AppStrings.apiSuccessKey) {
                await getIsAffiliateUser();
                emit(InvestSuccessState("Invest & Subscribe Successfully"));
              } else {
                emit(InvestFailedState(result));
              }
            }
          });
    } on JsonRpcError catch (error) {
      print("RPCERROR${error.toString()}");
      emit(InvestFailedState(error.message.toString()));
    } catch (exception) {
      print("OnError${exception.toString()}");
      emit(InvestFailedState(exception.toString()));
    }
  }
}
