import 'package:securedtrade/config/path_config.dart';

class AppTabs extends StatelessWidget {
  const AppTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recordAnalysisList.map((toElement) {
              final index = recordAnalysisList.indexOf(toElement);
              return Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ContainerBg(
                  radius: 8,
                  bWidth: 1,
                  backgroundColor: index == 0
                      ? AppColors.primary
                      : AppColors.white,
                  borderColor: Color(0xff6B6B6B33),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 9,
                      bottom: 9,
                    ),
                    child: Text(
                      toElement,
                      style: getDmSansTextStyle(
                        fontSize: 14,
                        fontWeight: index == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: index == 0 ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Flexible(child: NoDataFound(text: 'No Data Found', height: 4.2)),
      ],
    );
  }

  /* buildTabsHeading({required String title, required int index}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 10),
          child: Text(
            title,
            style: getPlusJakartaSansTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: index == 0 ? AppColors.primary : AppColors.black),
          ),
        ),
        SizedBox(height: 6, width: 0),
        ContainerBg(
          width: 90,
          height: 2,
          radius: 10,
          backgroundColor: index == 0 ? AppColors.primary : Colors.transparent,
          child: SizedBox(),
        )
      ],
    );
  }
*/
}

class AppRewardDetailTabs extends StatelessWidget {
  final Widget tabBarView;
  const AppRewardDetailTabs({super.key, required this.tabBarView});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: rewardTabsList.map((toElement) {
              final index = rewardTabsList.indexOf(toElement);
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 10.0),
                child: ContainerBg(
                  radius: 8,
                  bWidth: 1,
                  backgroundColor: index == 0
                      ? AppColors.primary
                      : AppColors.white,
                  borderColor: Color(0xff6B6B6B33),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 9,
                      bottom: 9,
                    ),
                    child: Text(
                      toElement,
                      style: getDmSansTextStyle(
                        fontSize: 14,
                        fontWeight: index == 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: index == 0 ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
            left: 10,
            right: 10,
          ),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xff3C4CF9), Color(0xff9515FA)],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 25),
                  child: Image.asset(
                    AppStrings.rewardIcon,
                    height: 124,
                    width: 124,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          right: 10,
                          left: 10,
                        ),
                        child: ContainerBg(
                          height: 84,
                          radius: 8,
                          width: UIHelpers.screenSize(context).width / 2,
                          bWidth: 1,
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.white.withOpacity(.1),
                          child: tradeBalanceUI(
                            heading: "Today's(USDT)",
                            value: "4,650.2502",
                            value2: "=\$4,650.25",
                            from: "",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          right: 10,
                          left: 10,
                        ),
                        child: ContainerBg(
                          height: 88,
                          width: UIHelpers.screenSize(context).width / 2,
                          bWidth: 1,
                          backgroundColor: Colors.transparent,
                          borderColor: AppColors.white.withOpacity(.1),
                          child: tradeBalanceUI(
                            heading: "Cumulative Profit",
                            value: "340,400.352",
                            value2: "=\$340,400.35",
                            from: 'c',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  right: UIHelpers.screenSize(context).width / 1.8,
                  child: Image.asset(AppStrings.circleImg),
                ),
              ],
            ),
          ),
        ),
        Flexible(child: tabBarView),
      ],
    );
  }

  tradeBalanceUI({
    required String heading,
    required String value,
    required String value2,
    required String from,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15.0, top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffE5E5E5),
            ),
          ),
          SizedBox(height: 6, width: 0),
          Text(
            value,
            style: getDmSansTextStyle(
              fontSize: 14,
              color: from.isEmpty ? Color(0xffE5E5E5) : Color(0xff21BF73),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2, width: 0),
          Text(
            value2,
            style: getDmSansTextStyle(
              fontSize: 14,
              color: Color(0xffE5E5E5),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
