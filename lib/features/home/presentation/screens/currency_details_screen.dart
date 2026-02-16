import 'dart:async';
import 'package:intl/intl.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:dio/dio.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/currency_websocket_service.dart';
import 'package:securedtrade/features/home/presentation/widgets/grid_line_painter.dart';
import 'package:securedtrade/features/home/presentation/widgets/select_bid_line.dart';
import 'package:securedtrade/features/home/presentation/widgets/skeleton_candle_shimmer.dart';

CurrencyWebsocketService wc = CurrencyWebsocketService();

class SelectedCurrencyDetailsScreen extends StatefulWidget {
  final dynamic selectedCurrency;
  const SelectedCurrencyDetailsScreen({
    super.key,
    required this.selectedCurrency,
  });

  @override
  State<SelectedCurrencyDetailsScreen> createState() =>
      _SelectedCurrencyDetailsScreenState();
}

class _SelectedCurrencyDetailsScreenState
    extends State<SelectedCurrencyDetailsScreen> {
  List<Candle> candles = [];
  late Timer timer;
  final ScrollController _scrollController = ScrollController();
  String selectedTimeFrame = "5m";
  int selectedIndex = 0;

  bool isBull = false;

  String coinSum = "Min 0.00001";

  double approximatePrice = 0.00;

  String price = "0,000.00";

  @override
  void initState() {
    super.initState();
    wc.call(
      "wss://stream.binance.com:9443/ws/${widget.selectedCurrency.toString().toLowerCase()}@miniTicker",
      widget.selectedCurrency,
    );
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => loadCandles());
  }

  void loadCandles() async {
    final fetchedCandles = await fetchCandles(
      widget.selectedCurrency,
      selectedTimeFrame,
    );
    final response = await Dio().get(AppConstants.getUSDTLiveRateUrl);
    Map data = response.data;
    setState(() {
      candles = fetchedCandles;
      isBull = candles.last.close >= candles.last.open;

      approximatePrice = data["tether"]["inr"] * candles.last.close;
      price = NumberFormat("#,##0.00").format(candles.last.close);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  Future<List<Candle>> fetchCandles(String symbol, String interval) async {
    final response = await Dio().get(
      'https://api.binance.com/api/v3/klines',
      queryParameters: {
        'symbol': symbol,
        'interval': interval,
        'limit': 100, // Maximum number of data points
      },
    );

    print(response.data.toString());
    return (response.data as List).map((e) {
      return Candle(
        date: DateTime.fromMillisecondsSinceEpoch(e[0]),
        open: double.parse(e[1]),
        high: double.parse(e[2]),
        low: double.parse(e[3]),
        close: double.parse(e[4]),
        volume: double.parse(e[5]),
      );
    }).toList();
  }

  //{e: 24hrMiniTicker, E: 1770295449988, s: PAXGUSDT, c: 4865.42000000, o: 5077.05000000,
  // h: 5084.34000000, l: 4810.14000000, v: 49761.54100000, q: 245485070.67502400}
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatSymbol(String symbol) {
    if (symbol.length <= 4) return symbol;
    final data =
        '${symbol.substring(0, symbol.length - 4)}/${symbol.substring(symbol.length - 4)}';
    final data2 = data.split("/");
    return "${data2[0]}/${data2[1]}";
  }

  String formatSymbol2(String symbol) {
    if (symbol.length <= 4) return symbol;
    final data =
        '${symbol.substring(0, symbol.length - 4)}/${symbol.substring(symbol.length - 4)}';
    final data2 = data.split("/");
    return data2[0];
  }

  @override
  Widget build(BuildContext context) {
    const double candleWidth = 12; // fixed candle width
    final double chartWidth = candles.length * candleWidth + 40;
    final now = DateTime.now();
    final formatted = DateFormat('HH:mm:ss').format(now);
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(
        title: formatSymbol(widget.selectedCurrency),
        leading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 5, width: 0),
          candles.isEmpty
              ? CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColors.primary,
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 5),
            child: Row(
              children: [
                Text(
                  formatSymbol(widget.selectedCurrency),
                  style: GoogleFonts.dmSans(
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                Spacer(),
                Text(
                  "GMT+3",
                  style: GoogleFonts.dmSans(
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff111112),
                  ),
                ),
                SizedBox(height: 0, width: 15),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              top: 8,
              bottom: 8,
              right: 8,
            ),
            child: Row(
              children: [
                Text(
                  formatted,
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.black2,
                  ),
                ),
                Spacer(),
                Image.asset(AppStrings.fullScreenIcon, height: 16, width: 16),
                SizedBox(height: 0, width: 10),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5.0, right: 8.0),
              child: Container(
                color: AppColors.white.withOpacity(.4),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Image.asset(AppStrings.candle),
                      SizedBox(height: 5, width: 0),

                      candles.isEmpty
                          ? SkeletonCandleShimmer()
                          : Center(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(chartWidth, 225),
                                    painter: GridLinePainter(),
                                  ),
                                  SingleChildScrollView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        CustomPaint(
                                          size: Size(chartWidth, 225),
                                          painter: CandlePainter(candles),
                                        ),
                                        CustomPaint(
                                          size: Size(chartWidth, 25),
                                          painter: TimeLabelPainter(candles),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Container(
                                        height: 32,
                                        width: 101,
                                        decoration: BoxDecoration(
                                          color: isBull
                                              ? Colors.green
                                              : Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Center(
                                          child: ValueListenableBuilder<double?>(
                                            valueListenable: wc.price,
                                            builder: (context, price, _) {
                                              return Text(
                                                price == null
                                                    ? '0.00'
                                                    : '\$${price.toStringAsFixed(2)}',
                                                style: getDmSansTextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white,
                                                ),
                                              );
                                            },
                                          ) /* Text(
                                            "\$${double.parse(wc.price).toStringAsFixed(2)}",
                                            style: getDmSansTextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),*/,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                      SizedBox(height: 20, width: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TradeButton(
                                  onTap: () {},
                                  title: "Buy",
                                  backgroundColor: Color(0xff21BF73),
                                  txColor: AppColors.white,
                                ),
                                TradeButton(
                                  title: "Sell",
                                  onTap: () {},
                                  backgroundColor: Color(0xffF5F7FC),
                                  txColor: AppColors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 20, width: 0),
                            ContainerBg(
                              bWidth: 1,
                              borderColor: Color(0xffCDD5E9),
                              height: 45,
                              backgroundColor: Color(0xffF5F7FC),
                              child: Row(
                                children: [
                                  SizedBox(height: 0, width: 15),
                                  Text(
                                    "Limit Order",
                                    style: getDmSansTextStyle(
                                      fontSize: 16,
                                      color: AppColors.black2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_down, size: 18),
                                  SizedBox(height: 0, width: 15),
                                ],
                              ),
                            ),

                            SizedBox(height: 15, width: 0),
                            ContainerBg(
                              bWidth: 1,
                              borderColor: Color(0xffCDD5E9),
                              height: 45,
                              backgroundColor: Color(0xffF5F7FC),
                              child: Row(
                                children: [
                                  SizedBox(height: 0, width: 15),
                                  Text(
                                    "Price",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Color(0xff989595),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "$price USDT",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  SizedBox(height: 0, width: 15),
                                ],
                              ),
                            ),
                            // priceUI(),
                            SizedBox(height: 10, width: 0),
                            // approximatePriceUI(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Approximate Cost ",
                                        style: getDmSansTextStyle(
                                          fontSize: 16,
                                          color: Color(0xff111112),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${NumberFormat("#,##0.00").format(approximatePrice)}\u{20B9}",
                                        style: getDmSansTextStyle(
                                          fontSize: 16,
                                          color: Color(0xff111112),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12, width: 0),
                            ContainerBg(
                              bWidth: 1,
                              borderColor: Color(0xffCDD5E9),
                              height: 45,
                              backgroundColor: Color(0xffF5F7FC),
                              child: Row(
                                children: [
                                  SizedBox(height: 0, width: 15),
                                  Text(
                                    "Sum",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Color(0xff989595),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    coinSum,
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff706f6f),
                                    ),
                                  ),
                                  Text(
                                    " ${formatSymbol2(widget.selectedCurrency)}",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  SizedBox(height: 0, width: 15),
                                ],
                              ),
                            ),
                            SizedBox(height: 10, width: 0),
                            // selectedBetLineUI(),
                            SelectBidLine(),
                            SizedBox(height: 10, width: 0),
                            ContainerBg(
                              bWidth: 1,
                              borderColor: Color(0xffCDD5E9),
                              height: 45,
                              backgroundColor: Color(0xffF5F7FC),
                              child: Row(
                                children: [
                                  SizedBox(height: 0, width: 15),
                                  Expanded(
                                    child: TextField(
                                      cursorHeight: 19,
                                      onChanged: (data) {
                                        if (data.trim().isNotEmpty) {
                                          double sum =
                                              double.parse(
                                                data.trim().toString(),
                                              ) /
                                              candles.last.close;
                                          coinSum = sum.toStringAsFixed(5);
                                        } else {
                                          coinSum = "Min 0.00001";
                                        }
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          bottom: 5,
                                        ),
                                        hintText: "Total",
                                        border: InputBorder.none,
                                        hintStyle: GoogleFonts.roboto(
                                          fontSize: 16,
                                          color: Color(0xff989595),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "USDT",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff706f6f),
                                    ),
                                  ),
                                  SizedBox(height: 0, width: 15),
                                ],
                              ),
                            ),
                            SizedBox(height: 10, width: 0),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Available",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 0 ",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "USDT",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10, width: 0),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Max. Limit to Buy",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 0 ",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                  TextSpan(
                                    text: formatSymbol2(
                                      widget.selectedCurrency,
                                    ),
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff111112),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10, width: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              backgroundColor: Color(0xff21BF73),
              text: "Create",
              onPressed: () {
                context.push(
                  AppRoutePaths.createBot,
                  extra: widget.selectedCurrency.toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
