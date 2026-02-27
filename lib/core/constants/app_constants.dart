class AppConstants {
  static const token_key = "token";

  static const getSpotCurrencyUrl =
      "https://api.binance.com/api/v3/ticker/24hr";

  static String getFutureCurrencyUrl =
      "https://fapi.binance.com/fapi/v1/ticker/24hr";

  static String getUSDTLiveRateUrl =
      "https://api.coingecko.com/api/v3/simple/price?ids=tether&vs_currencies=inr";
  static const String apiError = "error";
  static const String apiMessage = "message";

  static const String getIsUserAffiliateUrl =
      "https://api.nftwall.io:2096/api/call-proc?procedureName=get_rpt_users_data&forprime=0&node=";

  static String spotCurrencyWebSocketUrl =
      "wss://stream.binance.com:9443/stream?streams=!miniTicker@arr";

  static var apiSuccessKey = "success";

  static const String symbolKey="symbol";
  static const String tradingModeKey="tradingMode";
}
