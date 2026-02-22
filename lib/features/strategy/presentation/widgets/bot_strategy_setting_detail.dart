import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/bottom_sheet_utils.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_mode_sheet.dart';

class BotStrategySettingDetail extends StatelessWidget {
  const BotStrategySettingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Card(
          elevation: 1,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Intelligence Details",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                ),

                AppSpacing.h20,
                ContainerBg(
                  height: 205,
                  radius: 5,
                  width: double.infinity,
                  backgroundColor: AppColors.grey4,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      strategyModeTextItem(
                        title: "EMA Filter",
                        values: "Enable",
                      ),
                      strategyModeTextItem(
                        title: "Take Profile Percent",
                        values: "1.4",
                      ),strategyModeTextItem(
                        title: "Trailing Stop Percent",
                        values: "0.2",
                      ),
                      strategyModeTextItem(title: "RSI Entry", values: "1.3%"),
                      strategyModeTextItem(title: "RSI DCA", values: "0.5"),


                    ],
                  ),
                ),
                SizedBox(height: 14),
                /*ContainerBg(
                  height: 50,
                  radius: 5,
                  width: double.infinity,
                  backgroundColor: AppColors.grey4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Enter Parameters Here",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.greyDark,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: AppColors.greyDark,
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  strategyModeTextItem({required String title, required String values}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 10, bottom: 10, right: 12),
      child: Row(
        children: [
          Text(
            title,
            style: getDmSansTextStyle(
              fontSize: 12,
              color: AppColors.greyDark,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Text(
            values,
            style: getDmSansTextStyle(
              fontSize: 12,
              color: AppColors.greyDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
