import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/domain/usecases/logout_usecase.dart';
import 'package:securedtrade/features/auth/domain/usecases/register_usecase.dart';
import 'package:securedtrade/features/home/domain/usecases/save_api_detail_usecase.dart';
import 'package:securedtrade/features/home/domain/usecases/send_code_usecase.dart';
import 'package:securedtrade/features/strategy/data/datasources/stratregy_remote_datasource.dart';
import 'package:securedtrade/features/strategy/data/repositories/strategy_repository_impl.dart';
import 'package:securedtrade/features/strategy/domain/usecases/get_trade_setting_usecase.dart';
import 'package:securedtrade/features/strategy/domain/usecases/save_trade_setting_usecase.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_bloc.dart';

void main() {
  Env.init(AppEnvironment.dev);
  final local = AuthLocalDataSourceImpl();
  final remote = AuthRemoteDataSourceImpl();
  final apiClient = ApiClient();
  final repository = AuthRepositoryImpl(remote, local, apiClient);

  final homeRemote = HomeRemoteDataSourceImpl();
  final homeRepo = HomeRepositoryImpl(homeRemote);

  final strategyRemote = StrategyRemoteDataSourceImpl();
  final strategyRepo = StrategyRepositoryImpl(strategyRemote);

  runApp(
    MultiBlocListener(
      listeners: [
        BlocProvider(
          create: (_) => AuthBloc(
            CheckAuthStatusUseCase(repository),
            LoginUseCase(repository),
            RegisterUseCase(repository),
            LogoutUseCase(repository),
          ),
        ),
        BlocProvider(
          create: (_) => HomeBloc(
            GetHomeDataUseCase(homeRepo),
            GetApiKeyUseCase(homeRepo),
            GetSpotCurrencyUseCase(homeRepo),
            SendCodeUseCase(homeRepo),
            SaveApiDetailUseCase(homeRepo),
          ),
        ),

        BlocProvider(
          create: (_) => StrategyBloc(
            GetTradeSettingUseCase(strategyRepo),
            SaveTradeSettingUseCase(strategyRepo),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
