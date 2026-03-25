import 'package:securedtrade/features/dca_spot/data/models/running_bot_model.dart';

class SpotState {}

class SpotInitial extends SpotState {}

class SpotLoading extends SpotState {}

class RunningBotsLoaded extends SpotState {
  List<RunningBotList> list;
  RunningBotsLoaded(this.list);
}

class BotSuccessMessage extends SpotState {
  final String messages;
  BotSuccessMessage(this.messages);
}

class BotFailedMessage extends SpotState {
  final String messages;
  BotFailedMessage(this.messages);
}
