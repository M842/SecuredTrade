import 'package:go_router/go_router.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/wallet_connection_service.dart';
import 'package:securedtrade/features/auth/presentation/screens/login_screen.dart';
import 'package:securedtrade/features/auth/presentation/screens/register_screen.dart';
import 'package:securedtrade/features/auth/presentation/screens/splash_screen.dart';
import 'package:securedtrade/features/auth/presentation/screens/verfication_screen.dart';
import 'package:securedtrade/features/dashboard/dashboard_screen.dart';
import 'package:securedtrade/features/dashboard/notification_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/api_manage_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/currency_details_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/profit_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/reward_details_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/user_guide_screen.dart';
import 'package:securedtrade/features/profile/edit_profile_screen.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/presentation/screens/create_bot_screen.dart';
import 'package:securedtrade/features/strategy/presentation/screens/margin_config_screen.dart';
import 'package:securedtrade/features/strategy/presentation/screens/trade_setting_screen.dart';
import 'package:securedtrade/features/home/presentation/screens/deposit_screen.dart';
import 'package:securedtrade/main.dart';

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutePaths.root,
  routes: [
    GoRoute(
      path: AppRoutePaths.root,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.deposit,
      builder: (context, state) => const DepositNftScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.editProfile,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.emailVerification,
      builder: (context, state) => const VerificationScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.apiManage,
      builder: (context, state) => const ApiManageScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.createBot,
      builder: (context, state) {
        //final symbol2 = state.extra as String;
        final params = state.extra as Map;
        return CreateBotScreen(
          symbol: params[AppConstants.symbolKey],
          tradingMode: params[AppConstants.tradingModeKey],
        );
      },
    ),
    GoRoute(
      path: AppRoutePaths.profitDetail,
      builder: (context, state) => const ProfitScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.rewardDetail,
      builder: (context, state) => const RewardDetailScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.marginConfig,

      builder: (context, state) {
        final count = state.extra as List<DcaLevel>;
        return MarginConfigurationScreen(dcaLevelList: count);
      },
    ),
    GoRoute(
      path: AppRoutePaths.notification,
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.userGuide,
      builder: (context, state) => const UserGuideScreen(),
    ),
    GoRoute(
      path: AppRoutePaths.tradeSetting,
      builder: (context, state) {
        final args = state.extra as ManualCreateArgs;

        SpotTradeSettingModel? tradeSetting;
        if (state.extra != null) {
          tradeSetting = args.tradeSettingModel;
        } else {
          tradeSetting = null;
        }

        return TradeSettingScreen(
          tradeSettingModel: tradeSetting,
          symbol: args.symbol,
        );
        //return SpotConfigScreen();
      },
    ),
    GoRoute(
      path: AppRoutePaths.wallet,
      builder: (context, state) {
        final s = state.extra as bool;
        return WalletScreen(leading: s);
      },
    ),
    GoRoute(
      path: AppRoutePaths.selectedCurrencyDetails,
      builder: (context, state) {
        final params = state.extra as Map;

        return SelectedCurrencyDetailsScreen(
          selectedCurrency: params[AppConstants.symbolKey],
          tradingMode: params[AppConstants.tradingModeKey],
        );
      },
    ),
    GoRoute(
      path: AppRoutePaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
