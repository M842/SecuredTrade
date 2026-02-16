import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/home/domain/entities/home.dart';
import 'package:securedtrade/features/home/domain/repositories/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository homeRepository;
  GetHomeDataUseCase(this.homeRepository);

  Future<ApiResponse> execute() {
    return homeRepository.getHomeData();
  }
}
