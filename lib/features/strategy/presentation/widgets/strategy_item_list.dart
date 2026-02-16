import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/strategy_model.dart';

class StrategyItemList extends StatelessWidget {
  final StrategyModel data;
  const StrategyItemList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ContainerBg(
        backgroundColor: AppColors.white,
        bWidth: 1,
        borderColor: Color(0xff6B6B6B33),
        height: 295,
        radius: 16,
        child: Column(
          children: [
            SizedBox(height: 8, width: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(data.symbol, height: 35, width: 35),
                  SizedBox(height: 0, width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: data.name,
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                color: AppColors.black3,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "/${data.currencyType}",
                              style: getDmSansTextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: AppColors.black3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3, width: 0),
                      Text(
                        data.price,
                        style: getDmSansTextStyle(
                          color: AppColors.black4,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ContainerBg(
                    height: 32,
                    width: 57,
                    radius: 8,
                    backgroundColor: Color(0xff21BF73),
                    child: Center(
                      child: Text(
                        data.percentage,
                        style: getDmSansTextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0, width: 7),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ContainerBg(
                      height: 87,
                      radius: 16,
                      backgroundColor: AppColors.grey4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4, width: 0),
                            Text(
                              data.position,
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black3,
                              ),
                            ),
                            SizedBox(height: 5, width: 0),
                            Text(
                              "Position amount\n(USDT)",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0, width: 8),
                  Expanded(
                    child: ContainerBg(
                      height: 87,
                      radius: 16,
                      backgroundColor: AppColors.grey4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4, width: 0),
                            Text(
                              data.floatingPL,
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: data.floatingPL.contains("-")
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                            SizedBox(height: 5, width: 0),
                            Text(
                              "Floating P/L(USDT)\n",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ContainerBg(
                      height: 87,
                      radius: 16,
                      backgroundColor: AppColors.grey4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4, width: 0),
                            Text(
                              data.avgPrice,
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black3,
                              ),
                            ),
                            SizedBox(height: 5, width: 0),
                            Text(
                              "Avg price\n(USDT)",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0, width: 8),
                  Expanded(
                    child: ContainerBg(
                      height: 87,
                      radius: 16,
                      backgroundColor: AppColors.grey4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4, width: 0),
                            Text(
                              data.quantity,
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black3,
                              ),
                            ),
                            SizedBox(height: 5, width: 0),
                            Text(
                              "Position quantity\n(BTC)",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
