import 'package:securedtrade/features/home/domain/entities/home.dart';

class HomeModel extends Home {
  HomeModel({required super.balance, required super.username});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      balance: (json['balance'] as num).toDouble(),
      username: json['username'],
    );
  }
}
