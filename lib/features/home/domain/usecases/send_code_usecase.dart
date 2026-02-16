import 'package:securedtrade/core/network/api_response.dart';
import 'package:securedtrade/features/home/domain/repositories/home_repository.dart';

class SendCodeUseCase {
  final HomeRepository repository;
  SendCodeUseCase(this.repository);

  Future<ApiResponse> execute() {
    return repository.sendOtp();
  }
}
