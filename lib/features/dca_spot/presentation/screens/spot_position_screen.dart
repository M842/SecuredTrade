import 'package:securedtrade/config/path_config.dart';

class SpotPositionScreen extends StatelessWidget {
  const SpotPositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.darkTransparent);
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
                "Spot Positions",
                style: getDmSansTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 10, bottom: 25),
                child: Text(
                  "Spot is used for stability and accumulation",
                  style: getDmSansTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyDark,
                  ),
                ),
              ),

              StrategyStatus(
                heading: "Strategy Status",
                investMargin: "6,225 USDT",
                totalPnL: "+186.2 USDT",
                botName: "Smart DCA Active",
                labelInvestMargin: "Total Invested",
                labelTotalPnL: "Total PnL",
              ),
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
                    ),Spacer(), Text(
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

              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  2,
                  (index) => ActiveDCAPositionList(index: index),
                ),
              ),

              SizedBox(height: 10),

              ContainerBg(
                height: 150,
                radius: 14,
                width: double.infinity,
                backgroundColor: Color(0xffEFF6FF),
                bWidth: 1,
                borderColor: Color(0xffBEDBFF),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 14),
                      Image.asset(AppStrings.liveTrackingIcon, height: 20),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Smart DCA Strategy",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                color: Color(0xff1C398E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "The Smart DCA strategy automatically averages down your entry price during dips, protecting you from losses while accumulating more at lower prices. It uses Trend Guard to ensure entries only in favorable market conditions.",
                              style: getDmSansTextStyle(
                                fontSize: 11,
                                color: Color(0xff1C398E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              Text(
                "Closed Positions (Last 5)",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(
                  3,
                  (ind) => ClosePositionList(ind: ind),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
