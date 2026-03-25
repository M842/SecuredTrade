import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:reown_appkit/appkit_modal.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/constants/web3_constants.dart';
import 'package:securedtrade/core/services/wallet_connection_service.dart';
import 'package:securedtrade/core/services/web3_service.dart';
import 'package:securedtrade/features/auth/data/models/burn_nfts_list_model.dart';
import 'package:securedtrade/features/auth/data/models/user_held_nfts_model.dart';

import 'package:http/http.dart' as http;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  late String address, chainId, topic;
  bool isSubscribed = false, isMetamaskConnected = false;

  late BigInt bigIntUserId;

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
    on<UserHeldNFTsDetailEvent>(getUserHoldNFTsDetail);
    on<BurnNFTsEvent>(burnNFtsEvent);
    //on<GetUserIdFromAddressEvent>(getUserIdFromAddressEvent);
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
    isMetamaskConnected = wcConnectService!.appKitModal.isConnected;

    if (isMetamaskConnected) {
      chainId = wcConnectService!.appKitModal.session!.chainId;

      topic = wcConnectService!.appKitModal.session!.topic!;
      address = (wcConnectService!.appKitModal.session!.getAddress("eip155"))!;
      isSubscribed = await checkIsUserSubscribed();
    }

    /* // final result = await getIsAffiliateUser();
      //isSubscribed = result;
      //add(GetUserIdFromAddressEvent(address));
      // add(GetUserHeldNFTsDetailEvent());*/

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
        isMetamaskConnected = wcConnectService!.appKitModal.isConnected;
        address = (wcConnectService!.appKitModal.session!.getAddress(
          "eip155",
        ))!;
        final result = await checkIsUserSubscribed();
        add(UserHeldNFTsDetailEvent());
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
  /*

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
      if (m.data.first.isNotEmpty) {
        return m.data.first.first.isActive;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
*/

  FutureOr<void> getUserHoldNFTsDetail(
    UserHeldNFTsDetailEvent event,
    Emitter<AuthState> emit,
  ) async {
    List<NFTsBurnModelList> nftBurnModelList = [];
    final web3 = Web3Service(Web3Constants.rpcUrl);
    //0xE77aB47de567b3a79849F38dbAd1d321b3ACE9d8
    String url = "${AppConstants.getUserHoldNFTDetailUrl}$address";
    final httpResponse = await http.get(Uri.parse(url));
    Map params = json.decode(httpResponse.body);
    print("object$params");

    if (params[AppConstants.apiSuccessKey]) {
      UserHeldNfTsModel m = userHeldNfTsModelFromJson(httpResponse.body);
      if (m.data.isNotEmpty && m.data.first.isNotEmpty) {
        print("ISEMPTY");
        for (int i = 0; i < m.data.length; i++) {
          final balance = await web3.getContract(
            abi: Web3Constants.secureTradeORCAbiJson,
            contractAddress: m.data[i].first.orc1155,
            functionName: Web3Constants.getBalanceContractFunction,
            params: [
              EthereumAddress.fromHex(address),
              BigInt.from(int.parse(m.data[i].first.tokenId)),
            ],
          );

          final nftTokenId = await web3.getContract(
            abi: Web3Constants.secureTradeORCAbiJson,
            contractAddress: m.data[i].first.orc1155,
            functionName: Web3Constants.getIdsContractFunction,
            params: [BigInt.from(0)],
          );

          final nftName = await web3.getContract(
            abi: Web3Constants.secureTradeORCAbiJson,
            contractAddress: m.data[i].first.orc1155,
            functionName: Web3Constants.getNamesContractFunction,
            params: [BigInt.from(0)],
          );
          final nftUri = await web3.getContract(
            abi: Web3Constants.secureTradeORCAbiJson,
            contractAddress: m.data[i].first.orc1155,
            functionName: Web3Constants.getUriContractFunction,
            params: [nftTokenId.first],
          );

          const target = "0x250f1148511182e4Fa1a200Bd0d9E885A3259574";

          final user = EthereumAddress.fromHex(address);

          // Define function
          final function = ContractFunction('subscribed', [
            const FunctionParameter('_user', AddressType()),
          ]);

          // Encode call data
          final data = function.encodeCall([user]);

          // Convert to hex
          final dataHex = bytesToHex(data, include0x: true);

          // Build payload (target + calldata)
          final payload =
              "0x" + target.substring(2) + dataHex.replaceFirst("0x", "");

          print(payload);

          final response = await http.get(Uri.parse(nftUri.first));
          final metaData = json.decode(response.body);
          nftBurnModelList.add(
            NFTsBurnModelList(
              payload: payload,
              nftTokenId: nftTokenId.first.toString(),
              nftImage: metaData["image"],
              nftName: nftName.first.toString(),
            ),
          );
        }

        emit(GetUserHeldBurnNFTs(nftsBurnList: nftBurnModelList));
      }
    }
  }

  /* FutureOr<void> todayInvestmentEvent(
    TodaySubsInvestmentEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final web3 = Web3Service(Web3Constants.rpcUrl);
      final result = await web3.getContract(
        abi: Web3Constants.secureTradeAbiJson,
        contractAddress: Web3Constants.contractAddress,
        functionName: Web3Constants.minimumStakeContractFunction,
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
            functionName: Web3Constants.buyContractFunction,

            // transaction: Transaction(
            //               from: EthereumAddress.fromHex(address),
            //               value: EtherAmount.fromUnitAndValue(
            //                 EtherUnit.wei,
            //                 computeMintFees.first,
            //               ),
            //             ),
            transaction: Transaction(
              from: mAddress,
              value: EtherAmount.fromBigInt(EtherUnit.wei, mStake),
            ),
          )
          .then((txn) async {
            print("$txn  ||$address");
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
  }*/

  /*// FutureOr<void> getUserIdFromAddressEvent(
  //   GetUserIdFromAddressEvent event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   final web3 = Web3Service(Web3Constants.rpcUrl);
  //
  //   final result = await web3.getContract(
  //     abi: Web3Constants.secureTradeNestedAbiJson,
  //     contractAddress: Web3Constants.nestedContractAddress,
  //     functionName: Web3Constants.getUserIdContractFunction,
  //     params: [EthereumAddress.fromHex(event.address)],
  //   );
  //   bigIntUserId = result.first;
  // }*/

  FutureOr<void> burnNFtsEvent(
    BurnNFTsEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final web3 = Web3Service(Web3Constants.rpcUrl);
      final contract = await web3.loadContract(
        Web3Constants.secureTradeORCAbiJson,
        "0x40a05fe4d0fc27b46a00f00d5626eff5835a463e",
      );
      final payloadBytes = hexToBytes(event.payload);
      await wcConnectService!.appKitModal
          .requestWriteContract(
            topic: topic,
            chainId: Web3Constants.chianId,
            deployedContract: contract,
            functionName: Web3Constants.burnNFTsContractFunction,
            parameters: [
              BigInt.from(int.parse(event.tokenId)),
              BigInt.from(1),
              payloadBytes,
            ],
            transaction: Transaction(from: EthereumAddress.fromHex(address)),
          )
          .then((txn) async {
            print("$txn  ||$address");
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
                isSubscribed = await checkIsUserSubscribed();
                emit(NFtsBurnSuccessState("Invest & Subscribe Successfully"));
              } else {
                emit(NFTsBurnFailedState(result));
              }
            }
          });
    } on JsonRpcError catch (error) {
      print("JsonRPCERROR${error.toString()}");
      emit(NFTsBurnFailedState(error.message.toString()));
    } catch (exception) {
      print("OnError${exception.toString()}");
      emit(NFTsBurnFailedState(exception.toString()));
    }
  }

  Future<bool> checkIsUserSubscribed() async {
    final mAddress = EthereumAddress.fromHex(address);
    final web3 = Web3Service(Web3Constants.rpcUrl);
    final result = await web3.getContract(
      functionName: Web3Constants.getIsSubscribedContractFunction,
      params: [mAddress],
    );
    return result.first;
  }
}
