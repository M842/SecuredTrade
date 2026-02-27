
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';

class ManualCreateArgs {
  final SpotTradeSettingModel? tradeSettingModel;
  final String symbol;

  ManualCreateArgs({required this.tradeSettingModel, required this.symbol});
}

class AppRoutePaths {
  static const String root = "/";
  static const String login = "/login";
  static const String home = "/home";
  static const String selectedCurrencyDetails = "/currency_detail";

  static String dashboard = "/dashboard";

  static String register = "/register";
  static String emailVerification = "/verification";

  static String deposit = '/deposit';

  static String editProfile = "/edit_profile";

  static String apiManage = "/api_Management";

  static String createBot = "/create_bot";

  static String profitDetail = "/profit_details";

  static String rewardDetail = "/reward_detail";

  static String wallet="/wallet";

  static String userGuide="/user_guide";

  static String tradeSetting="/trade_setting";

  static String marginConfig="/margin_config";

  static String notification="/notification";
}
