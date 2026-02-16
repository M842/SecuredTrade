class Currencies {
  late final String symbol;
  late final String priceChange;
  late final String priceChangePercent;
  late final String weightedAvgPrice;
  //late final String prevClosePrice;
  late final String lastPrice;
  late final String lastQty;
  //late final String bidPrice;
  //late final String bidQty;
  //late final String askPrice;
  //late final String askQty;
  late final String openPrice;
  late final String highPrice;
  late final String lowPrice;
  late final String volume;
  late final String quoteVolume;
  late final int openTime;
  late final int closeTime;
  late final int firstId;
  late final int lastId;
  late final int count;

  Currencies({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
   // required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    //required this.bidPrice,
    //required this.bidQty,
    //required this.askPrice,
    //required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });
}
