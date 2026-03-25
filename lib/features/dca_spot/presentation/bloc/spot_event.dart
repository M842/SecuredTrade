class SpotEvent {}

class GetPairBotStatus extends SpotEvent {}

class StartBotEvent extends SpotEvent {
  String pair;
  StartBotEvent(this.pair);
}

class StopBotEvent extends SpotEvent {
  String pair;
  StopBotEvent(this.pair);
}
