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

  static String spotCurrencyWebSocketUrl =
      "wss://stream.binance.com:9443/stream?streams=!miniTicker@arr";
}
