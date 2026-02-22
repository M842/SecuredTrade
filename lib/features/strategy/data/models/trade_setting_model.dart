import 'package:securedtrade/core/utils/enums.dart';
import 'package:securedtrade/features/strategy/data/models/margin_config_model.dart';
import 'package:securedtrade/features/strategy/data/models/margin_limit_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

class TradeSettingModel extends TradeSetting {
  TradeSettingModel({
    required super.symbol,

    required super.tradingMode,
    required super.subTradingMode,
    required super.initialBuyPercent,
    required super.maxDcaCount,
    required super.takeProfitPercent,
    required super.trailingStopPercent,
    required super.rsiEntry,
    required super.rsiDca,
    required super.useEmaFilter,
    required super.dcaLevels,
  });

  Map<String, dynamic> toJson() => {
    "tradingMode": tradingMode.value,
    "subTradingMode": subTradingMode.value,
    "symbol": symbol,

    "initialBuyPercent": initialBuyPercent,
    "useEmaFilter": useEmaFilter,
    "maxDcaCount": maxDcaCount,
    "takeProfitPercent": takeProfitPercent,
    "trailingStopPercent": trailingStopPercent,
    "rsiEntry": rsiEntry,
    "rsiDca": rsiDca,
    "dcaLevels": dcaLevels
        .map((e) => (e as DCALevelConfigModel).toJson())
        .toList(),
  };

  factory TradeSettingModel.fromJson(Map<String, dynamic> json) {
    return TradeSettingModel(
      tradingMode: json["tradingMode"],
      subTradingMode: json["subTradingMode"],
      symbol: json["symbol"],
      initialBuyPercent: (json['initialBuyPercent'] ?? 0).toDouble(),
      maxDcaCount: json['maxDcaCount'] ?? 0,
      takeProfitPercent: (json['takeProfitPercent'] ?? 0).toDouble(),
      trailingStopPercent: (json['trailingStopPercent'] ?? 0).toDouble(),
      rsiEntry: (json['rsiEntry'] ?? 0).toDouble(),
      rsiDca: (json['rsiDca'] ?? 0).toDouble(),
      useEmaFilter: json['useEmaFilter'] ?? false,
      dcaLevels: (json["dcsLevels"] as List)
          .map((e) => DCALevelConfigModel.fromJson(e))
          .toList(),
    );
  }
}

extension TradeSettingMapper on TradeSetting {
  TradeSettingModel toModel() {
    return TradeSettingModel(
      tradingMode: tradingMode,
      subTradingMode: subTradingMode,
      symbol: symbol,
      initialBuyPercent: initialBuyPercent,
      takeProfitPercent: takeProfitPercent,
      trailingStopPercent: trailingStopPercent,
      useEmaFilter: useEmaFilter,
      dcaLevels: dcaLevels,
      maxDcaCount: maxDcaCount,
      rsiDca: rsiDca,
      rsiEntry: rsiEntry,
    );
  }
}




