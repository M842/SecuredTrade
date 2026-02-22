import 'dart:math';

import 'package:securedtrade/config/path_config.dart';

class TradeNotificationItemList extends StatelessWidget {
  final String imagePath, heading, subHeading, subHeading2;
  final Color imgBgColor,imgColor;
  const TradeNotificationItemList({
    super.key,
    required this.imagePath,
    required this.heading,
    required this.subHeading,
    required this.subHeading2, required this.imgBgColor, required this.imgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ContainerBg(
        backgroundColor: AppColors.white,
        borderColor: Color(0xff000000).withOpacity(.05),
        bWidth: 1,
        radius: 10,
        height: 130,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.w16,
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ContainerBg(
                height: 40,
                width: 40,
                radius: 40,
                backgroundColor: imgBgColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    imagePath,
                    color: imgColor,
                  ),
                ),
              ),
            ),
            AppSpacing.w12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h20,
                  Text(
                    heading,
                    style: getDmSansTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.h8,
                  Text(
                    subHeading,style: getDmSansTextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyDark,
                    ),
                  ),

                  AppSpacing.h8,
                  ContainerBg(
                    radius: 7,
                    backgroundColor: AppColors.primary.withOpacity(.1),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        subHeading2,
                        style: getDmSansTextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21.0, right: 10),
              child: Text(
                "${Random().nextInt(111)}m ago",
                style: getDmSansTextStyle(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
