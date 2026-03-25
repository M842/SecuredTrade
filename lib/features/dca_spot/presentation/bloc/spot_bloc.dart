import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/dca_spot/data/models/running_bot_model.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/running_bots_usecase.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/start_bot_usecase.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/stop_bot_usecase.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_event.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_state.dart';
import 'package:securedtrade/features/strategy/domain/usecases/stop_bot_usecase.dart';

class SpotBloc extends Bloc<SpotEvent, SpotState> {
  final RunningBotsUseCase runningBotsUseCase;
  final StartBotUseCase startBotUseCase;
  final StopBotUseCase2 stopBotUseCase;
  List<RunningBotList> runningBotsList = [];
  SpotBloc(this.runningBotsUseCase, this.startBotUseCase, this.stopBotUseCase)
    : super(SpotInitial()) {
    on<GetPairBotStatus>(getPairedBotStatus);
    on<StartBotEvent>(startBot);
    on<StopBotEvent>(stopBot);
  }

  FutureOr<void> getPairedBotStatus(
    GetPairBotStatus event,
    Emitter<SpotState> emit,
  ) async {
    emit(SpotInitial());

    ApiResponse apiResponse = await runningBotsUseCase.execute();
    if (apiResponse.status) {
      RunningBotModel m = runningBotModelFromJson(apiResponse.data);
      runningBotsList = m.data;
      emit(RunningBotsLoaded(runningBotsList));
    }
  }

  FutureOr<void> startBot(StartBotEvent event, Emitter<SpotState> emit) async {
    ApiResponse apiResponse = await startBotUseCase.execute(event.pair);
    if (apiResponse.status) {
      add(GetPairBotStatus());
      emit(BotSuccessMessage(apiResponse.message.toString()));
    } else {
      emit(BotFailedMessage(apiResponse.message.toString()));
    }
  }

  FutureOr<void> stopBot(StopBotEvent event, Emitter<SpotState> emit) async {
    ApiResponse apiResponse = await stopBotUseCase.execute(event.pair);
    if (apiResponse.status) {
      add(GetPairBotStatus());
      emit(BotSuccessMessage(apiResponse.message.toString()));
    } else {
      emit(BotFailedMessage(apiResponse.message.toString()));
    }
  }
}
