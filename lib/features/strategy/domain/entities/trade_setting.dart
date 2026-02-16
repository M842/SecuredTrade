import 'package:securedtrade/core/utils/enums.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';

class TradeSetting {
  final TradingMode tradingMode;
  final SubTradingMode subTradingMode;
  final String symbol;
  final StrategyPeriod strategyPeriod;
  final StrategyMode strategyMode;

  /// true only when strategyMode == StrategyMode.cycle
  final double? initialBuyInPrice;

  final bool switchOnMarginCall;
  final bool aiMarginCall;
  final double firstBuyInAmount;
  final List<MarginConfig> marginConfigLimits;
  final String marginCallLimit;
  final double marginCallDropPercent;

  final double takeProfitRatio;
  final double earningsCallbackPercent;
  final double buyInCallbackPercent;

  TradeSetting({
    required this.tradingMode,
    required this.subTradingMode,
    required this.symbol,
    required this.strategyPeriod,
    required this.strategyMode,
    this.initialBuyInPrice,
    required this.switchOnMarginCall,
    required this.aiMarginCall,
    required this.firstBuyInAmount,
    required this.marginConfigLimits,
    required this.marginCallLimit,
    required this.marginCallDropPercent,
    required this.takeProfitRatio,
    required this.earningsCallbackPercent,
    required this.buyInCallbackPercent,
  });
}
