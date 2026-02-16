import 'package:securedtrade/core/utils/enums.dart';
import 'package:securedtrade/features/strategy/data/models/margin_config_model.dart';
import 'package:securedtrade/features/strategy/data/models/margin_limit_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

class TradeSettingModel extends TradeSetting {
  TradeSettingModel({
    required super.symbol,
    required super.strategyPeriod,
    required super.strategyMode,
    required super.initialBuyInPrice,
    required super.switchOnMarginCall,
    required super.aiMarginCall,
    required super.firstBuyInAmount,
    required super.marginCallLimit,
    required super.marginCallDropPercent,
    required super.takeProfitRatio,
    required super.earningsCallbackPercent,
    required super.buyInCallbackPercent,
    required super.marginConfigLimits,
    required super.tradingMode,
    required super.subTradingMode,
  });

  Map<String, dynamic> toJson() => {
    "tradingMode": tradingMode.value,
    "subTradingMode": subTradingMode.value,
    "symbol": symbol,
    "strategyPeriod": strategyPeriod.value,
    "strategyMode": strategyMode.value,
    "initialBuyInPrice": initialBuyInPrice,
    "switchOnMarginCall": switchOnMarginCall,
    "aiMarginCall": aiMarginCall,
    "firstBuyInAmount": firstBuyInAmount,
    "marginCallLimit": marginCallLimit,
    "marginCallDropPercent": marginCallDropPercent,
    "takeProfitRatio": takeProfitRatio,
    "earningsCallbackPercent": earningsCallbackPercent,
    "buyInCallbackPercent": buyInCallbackPercent,
    "marginConfigLimits": marginConfigLimits
        .map((e) => (e as MarginConfigModel).toJson())
        .toList(),
  };

  factory TradeSettingModel.fromJson(Map<String, dynamic> json) {
    return TradeSettingModel(
      tradingMode: json["tradingMode"],
      subTradingMode: json["subTradingMode"],
      symbol: json["symbol"],
      strategyPeriod: StrategyPeriodX.fromValue(json["strategyPeriod"]),
      strategyMode: StrategyModeX.fromValue(json["strategyMode"]),
      initialBuyInPrice: json["initialBuyInPrice"]?.toDouble(),
      switchOnMarginCall: json["switchOnMarginCall"],
      aiMarginCall: json["aiMarginCall"],
      firstBuyInAmount: json["firstBuyInAmount"].toDouble(),
      marginCallLimit: json["marginCallLimit"],
      marginCallDropPercent: json["marginCallDropPercent"].toDouble(),
      takeProfitRatio: json["takeProfitRatio"].toDouble(),
      earningsCallbackPercent: json["earningsCallbackPercent"].toDouble(),
      buyInCallbackPercent: json["buyInCallbackPercent"].toDouble(),
      marginConfigLimits: (json["marginConfigLimits"] as List)
          .map((e) => MarginConfigModel.fromJson(e))
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
      strategyPeriod: strategyPeriod,
      strategyMode: strategyMode,
      initialBuyInPrice: initialBuyInPrice,
      switchOnMarginCall: switchOnMarginCall,
      aiMarginCall: aiMarginCall,
      firstBuyInAmount: firstBuyInAmount,
      marginCallLimit: marginCallLimit,
      marginCallDropPercent: marginCallDropPercent,
      takeProfitRatio: takeProfitRatio,
      earningsCallbackPercent: earningsCallbackPercent,
      buyInCallbackPercent: buyInCallbackPercent,
      marginConfigLimits: marginConfigLimits,
    );
  }
}
