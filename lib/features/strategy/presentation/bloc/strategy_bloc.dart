import 'dart:async';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/domain/usecases/activate_bot_usecase.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyState> {
  final GetTradeSettingUseCase tradeSettingUseCase;
  final SaveTradeSettingUseCase saveTradeSettingUseCase;
  final ActivateBotUseCase activateBotUseCase;
  StrategyBloc(
    this.tradeSettingUseCase,
    this.saveTradeSettingUseCase,
    this.activateBotUseCase,
  ) : super((StrategyInitial())) {
    on<GetTradeSettingData>(getTradeSettingData);
    on<SaveTradeSettingData>(saveTradeSetting);
    on<SetBotActivation>(activateBot);
  }

  FutureOr<void> saveTradeSetting(
    SaveTradeSettingData event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await saveTradeSettingUseCase.execute(
      event.params,
    );
    if (apiResponse.status) {
      add(GetTradeSettingData(pair: event.params["pair"]));
      emit(TradeSettingSaved(apiResponse.message.toString()));
    } else {
      emit(StrategyFailure(apiResponse.message.toString()));
    }
  }

  FutureOr<void> activateBot(
    SetBotActivation event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await activateBotUseCase.execute(event.pair);
    if (apiResponse.status) {
      add(GetTradeSettingData(pair: event.pair));
      emit(BotActivatedState(apiResponse.message.toString()));
    } else {
      emit(ActivationFailure(apiResponse.message.toString()));
    }
  }

  FutureOr<void> getTradeSettingData(
    GetTradeSettingData event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await tradeSettingUseCase.execute(event.pair);

    if (apiResponse.data != null) {
      SpotTradeSettingModel spConfig = apiResponse.data;
      //TradeSetting s = apiResponse.data;

      emit(TradeSettingLoaded(spConfig));
    } else {
      emit(StrategyFailure(apiResponse.message.toString()));
    }
  }
}
