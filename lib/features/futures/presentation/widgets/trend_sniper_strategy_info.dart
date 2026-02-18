import 'package:securedtrade/config/path_config.dart';

class TrendSniperStrategyInfo extends StatelessWidget {
  const TrendSniperStrategyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBg(
      height: 140,
      radius: 14,
      width: double.infinity,
      backgroundColor: Color(0xffFEFCE8),
      bWidth: 1,
      borderColor: Color(0xffFFF085),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 14),
            Image.asset(
              AppStrings.futureChangeIcon,
              height: 20,
              color: Color(0xffD08700),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trend Sniper Strategy",
                    style: getDmSansTextStyle(
                      fontSize: 13,
                      color: Color(0xff733E0A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This strategy enters futures positions only during confirmed strong trends. It uses strict risk controls with maximum 3x leverage and automatic stop losses. Risk per trade is limited to 2% of total capital.",
                    style: getDmSansTextStyle(
                      fontSize: 11,
                      color: Color(0xffA65F00),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
