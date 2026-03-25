import 'dart:async';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/domain/entities/payout_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase homeDataUseCase;
  final GetApiKeyUseCase getApiKeyUseCase;
  final GetSpotCurrencyUseCase getSpotCurrencyUseCase;
  final SendCodeUseCase sendCodeUseCase;
  final SaveApiDetailUseCase saveApiCredUseCase;
  final GetNotificationUseCase getNotificationUseCase;
  final CheckTokenStatusUseCase checkTokenStatusUseCase;

  List<CurrenciesModel> usdtCurrenciesList = [];
  List<CurrenciesModel> btcCurrenciesList = [];

  Timer? timer;

  //late BigInt bigIntUserId;

  HomeBloc(
    this.homeDataUseCase,
    this.getApiKeyUseCase,
    this.getSpotCurrencyUseCase,
    this.sendCodeUseCase,
    this.saveApiCredUseCase,
    this.getNotificationUseCase,
    this.checkTokenStatusUseCase,
  ) : super(HomeInitial()) {
    on<LoadHomeEvent>(_onLoadHome);
    on<LoadKeyEvent>(getApiKeys);
    on<GetSpotCurrencies>(getSpotCurrencyList);
    on<SentOTP>(sendOtp);
    on<ApiManageRequest>(saveApiCredential);
    on<GetNotificationEvent>(getNotification);
    on<StartAutoCheckEvent>(onStartAutoCheck);
    on<CheckTokenStatusEvent>(onCheckTokenStatus);

    on<LoadPayout>(loadPayoutEvent);
  }

  Future<void> _onLoadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      ApiResponse apiResponse = await homeDataUseCase.execute();

      if (apiResponse.status) {
        emit(HomeLoaded('Successful login'));
      } else {
        emit(HomeFailure("Your session has expired. Please login again."));
      }
    } on NetworkException catch (e) {
      print(e.toString());
      emit(HomeFailure(e.toString()));
    }
  }

  FutureOr<void> getApiKeys(LoadKeyEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    ApiResponse apiResponse = await getApiKeyUseCase.execute();
    print(apiResponse.data);
    if (apiResponse.status) {
      emit(
        GetApiKeysLoaded(
          apiKey: apiResponse.data["apikey"],
          secretKey: apiResponse.data["secretkey"],
        ),
      );
    } else {
      emit(ApiKeysNotExist(error: apiResponse.message.toString()));
    }
  }

  FutureOr<void> getSpotCurrencyList(
    GetSpotCurrencies event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final data = await getSpotCurrencyUseCase.execute(event.url);

    var usdtCoins = data.where((item) {
      return item.symbol.toString().endsWith("USDT");
    }).toList();

    usdtCoins.sort(
      (a, b) =>
          double.parse(b.quoteVolume).compareTo(double.parse(a.quoteVolume)),
    );

    usdtCoins = usdtCoins.take(20).toList();
    var btcCoins = data.where((item) {
      return item.symbol.toString().endsWith("BTC");
    }).toList();
    btcCoins.sort(
      (a, b) => double.parse(
        b.quoteVolume,
      ).compareTo(double.parse(a.quoteVolume ?? '0')),
    );
    btcCoins = btcCoins.take(20).toList();
    usdtCurrenciesList = usdtCoins;
    btcCurrenciesList = btcCoins;
    emit(
      SpotCurrenciesLoaded(
        usdtCurrencies: usdtCurrenciesList,
        btcCurrencies: btcCurrenciesList,
      ),
    );
  }

  FutureOr<void> sendOtp(SentOTP event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    ApiResponse apiResponse = await sendCodeUseCase.execute();
    if (apiResponse.status) {
      SnackbarHelper.show(
        event.context,
        message: apiResponse.message.toString(),
        backgroundColor: AppColors.green,
      );
    } else {
      SnackbarHelper.show(
        event.context,
        message: apiResponse.message.toString(),
      );
    }
  }

  FutureOr<void> saveApiCredential(
    ApiManageRequest event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    print("bLOcobject");
    ApiResponse apiResponse = await saveApiCredUseCase.execute(
      event.encrypt,
      event.keyOtp,
    );
    if (apiResponse.status) {
      add(LoadKeyEvent());
      emit(HomeLoaded(apiResponse.message.toString()));
    } else {
      emit(HomeError(apiResponse.message.toString()));
    }
  }

  FutureOr<void> getNotification(
    GetNotificationEvent event,
    Emitter<HomeState> emit,
  ) async {
    final apiResponse = await getNotificationUseCase.execute();
    if (apiResponse.status) {}
  }

  FutureOr<void> onStartAutoCheck(
    StartAutoCheckEvent event,
    Emitter<HomeState> emit,
  ) {
    timer = Timer.periodic(
      Duration(minutes: 20),
      (_) => add(CheckTokenStatusEvent()),
    );
  }

  FutureOr<void> onCheckTokenStatus(
    CheckTokenStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final apiResponse = await checkTokenStatusUseCase.execute();
    if (!apiResponse.status) {
      DialogUtils.forceLogout(
        context: rootNavigatorKey.currentContext!,
        title: "Session Expired",
        message: "Your session has expired. Please login again.",
      );
    }
  }

  FutureOr<void> loadPayoutEvent(
    LoadPayout event,
    Emitter<HomeState> emit,
  ) async {
    List<PayoutModel> temp = [];
    final web3 = Web3Service(Web3Constants.rpcUrl);
    final result = await web3.getContract(
      functionName: Web3Constants.getTotalBuysContractFunction,
      params: [event.userId],
    );

    for (int i = 0; i < result.length; i++) {
      final buyId = await getBuyId(web3, BigInt.from(i), event.userId);
      final payout = await getPayout(web3, buyId);
      temp.add(payout);
    }

    emit(PayoutSuccessLoad(temp.reversed.toList()));
    // await getPayout(web3, result2.first);
    //print(result2);
  }

  Future<PayoutModel> getPayout(Web3Service web3, BigInt buyId) async {
    final result = await web3.getContract(
      functionName: Web3Constants.getPayoutContractFunction,
      params: [buyId],
    );

    print(result);
    return PayoutModel.fromList(result);
  }

  Future<BigInt> getBuyId(
    Web3Service web3,
    BigInt bigIntIndex,
    BigInt userId,
  ) async {
    final result2 = await web3.getContract(
      functionName: Web3Constants.getBuysIdContractFunction,
      params: [userId, bigIntIndex],
    );

    return result2.first;
  }
}
