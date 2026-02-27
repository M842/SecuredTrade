import 'package:securedtrade/config/path_config.dart';

class ClosePositionList extends StatelessWidget {
  final int ind;
  final TradingMode mode;

  const ClosePositionList({super.key, required this.ind, required this.mode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        ind == 0
                            ? "BTC/USDT"
                            : ind == 1
                            ? "ETH/USDT"
                            : "SOL/USDT",
                        style: getDmSansTextStyle(
                          fontSize: 13,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      mode == TradingMode.future
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ContainerBg(
                                backgroundColor: ind == 0
                                    ? Color(0xffDCFCE7)
                                    : Color(0xffFFE2E2),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    ind == 0 ? "LONG" : "SHORT",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                      color: ind == 0
                                          ? Color(0xff008236)
                                          : AppColors.red,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Text(
                    "Jan 28, 2026",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 9,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ind == 0
                        ? "+4.23%"
                        : ind == 1
                        ? "+12.32%"
                        : "+5.12%",
                    style: getDmSansTextStyle(
                      fontSize: 14,
                      color: AppColors.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "+\$64.6",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
