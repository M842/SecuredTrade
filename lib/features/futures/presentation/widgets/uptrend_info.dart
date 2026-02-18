import 'package:securedtrade/config/path_config.dart';

class UptrendInfo extends StatelessWidget {
  const UptrendInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBg(
      height: 140,
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
                    "Strong Uptrend Detected",
                    style: getDmSansTextStyle(
                      fontSize: 13,
                      color: Color(0xff1C398E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Market showing strong bullish momentum. Trend Sniper strategy is optimized for these conditions.",
                    style: getDmSansTextStyle(
                      fontSize: 11,
                      color: Color(0xff1447E6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h16,
                  Row(
                    children: [
                      Expanded(
                        child: ContainerBg(
                          radius: 4,
                          backgroundColor: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Trend Score: 8.5/10",
                                style: getDmSansTextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1C398E),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.w12,
                      Expanded(
                        child: ContainerBg(
                          radius: 4,
                          backgroundColor: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Volatility: Moderate",
                                style: getDmSansTextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1C398E),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.w16,
                      AppSpacing.w16,
                    ],
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
