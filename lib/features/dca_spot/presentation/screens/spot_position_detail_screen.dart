import 'package:securedtrade/config/path_config.dart';

class RbgSpotTradeDetailScreen extends StatelessWidget {
  const RbgSpotTradeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "Spot Position Details", subtitle: "BTC/USDT"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSpacing.h12,
            AppCustomCard(
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      headingText(text: "Position Overview"),
                      Spacer(),
                      ContainerBg(
                        radius: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "+5.8%",
                            style: getDmSansTextStyle(
                              color: Color(0xff008236),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        backgroundColor: Color(0xffF0FDF4),
                      ),
                    ],
                  ),
                  AppSpacing.h8,
                  itemPositionOverviewUI(
                    text: "Trading Pair",
                    text2: "BTC / USDT",
                  ),
                  dividerLineUI(),
                  itemPositionOverviewUI(
                    text: "Strategy",
                    text2: "Smart DCA + Trend Guard",
                  ),
                  dividerLineUI(),
                  itemPositionOverviewUI(text: "Status", text2: "Active"),
                  dividerLineUI(),
                  itemPositionOverviewUI(
                    text: "Position Size",
                    text2: "0.2456 BTC",
                  ),
                ],
              ),
            ),
            AppSpacing.h16,
            AppCustomCard(
              height: 315,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText(text: "Price Information"),
                  AppSpacing.h16,
                  Row(
                    children: [
                      Expanded(
                        child: priceInfoUI(
                          text2: "+2.1%",
                          text: "Current Price",
                          amount: "\$44,595",
                        ),
                      ),
                      AppSpacing.w12,
                      Expanded(
                        child: priceInfoUI(
                          text2: "All entries",
                          pos: 2,
                          text: "Average Buy Price",
                          amount: "\$42,150",
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h16,
                  dividerLineUI(),
                  AppSpacing.h8,
                  otherPriceInfoItems(
                    text: "Total Invested",
                    text2: '10,352 USDT',
                  ),
                  otherPriceInfoItems(
                    text: "Current Value",
                    text2: '10,953 USDT',
                  ),
                  otherPriceInfoItems(
                    text: "Unrealized PnL",
                    text2: '+601 USDT (+5.8%)',
                  ),
                ],
              ),
            ),
            AppSpacing.h12,
            AppCustomCard(
              height: 610,
              child: Column(
                children: [
                  Row(
                    children: [
                      headingText(text: "DCA Levels"),
                      Spacer(),
                      Text(
                        "3 / 5 Used",
                        style: getDmSansTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey7,
                        ),
                      ),
                      AppSpacing.h4,
                    ],
                  ),
                  dcaLevelItemUI(
                    text: "Level 1 - Filled",
                    text2: "Entry Price",
                    text3: "Amount",
                    value: "20% of capital",
                    value2: "\$44,500",
                    value3: "0.0449 BTC",
                  ),
                  dcaLevelItemUI(
                    text: "Level 2 - Filled",
                    text2: "Entry Price",
                    text3: "Amount",
                    value: "30% of capital",
                    value2: "\$41,200",
                    value3: "0.0729 BTC",
                  ),
                  dcaLevelItemUI(
                    text: "Level 3 - Filled",
                    text2: "Entry Price",
                    text3: "Amount",
                    value: "35% of capital",
                    value2: "\$40,100",
                    value3: "0.1278 BTC",
                  ),
                  dcaLevelItemUI(
                    dcaStatus: false,
                    text: "Level 4 - Pending",
                    text2: "Trigger Price",
                    text3: "Amount",
                    value: "-8% trigger",
                    value2: "\$38,900",
                    value3: "0.1278 BTC",
                  ),
                  dcaLevelItemUI(
                    dcaStatus: false,
                    text: "Level 5 - Pending",
                    text2: "Trigger Price",
                    text3: "Amount",
                    value: "-12% trigger",
                    value2: "\$36,502",
                    value3: "0.1278 BTC",
                  ),
                ],
              ),
            ),
            AppSpacing.h12,
            AppCustomCard(
              height: 275,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      headingText(text: "Take Profit Settings"),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          AppStrings.editIcon,
                          height: 19,
                          color: Color(0xff4A5565),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.h12,
                  ContainerBg(
                    radius: 12,
                    backgroundColor: Color(0xff7C3AED).withOpacity(.1),
                    height: 110,
                    width: double.infinity,
                    child: Column(
                      children: [
                        takeProfileSettingInfo(
                          text: "Target Price",
                          text2: "\$46,575",
                        ),
                        takeProfileSettingInfo(
                          c: AppColors.black6,
                          text: "Distance",
                          text2: "+4.2% remaining",
                        ),
                        takeProfileSettingInfo(
                          c: AppColors.black6,
                          c2: AppColors.green,
                          text: "Expected Profit",
                          text2: "+\$828 USDT",
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.h12,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trailing Take Profit",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "Auto-adjust TP as price rises",
                            style: getDmSansTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey7,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ContainerBg(
                        radius: 5,
                        backgroundColor: Color(0xffF3F4F6),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "OFF",
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.black6,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.w12,
                    ],
                  ),
                ],
              ),
            ),
            AppSpacing.h12,
            AppCustomCard(
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText(text: "Trade History"),
                  AppSpacing.h12,
                  dcaTradeHistoryUI(text: "DCA Level 3 Buy"),
                  dividerLineUI(),
                  dcaTradeHistoryUI(text: "DCA Level 2 Buy"),
                  dividerLineUI(),
                  dcaTradeHistoryUI(text: "Initial Entry"),
                ],
              ),
            ),
            AppSpacing.h12,
            AppCustomCard(
              height: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingText(text: "Risk Metrics"),
                  AppSpacing.h20,
                  Row(
                    children: [
                      riskMetricsInfo(text: "Max Drawdown", value: "-8.2%"),
                      Spacer(),
                      riskMetricsInfo(
                        text: "Time in Position",
                        value: "2 days",
                      ),
                      SizedBox(height: 0, width: 60),
                    ],
                  ),
                  AppSpacing.h16,
                  Row(
                    children: [
                      riskMetricsInfo(text: "Capital at Risk", value: "16.5%"),
                      Spacer(),
                      riskMetricsInfo(
                        text: "Risk/Reward Ratio",
                        value: "1:2.8",
                      ),
                      SizedBox(height: 0, width: 50),
                    ],
                  ),
                ],
              ),
            ),
            AppSpacing.h12,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: editCloseButton(
                      text: "Edit Settings",
                      c: AppColors.purple,
                    ),
                  ),
                  AppSpacing.w16,
                  Expanded(
                    child: editCloseButton(
                      pos: 2,
                      text: "Close Position",
                      c: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.h12,
          ],
        ),
      ),
    );
  }

  itemPositionOverviewUI({required String text, required String text2}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Row(
        children: [
          Text(
            text,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.black6,
            ),
          ),
          Spacer(),
          text2.contains("Active")
              ? ContainerBg(
                  child: SizedBox(),
                  backgroundColor: AppColors.green,
                  width: 10,
                  height: 10,
                )
              : SizedBox(),
          AppSpacing.w8,
          Text(
            text2,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: text2.contains("Active")
                  ? Color(0xff008236)
                  : text.contains("Strategy")
                  ? Color(0xff7C3AED)
                  : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  dividerLineUI() {
    return ContainerBg(
      height: 1,
      backgroundColor: AppColors.grey5,
      width: double.infinity,
      child: SizedBox(),
    );
  }

  headingText({required String text}) {
    return Text(
      text,
      style: getDmSansTextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.black,
      ),
    );
  }

  Widget priceInfoUI({
    required String text,
    required String amount,
    int pos = 0,
    required String text2,
  }) {
    return ContainerBg(
      height: 110,
      width: double.infinity,
      radius: 14,
      backgroundColor: Color(0xffF9FAFB),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSpacing.h8,
            Text(
              text,
              style: getDmSansTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.grey7,
              ),
            ),
            AppSpacing.h12,
            Text(
              amount,
              style: getDmSansTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
            AppSpacing.h8,
            pos != 0
                ? Text(
                    text2,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.grey7,
                    ),
                  )
                : Row(
                    children: [
                      Image.asset(AppStrings.trendSymbolIcon, height: 15),
                      AppSpacing.w8,
                      Text(
                        text2,
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  otherPriceInfoItems({required String text, required String text2}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 0),
      child: Row(
        children: [
          Text(
            text,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.black6,
            ),
          ),
          Spacer(),
          AppSpacing.w8,
          Text(
            text2,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: text.contains("PnL") ? AppColors.green : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  dcaLevelItemUI({
    required String text,
    required String text2,
    required String text3,
    required String value,
    required String value2,
    required String value3,
    bool dcaStatus = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ContainerBg(
        height: dcaStatus ? 105 : 82,
        width: double.infinity,
        radius: 10,
        bWidth: dcaStatus ? 1 : 0,
        borderColor: dcaStatus ? Color(0xffB9F8CF) : Colors.transparent,
        backgroundColor: dcaStatus ? Color(0xffF0FDF4) : Color(0xffF9FAFB),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: dcaStatus ? Color(0xff008236) : AppColors.grey7,
                    ),
                  ),
                  AppSpacing.h12,
                  Text(
                    text2,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.black6,
                    ),
                  ),
                  AppSpacing.h12,
                  dcaStatus
                      ? Text(
                          text3,
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black6,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: dcaStatus ? Color(0xff008236) : AppColors.grey7,
                    ),
                  ),
                  AppSpacing.h(10),
                  Text(
                    value2,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.h(10),
                  dcaStatus
                      ? Text(
                          value3,
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  takeProfileSettingInfo({
    required String text,
    required String text2,
    Color c = AppColors.purple,
    Color c2 = AppColors.purple,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
      child: Row(
        children: [
          Text(
            text,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: c,
            ),
          ),
          Spacer(),
          AppSpacing.w8,
          Text(
            text2,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: c2,
            ),
          ),
        ],
      ),
    );
  }

  dcaTradeHistoryUI({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: Row(
        children: [
          ContainerBg(
            backgroundColor: Color(0xffDCFCE7),
            radius: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppStrings.dollerIcon, height: 20),
            ),
          ),
          AppSpacing.w16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
              AppSpacing.h(4),
              Text(
                "0.1278 BTC @ \$40,100",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.black6,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "2h ago",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey7,
                ),
              ),
              AppSpacing.h(3),
              Text(
                "5,125 USDT",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  riskMetricsInfo({required String text, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: getDmSansTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey7,
          ),
        ),
        AppSpacing.h(5),
        Text(
          value,
          style: getDmSansTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: text.contains("Risk/Reward Ratio")
                ? AppColors.green
                : AppColors.black,
          ),
        ),
      ],
    );
  }

  editCloseButton({required String text, required Color c, int pos = 1}) {
    return ContainerBg(
      height: 50,
      backgroundColor: AppColors.white,
      bWidth: pos == 2 ? 2 : 1,
      radius: 14,
      borderColor: c,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pos == 2
              ? Icon(Icons.cancel_outlined, size: 20, color: c)
              : Image.asset(AppStrings.editIcon, color: c, height: 15),
          AppSpacing.w8,
          Text(
            text,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: c,
            ),
          ),
        ],
      ),
    );
  }
}
