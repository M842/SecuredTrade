import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';

class FuturePositionScreen extends StatelessWidget {
  const FuturePositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar2(title: ""),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h20,
              Text(
                "Future Positions",
                style: getDmSansTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 10, bottom: 25),
                child: Text(
                  "Futures are used only in strong trends",
                  style: getDmSansTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyDark,
                  ),
                ),
              ),

              StrategyStatus(
                heading: "Strategy Status",
                botName: "Trend Sniper Active",
                labelInvestMargin: 'Margin Used',
                labelTotalPnL: 'Total PnL',
                totalPnL: '+312.5 USDT',
                investMargin: '2,490 USDT',
              ),
              AppSpacing.h12,
              RiskEngine(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Active Positions (2)",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black2,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "View All",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              AppCustomCard(
                padding: 15,

                height: 720,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.h8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BTC/USDT",
                              style: getDmSansTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                            AppSpacing.h4,
                            Text(
                              "Trend Sniper",
                              style: getDmSansTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.w8,

                        ContainerBg(
                          bWidth: 1,
                          borderColor: Color(0xff7BF1A8),
                          backgroundColor: Color(0xffDCFCE7),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "LONG",
                              style: getDmSansTextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xff008236),
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.w12,
                        ContainerBg(
                          bWidth: 1,
                          borderColor: Color(0xff3C4CF9),
                          backgroundColor: Color(0xff3C4CF9).withOpacity(.1),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "2x",
                              style: getDmSansTextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xff008236),
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "+2.49%",
                              style: getDmSansTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff00A63E),
                              ),
                            ),
                            Padding(
                              padding: PaddingUtils.only(right: 4),
                              child: Text(
                                "+124.50",
                                style: getDmSansTextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff00A63E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.h20,
                    Row(
                      children: [
                        positionEntrySizeUI(
                          title: "Entry Price",
                          value: "\$43,250",
                          c: AppColors.black,
                        ),
                        positionEntrySizeUI(
                          title: "Mark Price",
                          value: "\$43,250",
                          c: AppColors.green2,
                        ),
                        positionEntrySizeUI(
                          title: "Size",
                          value: "0.250 BTC",
                          c: AppColors.black,
                        ),
                      ],
                    ),
                    AppSpacing.h20,
                    Row(
                      children: [
                        leverageMarginUI(
                          title: "Leverage Used",
                          subTitle: "2x",
                        ),
                        leverageMarginUI(
                          title: "Margin",
                          subTitle: "2,450 USDT",
                        ),
                      ],
                    ),
                    AppSpacing.h20,

                    profitLossCommonUI(
                      heading: "Stop Loss",
                      color: AppColors.red,
                      value: 0.2,
                      distTo: "SL",
                    ),

                    profitLossCommonUI(
                      heading: "Take Profit",
                      color: AppColors.green,
                      value: 0.5,
                      distTo: "TP",
                    ),
                    AppSpacing.h8,
                    ContainerBg(
                      height: 101,
                      width: double.infinity,
                      backgroundColor: Color(0xffEFF6FF),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Risk Metrics",
                              style: getDmSansTextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1C398E),
                              ),
                            ),
                            AppSpacing.h8,
                            Row(
                              children: [
                                riskMetricsUI(
                                  title: "Risk:Reward",
                                  value: "1:2.3",
                                  color: Color(0xff1C398E),
                                ),
                                riskMetricsUI(
                                  title: "Max  Loss",
                                  value: "-\$78.5",
                                  color: AppColors.red,
                                ),
                              ],
                            ),
                            AppSpacing.h12,
                            Row(
                              children: [
                                riskMetricsUI(
                                  title: "Expected Profit",
                                  value: "+\$432",
                                  color: AppColors.green,
                                ),
                                riskMetricsUI(
                                  title: "Time in Trade",
                                  value: "2h 38m",
                                  color: Color(0xff312E49),
                                ),
                              ],
                            ),
                          ],
                        ),
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

  positionEntrySizeUI({
    required String title,
    required String value,
    required Color c,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getDmSansTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
            ),
          ),
          Text(
            value,
            style: getDmSansTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: c,
            ),
          ),
        ],
      ),
    );
  }

  leverageMarginUI({required String title, required String subTitle}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 8),
        child: ContainerBg(
          width: double.infinity,
          height: 115,
          radius: 10,
          backgroundColor: Color(0xffF9FAFB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.h8,
                Text(
                  title,
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    color: AppColors.greyDark,
                  ),
                ),
                AppSpacing.h8,
                Text(
                  subTitle,
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                AppSpacing.h8,
                Text(
                  "Conservative",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    color: AppColors.greyDark,
                  ),
                ),
                AppSpacing.h8,
                Text(
                  "-11.86%",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    color: AppColors.greyDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profitLossCommonUI({
    required String heading,
    required Color color,
    required double value,
    required String distTo,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                heading,
                style: getDmSansTextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                "\$41,865 (-3.2%)",
                style: getDmSansTextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          AppSpacing.h8,
          Row(
            children: [
              Text(
                "Distance to $distTo",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark,
                  fontSize: 10,
                ),
              ),
              Spacer(),
              Text(
                "-9.2%",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.red,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          AppSpacing.h12,
          LinearProgressIndicator(
            value: value,
            minHeight: 9,
            color: color,
            backgroundColor: AppColors.grey.withOpacity(.1),
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
          AppSpacing.h20,
          Row(
            children: [
              Image.asset(
                distTo == "TP" ? AppStrings.targetIcon : AppStrings.errorIcon,
                color: color,
                height: 14,
              ),
              AppSpacing.w12,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Trailing $distTo: ",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyDark,
                        fontSize: 11,
                      ),
                    ),
                    TextSpan(
                      text: distTo == "TP" ? "Enabled" : "Enabled (+1.5%)",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  riskMetricsUI({
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          children: [
            Text(
              title,
              style: getDmSansTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: AppColors.greyDark,
              ),
            ),
            Spacer(),
            Text(
              value,
              style: getDmSansTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
