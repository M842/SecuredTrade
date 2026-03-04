import 'package:securedtrade/config/path_config.dart';

class GetNotificationUseCase {
  final HomeRepository repository;

  GetNotificationUseCase(this.repository);
  Future<ApiResponse> execute() {
    return repository.getNotification();
  }
}
