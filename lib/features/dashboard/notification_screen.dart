import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/dashboard/widgets/alerts_item_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Color> appColors = [
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.redAccent,
  ];
  Color getPaletteRandomColor() {
    final random = Random();
    return appColors[random.nextInt(appColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar2(title: "", isSuffixIcon: false),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.grey5),
              AppSpacing.h16,
              Text(
                "Alerts & Notifications",
                style: getDmSansTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 50.0, top: 5),
                child: Text(
                  "Stay informed about market conditions and system actions",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: AppColors.greyDark,
                  ),
                ),
              ),

              Row(
                children: [
                  notifyInfoWarnUI(
                    text: "Info",
                    value: "12",
                    txColor: Color(0xff155DFC),
                  ),
                  notifyInfoWarnUI(
                    text: "Warnings",
                    value: "3",
                    txColor: Color(0xffD08700),
                  ),
                  notifyInfoWarnUI(
                    text: "Cleared",
                    value: "24",
                    txColor: AppColors.green2,
                  ),
                ],
              ),

              Text(
                "Active Alerts",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),

              Column(
                children: List.generate(
                  3,
                  (index) => AlertsItemList(
                    iconBgColor: index == 0
                        ? Color(0xff2B7FFF)
                        : index == 1
                        ? Color(0xffF0B100)
                        : AppColors.green,
                    infoBgColor: index == 0
                        ? Color(0xffBEDBFF)
                        : index == 1
                        ? Color(0xffFFF085)
                        : Color(0xffB9F8CF),
                    bgBorderColor: index == 0
                        ? Color(0xffBEDBFF)
                        : index == 1
                        ? Color(0xffFFF085)
                        : Color(0xffB9F8CF),
                    bgColor: index == 0
                        ? Color(0xffEFF6FF)
                        : index == 1
                        ? Color(0xffFEFCE8)
                        : Color(0xffF0FDF4),
                    icon: index == 0
                        ? AppStrings.trendSymbolIcon
                        : index == 1
                        ? AppStrings.errorIcon
                        : AppStrings.futureChangeIcon,
                    heading: index == 0
                        ? "Strong Trend Forming"
                        : index == 1
                        ? "High Volatility Detected"
                        : "Sideways Market Detected",
                    infoTitle: index == 0 || index == 2
                        ? "Market Guidance"
                        : "Warning",
                    infoTitle2: index == 0
                        ? "Futures"
                        : index == 1
                        ? "Risk Control"
                        : "Spot",
                    subHeading:
                        'BTC/USDT showing strong bullish momentum. Futures strategy has been automatically enabled for optimal entry. Trend score: 8.5/10',
                    hColor: index == 0
                        ? Color(0xff1C398E)
                        : index == 1
                        ? Color(0xff733E0A)
                        : Color(0xff0D542B),
                    sbhColor: index == 0
                        ? Color(0xff1447E6)
                        : index == 1
                        ? Color(0xffA65F00)
                        : Color(0xff008236),
                  ),
                ),
              ),
              AppSpacing.h12,
            ],
          ),
        ),
      ),
    );
  }

  notifyInfoWarnUI({
    required String value,
    required String text,
    required Color txColor,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 25, bottom: 20),
        child: ContainerBg(
          height: 80,
          radius: 14,
          bWidth: 1,
          backgroundColor: AppColors.white,
          borderColor: Color(0xff000000).withOpacity(.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: getDmSansTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: txColor,
                ),
              ),
              Text(
                text,
                style: getDmSansTextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
