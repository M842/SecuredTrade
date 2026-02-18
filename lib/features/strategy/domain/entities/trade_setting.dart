import 'package:securedtrade/core/utils/enums.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';

class TradeSetting {
  final TradingMode tradingMode;
  final SubTradingMode subTradingMode;
  final String symbol;
  final double initialBuyPercent;
  final int maxDcaCount;
  final double takeProfitPercent;
  final double trailingStopPercent;
  final double rsiEntry;
  final double rsiDca;
  final bool useEmaFilter;

  final List<DCALevelConfig> dcaLevels;

  TradeSetting({
    required this.initialBuyPercent,
    required this.maxDcaCount,
    required this.takeProfitPercent,
    required this.trailingStopPercent,
    required this.rsiEntry,
    required this.rsiDca,
    required this.useEmaFilter,
    required this.dcaLevels,
    required this.tradingMode,
    required this.subTradingMode,
    required this.symbol,
  });
}
