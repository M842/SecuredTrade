abstract class StrategyEvent {}

class GetTradeSettingData extends StrategyEvent {
  final String pair;
  GetTradeSettingData({required this.pair});
}

class SetBotActivation extends StrategyEvent {
  final String pair;
  SetBotActivation({required this.pair});
}

class SaveTradeSettingData extends StrategyEvent {
  final Map<dynamic, dynamic> params;
  SaveTradeSettingData({required this.params});
}
