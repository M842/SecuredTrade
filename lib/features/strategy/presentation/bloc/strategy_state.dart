import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

abstract class StrategyState {}

class StrategyInitial extends StrategyState {}

class StrategyLoading extends StrategyState {}

class StrategyLoaded extends StrategyState {
  final String messages;
  StrategyLoaded(this.messages);
}

class TradeSettingSaved extends StrategyState {
  final String messages;
  TradeSettingSaved(this.messages);
}

class BotActivatedState extends StrategyState {
  final String messages;
  BotActivatedState(this.messages);
}

class ActivationFailure extends StrategyState {
  final String messages;
  ActivationFailure(this.messages);
}

class StrategyFailure extends StrategyState {
  final String message;
  StrategyFailure(this.message);
}

class TradeSettingLoaded extends StrategyState {
  SpotTradeSettingModel? tradeSetting;

  TradeSettingLoaded(this.tradeSetting);
}
