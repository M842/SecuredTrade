import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/domain/usecases/get_trade_setting_usecase.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_event.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';

class StrategyBloc extends Bloc<StrategyEvent, StrategyState> {
  final GetTradeSettingUseCase tradeSettingUseCase;

  StrategyBloc(this.tradeSettingUseCase) : super((StrategyInitial())) {
    on<GetTradeSettingData>(getTradeSettingData);
  }

  FutureOr<void> getTradeSettingData(
    GetTradeSettingData event,
    Emitter<StrategyState> emit,
  ) async {
    ApiResponse apiResponse = await tradeSettingUseCase.execute("SOLUSDT");
    print(apiResponse.data);
  }
}
