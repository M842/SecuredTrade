import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/bottom_sheet_utils.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_mode_sheet.dart';

class BotStrategySettingDetail extends StatelessWidget {
  const BotStrategySettingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 345,
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
                  "Details",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      "Strategy Mode",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        fontSize: 14.5,
                      ),
                    ),
                    Spacer(),
                    TextButton(onPressed: (){
                      BottomSheetUtils.show(context: context,
                          child: StrategyModeSheet());
                    },
                        child: Row(children: [
                          Text(
                            "Steady",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppSpacing.w4,
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.black,
                          ),

                        ],))
                  ],
                ),
                SizedBox(height: 6),
                ContainerBg(
                  height: 150,
                  radius: 5,
                  width: double.infinity,
                  backgroundColor: AppColors.grey4,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      strategyModeTextItem(
                        title: "Sell after increasing",
                        values: "1.3%",
                      ),
                      strategyModeTextItem(
                        title: "Buy before dropping",
                        values: "Default",
                      ),
                      strategyModeTextItem(title: "Max Position", values: "7"),
                      strategyModeTextItem(
                        title: "AI Margin Call",
                        values: "Enable",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                ContainerBg(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  strategyModeTextItem({required String title, required String values}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 10, bottom: 5, right: 12),
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
