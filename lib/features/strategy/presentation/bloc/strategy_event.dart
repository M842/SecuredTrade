abstract class StrategyEvent {}

class GetTradeSettingData extends StrategyEvent {
  final String pair;
  GetTradeSettingData({required this.pair});
}

class SaveTradeSettingData extends StrategyEvent {
  final Map<String, dynamic> params;
  SaveTradeSettingData({required this.params});
}
