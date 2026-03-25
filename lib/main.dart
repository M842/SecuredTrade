import 'package:firebase_core/firebase_core.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/wallet_connection_service.dart';
import 'package:securedtrade/features/dca_spot/data/datasources/spot_remote_datasource.dart';
import 'package:securedtrade/features/dca_spot/data/repositories/spot_repository_impl.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/running_bots_usecase.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/start_bot_usecase.dart';
import 'package:securedtrade/features/dca_spot/domain/usecases/stop_bot_usecase.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_bloc.dart';
import 'package:securedtrade/features/strategy/domain/usecases/activate_bot_usecase.dart';
import 'package:securedtrade/features/strategy/domain/usecases/stop_bot_usecase.dart';
import 'package:securedtrade/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Env.init(AppEnvironment.dev);

  wcConnectService = WalletConnectService();
  final local = AuthLocalDataSourceImpl();
  final remote = AuthRemoteDataSourceImpl();
  final apiClient = ApiClient();
  final repository = AuthRepositoryImpl(remote, local, apiClient);

  final homeRemote = HomeRemoteDataSourceImpl();
  final homeRepo = HomeRepositoryImpl(homeRemote);

  final strategyRemote = StrategyRemoteDataSourceImpl();
  final strategyRepo = StrategyRepositoryImpl(strategyRemote);

  final spotRemoteImpl = SpotRemoteDataSourceImpl();
  final spotRepo = SpotRepositoryImpl(spotRemoteImpl);

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
            GetNotificationUseCase(homeRepo),
            CheckTokenStatusUseCase(homeRepo),
          ),
        ),

        BlocProvider(
          create: (_) => StrategyBloc(
            GetTradeSettingUseCase(strategyRepo),
            SaveTradeSettingUseCase(strategyRepo),
            ActivateBotUseCase(strategyRepo),
            StopBotUseCase(strategyRepo),
          ),
        ),
        BlocProvider(
          create: (_) => SpotBloc(
            RunningBotsUseCase(spotRepo),
            StartBotUseCase(spotRepo),
            StopBotUseCase2(spotRepo),
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
