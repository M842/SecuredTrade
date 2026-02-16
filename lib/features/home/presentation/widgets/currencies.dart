import 'package:securedtrade/config/path_config.dart';

class Currencies extends StatelessWidget {
  final CurrenciesModel data;
  final int modeIndex;
  const Currencies({super.key, required this.data, required this.modeIndex});

  @override
  Widget build(BuildContext context) {
    final symbol = data.symbol.contains("USDT") ? "USDT" : "BTC";

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5, top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: AppColors.white.withOpacity(.1)),
          ],
        ),
        height: 70,
        child: GestureDetector(
          onTap: () {
            context.push(
              AppRoutePaths.selectedCurrencyDetails,
              extra: data.symbol,
            );
            // Get.to(CurrencyChartScreen(selectedCurrency: data.symbol));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(height: 0, width: 5),
                    Image.asset(
                      "assets/icon/${formatSymbol(data.symbol.toLowerCase())}@2x.png",
                      height: 28,
                      width: 28,
                      errorBuilder: (c, u, cr) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: ContainerBg(
                            height: 28,
                            width: 28,
                            radius: 100,
                            backgroundColor: AppColors.black,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Text(
                                  data.symbol[0],
                                  style: getDmSansTextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 0, width: 12),
                    Text(
                      modeIndex == 1
                          ? data.symbol.toString()
                          : formatSymbol(data.symbol.toString()),
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.black2,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      data.priceChangePercent.contains("-")
                          ? AppStrings.tradeDownIcon
                          : AppStrings.tradeUpIcon,
                      height: 28,
                    ),
                    SizedBox(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${double.parse(data.lastPrice).toStringAsFixed(4)}",
                            style: getPlusJakartaSansTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.black2,
                            ),
                          ),
                          Text(
                            double.parse(
                              data.priceChangePercent,
                            ).toStringAsFixed(3),
                            style: getDmSansTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: data.priceChangePercent.contains("-")
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatSymbol(String symbol) {
    if (symbol.length <= 4) return symbol;
    final data =
        '${symbol.substring(0, symbol.length - 4)}/${symbol.substring(symbol.length - 4)}';
    final data2 = data.split("/");
    return data2[0];
  }
}
