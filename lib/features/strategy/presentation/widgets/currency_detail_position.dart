import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/presentation/screens/currency_details_screen.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

class CurrencyDetailPosition extends StatelessWidget {
  final String symbol;
  final TradeSetting? mData;
  const CurrencyDetailPosition({
    super.key,
    required this.symbol,
    required this.mData,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomCard(
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                height: 30,
                "assets/icon/${formatSymbol2(symbol).toLowerCase()}@2x.png",
              ),
              SizedBox(width: 15),
              Text(
                "${formatSymbol2(symbol)}/USDT",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
              SizedBox(width: 10),
              ContainerBg(
                radius: 40,
                backgroundColor: AppColors.primary.withOpacity(.3),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.candlestick_chart_outlined,
                    color: AppColors.black,
                    size: 15,
                  ),
                ),
              ),
              Spacer(),
              Icon(Icons.question_mark_rounded, size: 20),
            ],
          ),
          SizedBox(height: 5),

          Row(
            children: [
              SizedBox(width: 6),
              Image.asset(
                AppStrings.binanceIcon,
                height: 17,
                color: AppColors.yellow,
              ),

              SizedBox(width: 15),
              mData == null
                  ? SizedBox()
                  : ContainerBg(
                      backgroundColor: Colors.orange.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "One-Shot",
                          style: getDmSansTextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
              SizedBox(width: 15),
              mData == null
                  ? SizedBox()
                  : ContainerBg(
                      backgroundColor: Colors.blueAccent.withOpacity(.2),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Whole Warehouse Mode",
                          style: getDmSansTextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currencyAvgItem(
                amount: "0.0000000",
                text: "Position\nAmount(USDT)",
              ),
              currencyAvgItem(amount: "0.0000000", text: "Avg Price"),
              currencyAvgItem(amount: "0", text: "Margin Call Count"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currencyAvgItem(amount: "0.0", text: "Position\nQuantity(SOL)"),
              currencyAvgItem(amount: "cp", text: "Current Price"),
              currencyAvgItem(amount: "0.000(0.0%)", text: "Unrealized P/L"),
            ],
          ),
        ],
      ),
    );
  }

  currencyAvgItem({required String amount, required String text}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          amount == "cp"
              ? ValueListenableBuilder<double?>(
                  valueListenable: wc.price,
                  builder: (context, price, _) {
                    return Text(
                      price == null ? '0.00' : '\$${price.toStringAsFixed(2)}',
                      style: getDmSansTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    );
                  },
                )
              : Text(
                  amount,
                  style: getDmSansTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
          SizedBox(height: 6),
          Text(
            text,
            style: getDmSansTextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey7,
            ),
          ),
        ],
      ),
    );
  }
}

String formatSymbol2(String symbol) {
  if (symbol.length <= 4) return symbol;
  final data =
      '${symbol.substring(0, symbol.length - 4)}/${symbol.substring(symbol.length - 4)}';
  final data2 = data.split("/");
  return data2[0];
}
