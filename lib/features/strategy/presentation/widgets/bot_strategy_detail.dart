import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';

class BotStrategyDetail extends StatelessWidget {
  final SpotTradeSettingModel? mData;
  const BotStrategyDetail({super.key, required this.mData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    amount: mData == null
                        ? "0"
                        : mData!.data.spotConfig.dcaLevels.first.priceDrop
                              .toString(),
                  ),
                  Spacer(),
                  strategyDetailItemView(
                    title: "Max DCA Count",
                    amount: mData == null
                        ? "0"
                        : mData!.data.spotConfig.maxDcaCount.toString(),
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
                    amount: mData == null
                        ? "0"
                        : "${mData!.data.spotConfig.takeProfitPercent}0%",
                  ),
                  Spacer(),
                  strategyDetailItemView(
                    title: "Trailing Stop Percent",
                    amount: mData == null
                        ? "0%"
                        : "${mData!.data.spotConfig.trailingStopPercent.toString()}0%",
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
                    amount: mData == null
                        ? "0%"
                        : "${mData!.data.spotConfig.rsiDca}%",
                  ),
                  Spacer(),
                  strategyDetailItemView(
                    title: "RSI Entry",
                    amount: mData == null
                        ? "0%"
                        : "${mData!.data.spotConfig.rsiEntry}%",
                  ),
                ],
              ),
              AppSpacing.h16,
            ],
          ),
        ),
      ),
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
