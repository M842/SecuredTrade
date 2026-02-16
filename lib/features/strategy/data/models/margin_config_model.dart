import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';

class MarginConfigModel extends MarginConfig {
  const MarginConfigModel({
    required super.marginCallDropPercentage,
    required super.times,
  });

  Map<String, dynamic> toJson() => {
    "marginCallDropPercentage": marginCallDropPercentage,
    "times": times,
  };

  factory MarginConfigModel.fromJson(Map<String, dynamic> json) {
    return MarginConfigModel(
      marginCallDropPercentage: json["marginCallDropPercentage"],
      times: json["times"].toDouble(),
    );
  }
}
