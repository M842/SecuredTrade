import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

class SpotBotStrategyDetail extends StatelessWidget {
  final SpotTradeSettingModel? tradeSettingModel;
  const SpotBotStrategyDetail({super.key, required this.tradeSettingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: AppCustomCard(
            radius: 8,
            topPadding: 5,
            bottomPadding: 10,
            height: 70,
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    "Initial Buy In Percent",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  ContainerBg(
                    bWidth: 1,
                    backgroundColor: AppColors.grey5.withOpacity(.7),
                    borderColor: AppColors.grey6.withOpacity(.3),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8,
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            tradeSettingModel == null
                                ? "0.0"
                                : tradeSettingModel!
                                      .data
                                      .spotConfig
                                      .initialBuyPercent
                                      .toString(),
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),

                          Text(
                            " %",
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.w8,
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5,
            top: 5,
            bottom: 6,
          ),
          child: AppCustomCard(
            bottomPadding: 15,
            radius: 8,

            height: 72,
            child: Row(
              children: [
                Text(
                  "Use EMA Filter",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Switch(
                  value: tradeSettingModel == null
                      ? false
                      : tradeSettingModel!.data.spotConfig.useEmaFilter,
                  activeThumbColor: AppColors.white,
                  inactiveTrackColor: tradeSettingModel == null
                      ? AppColors.white
                      : !tradeSettingModel!.data.spotConfig.useEmaFilter
                      ? AppColors.white
                      : AppColors.primary,
                  activeColor: tradeSettingModel == null
                      ? AppColors.white
                      : !tradeSettingModel!.data.spotConfig.useEmaFilter
                      ? AppColors.white
                      : AppColors.secondary,
                  activeTrackColor: tradeSettingModel == null
                      ? AppColors.white
                      : !tradeSettingModel!.data.spotConfig.useEmaFilter
                      ? AppColors.white
                      : AppColors.primary,
                  inactiveThumbColor: AppColors.primary,

                  onChanged: (onChanged) {},
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h12,
                  Text(
                    "Strategy Details",
                    style: getDmSansTextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.h16,
                  Row(
                    children: [
                      strategyDetailItemView(
                        title: "DCA level drop(%)",
                        amount: tradeSettingModel == null
                            ? "0"
                            : tradeSettingModel!
                                  .data
                                  .spotConfig
                                  .dcaLevels
                                  .first
                                  .priceDrop
                                  .toString(),
                      ),
                      Spacer(),
                      strategyDetailItemView(
                        title: "Max DCA Count",
                        amount: tradeSettingModel == null
                            ? "0"
                            : tradeSettingModel!.data.spotConfig.maxDcaCount
                                  .toString(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: ContainerBg(
                      backgroundColor: AppColors.grey5,
                      height: 1,
                      width: double.infinity,
                      child: SizedBox(),
                    ),
                  ),
                  Row(
                    children: [
                      strategyDetailItemView(
                        title: "Take profit percent",
                        amount: tradeSettingModel == null
                            ? "0"
                            : "${tradeSettingModel!.data.spotConfig.takeProfitPercent}0%",
                      ),
                      Spacer(),
                      strategyDetailItemView(
                        title: "Trailing Stop Percent",
                        amount: tradeSettingModel == null
                            ? "0%"
                            : "${tradeSettingModel!.data.spotConfig.trailingStopPercent.toString()}0%",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: ContainerBg(
                      backgroundColor: AppColors.grey5,
                      height: 1,
                      width: double.infinity,
                      child: SizedBox(),
                    ),
                  ),
                  Row(
                    children: [
                      strategyDetailItemView(
                        title: "RSI DCA",
                        amount: tradeSettingModel == null
                            ? "0%"
                            : "${tradeSettingModel!.data.spotConfig.rsiDca}%",
                      ),
                      Spacer(),
                      strategyDetailItemView(
                        title: "RSI Entry",
                        amount: tradeSettingModel == null
                            ? "0%"
                            : "${tradeSettingModel!.data.spotConfig.rsiEntry}%",
                      ),
                    ],
                  ),
                  AppSpacing.h16,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  strategyDetailItemView({required String title, required String amount}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            title,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 6),
          Text(
            amount,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.greyDark,
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    );
  }
}
