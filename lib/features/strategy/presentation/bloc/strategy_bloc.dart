import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/domain/usecases/get_trade_setting_usecase.dart';
import 'package:securedtrade/features/strategy/domain/usecases/save_trade_setting_usecase.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_event.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyState> {
  final GetTradeSettingUseCase tradeSettingUseCase;
  final SaveTradeSettingUseCase saveTradeSettingUseCase;
  StrategyBloc(this.tradeSettingUseCase, this.saveTradeSettingUseCase)
    : super((StrategyInitial())) {
    on<GetTradeSettingData>(getTradeSettingData);
    on<SaveTradeSettingData>(saveTradeSetting);
  }

  FutureOr<void> saveTradeSetting(
    SaveTradeSettingData event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await saveTradeSettingUseCase.execute(
      event.params,
    );
    if (apiResponse.status) {
      print(apiResponse.message);
      emit(TradeSettingSaved(apiResponse.message.toString()));
    } else {
      emit(StrategyFailure(apiResponse.message.toString()));
    }
  }

  FutureOr<void> getTradeSettingData(
    GetTradeSettingData event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await tradeSettingUseCase.execute(event.pair);
    //
    if (apiResponse.data != null) {
      TradeSetting tradeSetting = apiResponse.data;
      emit(TradeSettingLoaded(tradeSetting));
    }
  }
}
