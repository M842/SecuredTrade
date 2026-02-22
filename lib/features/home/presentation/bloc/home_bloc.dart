import 'dart:async';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/home/domain/usecases/save_api_detail_usecase.dart';
import 'package:securedtrade/features/home/domain/usecases/send_code_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase homeDataUseCase;
  final GetApiKeyUseCase getApiKeyUseCase;
  final GetSpotCurrencyUseCase getSpotCurrencyUseCase;
  final SendCodeUseCase sendCodeUseCase;
  final SaveApiDetailUseCase saveApiCredUseCase;

  List<CurrenciesModel> usdtCurrenciesList = [];
  List<CurrenciesModel> btcCurrenciesList = [];

  HomeBloc(
    this.homeDataUseCase,
    this.getApiKeyUseCase,
    this.getSpotCurrencyUseCase,
    this.sendCodeUseCase,
    this.saveApiCredUseCase,
  ) : super(HomeInitial()) {
    on<LoadHomeEvent>(_onLoadHome);
    on<LoadKeyEvent>(getApiKeys);
    on<GetSpotCurrencies>(getSpotCurrencyList);
    on<SentOTP>(sendOtp);
    on<ApiManageRequest>(saveApiCredential);
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
}
