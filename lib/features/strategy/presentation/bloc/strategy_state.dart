import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

abstract class StrategyState {}

class StrategyInitial extends StrategyState {}

class StrategyLoading extends StrategyState {}

class StrategyLoaded extends StrategyState {
  final String messages;
  StrategyLoaded(this.messages);
}

class StrategyFailure extends StrategyState {
  final String message;
  StrategyFailure(this.message);
}

class GetTradeSetting extends StrategyState {
  TradeSetting tradeSetting;

  GetTradeSetting(this.tradeSetting);
}
