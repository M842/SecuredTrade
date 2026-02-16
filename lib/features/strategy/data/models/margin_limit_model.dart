import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';

class MarginLimitModel extends MarginLimit {
  const MarginLimitModel({
    required super.marginCallCount,
    required super.dropRate,
    required super.buyUsdt,
  });

  Map<String, dynamic> toJson() => {
    "marginCallCount": marginCallCount,
    "dropRate": dropRate,
    "buyUsdt": buyUsdt,
  };

  factory MarginLimitModel.fromJson(Map<String, dynamic> json) {
    return MarginLimitModel(
      marginCallCount: json["marginCallCount"],
      dropRate: json["dropRate"].toDouble(),
      buyUsdt: json["buyUsdt"].toDouble(),
    );
  }
}
