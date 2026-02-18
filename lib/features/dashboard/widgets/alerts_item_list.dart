import 'dart:math';

import 'package:securedtrade/config/path_config.dart';

class AlertsItemList extends StatelessWidget {
  final String icon, heading, subHeading,infoTitle,infoTitle2;
  final Color hColor, sbhColor,bgColor,infoBgColor,iconBgColor,bgBorderColor;
  const AlertsItemList({
    super.key,
    required this.icon,
    required this.heading,
    required this.subHeading,
    required this.hColor,
    required this.sbhColor,
    required this.infoBgColor,
    required this.bgColor,required this.iconBgColor,
    required this.infoTitle,required this.infoTitle2,
    required this.bgBorderColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: ContainerBg(
        radius: 14,
        bWidth: 1,
        borderColor: bgBorderColor,
        backgroundColor: bgColor,
        width: double.infinity,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.w16,
              ContainerBg(
                height: 40,
                width: 40,
                radius: 40,
                backgroundColor:iconBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(icon, color: AppColors.white),
                ),
              ),
              AppSpacing.w16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.h4,
                    Text(
                      heading,
                      style: getDmSansTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: hColor,
                      ),
                    ),
                    AppSpacing.h8,
                    Text(
                      "BTC/USDT showing strong bullish momentum. Futures strategy has been automatically enabled for optimal entry. Trend score: 8.5/10",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: sbhColor,
                      ),
                    ),
                    AppSpacing.h8,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ContainerBg(
                            radius: 4,
                            backgroundColor: infoBgColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                              infoTitle,
                                style: getDmSansTextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: hColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.w12,
                        Flexible(
                          child: ContainerBg(
                            radius: 4,
                            backgroundColor: AppColors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                infoTitle2,
                                style: getDmSansTextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: hColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.w8,
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "${Random().nextInt(111)}m ago",
                  style: getDmSansTextStyle(
                    color: sbhColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
              AppSpacing.w12,
            ],
          ),
        ),
      ),
    );
  }
}
