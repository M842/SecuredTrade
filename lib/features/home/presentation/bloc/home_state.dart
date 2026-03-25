import "package:securedtrade/config/path_config.dart";
import "package:securedtrade/features/home/domain/entities/payout_model.dart";

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String messages;
  HomeLoaded(this.messages);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}

class SpotCurrenciesLoaded extends HomeState {
  final List<CurrenciesModel> usdtCurrencies;
  final List<CurrenciesModel> btcCurrencies;
  SpotCurrenciesLoaded({
    required this.usdtCurrencies,
    required this.btcCurrencies,
  });
}

class GetApiKeysLoaded extends HomeState {
  final String apiKey, secretKey;
  GetApiKeysLoaded({required this.apiKey, required this.secretKey});
}



class PayoutSuccessLoad extends HomeState{
  final List<PayoutModel>payoutList;
  PayoutSuccessLoad(this.payoutList);
}

class ApiKeysNotExist extends HomeState {
  final String error;
  ApiKeysNotExist({required this.error});
}



class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
