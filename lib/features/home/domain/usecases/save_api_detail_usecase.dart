import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/home/domain/repositories/home_repository.dart';

class SaveApiDetailUseCase {
  final HomeRepository repository;
  SaveApiDetailUseCase(this.repository);

  Future<ApiResponse> execute(Map<String, dynamic> encrypt, String keyOtp) {
    return repository.saveApiKeys(encrypt, keyOtp);
  }
}
