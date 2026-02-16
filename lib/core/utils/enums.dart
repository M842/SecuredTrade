enum AuthStatus { unknown, authenticated, unauthenticated }

enum StatusBarStyle {
  lightTransparent,
  darkTransparent,
  darkWhite,
  lightPrimary,
}

enum TradingMode { spot, future, arbitrage }

enum SubTradingMode { martingale, grid }

enum StrategyPeriod { cycle, oneShot }

enum StrategyMode {
  wholeWarehouseMode,
  subBinMode,
  subBinModeRealTimeSettlement,
}

// enums.dart

extension StrategyPeriodX on StrategyPeriod {
  String get value => name; // Dart 2.17+

  static StrategyPeriod fromValue(String value) => StrategyPeriod.values
      .firstWhere((e) => e.name == value, orElse: () => StrategyPeriod.oneShot);
}

extension StrategyModeX on StrategyMode {
  String get value => name;

  static StrategyMode fromValue(String value) => StrategyMode.values.firstWhere(
    (e) => e.name == value,
    orElse: () => StrategyMode.wholeWarehouseMode,
  );
}

extension TradingModeX on TradingMode {
  String get value => name;

  static TradingMode fromValue(String value) => TradingMode.values.firstWhere(
    (e) => e.name == value,
    orElse: () => TradingMode.spot,
  );
}

extension SubTradingModeX on SubTradingMode {
  String get value => name;

  static SubTradingMode fromValue(String value) =>
      SubTradingMode.values.firstWhere(
        (e) => e.name == value,
        orElse: () => SubTradingMode.martingale,
      );
}
