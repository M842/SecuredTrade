import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';

class DCALevelConfigModel extends DCALevelConfig {
  const DCALevelConfigModel({
    required super.priceDrop,
    required super.capitalPercent,
  });

  Map<String, dynamic> toJson() => {
    "priceDrop": priceDrop,
    "capitalPercent": capitalPercent,
  };

  factory DCALevelConfigModel.fromJson(Map<String, dynamic> json) {
    return DCALevelConfigModel(
      priceDrop: json["priceDrop"],
      capitalPercent: json["capitalPercent"].toDouble(),
    );
  }
}
