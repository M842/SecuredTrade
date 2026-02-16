import 'package:securedtrade/features/home/data/models/currencies_model.dart';
import 'package:securedtrade/features/home/domain/repositories/home_repository.dart';

class GetSpotCurrencyUseCase {
  final HomeRepository homeRepo;

  GetSpotCurrencyUseCase(this.homeRepo);
  Future<List<CurrenciesModel>> execute(String url) {
    return homeRepo.getSpotCurrencyList(url);
  }
}
