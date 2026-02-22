import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/bottom_sheet_utils.dart';
import 'package:securedtrade/core/utils/dialog_utils.dart';
import 'package:securedtrade/core/utils/number_utils.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';
import 'package:securedtrade/core/utils/spacing.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_period_sheet.dart';

class SmartCreateTab extends StatefulWidget {
  final SpotTradeSettingModel? tradeSettingModel;

  final String symbol;
  const SmartCreateTab({
    super.key,
    required this.tradeSettingModel,
    required this.symbol,
  });

  @override
  State<SmartCreateTab> createState() => _SmartCreateTabState();
}

class _SmartCreateTabState extends State<SmartCreateTab> {
  bool isMarginListShow = false;

  TextEditingController? editMultipleController = TextEditingController(
    text: "2",
  );
  TextEditingController? editFirstBuyController = TextEditingController(
    text: "12",
  );

  List<DcaLevel> dcsLevelList = [];

  @override
  void initState() {
    // TODO: implement initState
    setDcaLevel(dcaCount: editMultipleController!.text);
    super.initState();
  }

  setDcaLevel({required String dcaCount}) {
    for (int i = 1; i <= int.parse(dcaCount); i++) {
      dcsLevelList.add(
        DcaLevel(
          priceDrop: Random().nextInt(10) + 1,
          capitalPercent: (Random().nextInt(19) + 1),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StrategyBloc, StrategyState>(
      listener: (BuildContext context, StrategyState state) {
        if (state is TradeSettingSaved) {
          SnackbarHelper.show(
            context,
            message: state.messages,
            backgroundColor: AppColors.green,
          );
        }
      },
      child: Column(
        children: [
          AppSpacing.h20,

          BotStrategySettingDetail(),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Card(
              elevation: 1,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              //height: isMarginListShow ? 699 : 244,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: 0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.h12,

                    Row(
                      children: [
                        AppSpacing.w(16),
                        Text(
                          "Initial Buy in Percent",
                          style: getDmSansTextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),

                        Expanded(
                          child: AppTextField(
                            suffixText: "%",
                            align: TextAlign.center,
                            radius: 4,
                            textInputType: TextInputType.number,
                            controller: editFirstBuyController,
                            fillColor: AppColors.grey4,
                            borderColor: AppColors.grey5,
                            borderWidth: 0,
                            padding: 0,
                            hintText: "",
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.h12,
                    Row(
                      children: [
                        AppSpacing.w(16),
                        Expanded(
                          child: Text(
                            "Max DCA Count",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(child: SizedBox()),

                        Expanded(
                          child: AppTextField(
                            hintText: "DCA count",
                            controller: editMultipleController,
                            align: TextAlign.center,
                            radius: 4,
                            onChanged: (val) {
                              setState(() {
                                dcsLevelList.clear();
                              });

                              setDcaLevel(dcaCount: val.data);
                            },
                            fillColor: AppColors.grey4,
                            borderColor: AppColors.grey4,
                            borderWidth: 0,
                            padding: 0,
                            isPrefixIcon: false,
                            isSuffixIcon: false,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.h16,
                    Row(
                      children: [
                        AppSpacing.w(16),
                        Text(
                          "DCA Call Parameters",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.black,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (isMarginListShow) {
                                isMarginListShow = false;
                              } else {
                                isMarginListShow = true;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "Show",
                                style: getDmSansTextStyle(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.h20,
                    isMarginListShow
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (index) => Expanded(
                                child: Padding(
                                  padding: PaddingUtils.only(
                                    left: 12,
                                    right: 8,
                                  ),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    index == 0
                                        ? "DCA Count Call"
                                        : index == 1
                                        ? "Price Drop"
                                        : "Cap Percent",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    AppSpacing.h20,
                    isMarginListShow
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              dcsLevelList.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 5,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: PaddingUtils.only(
                                              left: 15,
                                            ),
                                            child: Text(
                                              "${NumberUtils.toOrdinal(index + 1)} Call",
                                              style: getDmSansTextStyle(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              "${Random().nextDouble().toStringAsFixed(2)}%",
                                              style: getDmSansTextStyle(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              Random().nextInt(220).toString(),
                                              style: getDmSansTextStyle(
                                                fontSize: 15,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        AppSpacing.w(10),
                                      ],
                                    ),
                                    index == 6
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                              top: 14.0,
                                              bottom: 12.0,
                                            ),
                                            child: ContainerBg(
                                              child: SizedBox(),
                                              height: 1,
                                              width: double.infinity,
                                              backgroundColor: AppColors.grey5,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),

          AppButton(
            text: "Save",
            onPressed: () {
              SpotConfig rq = SpotConfig(
                useEmaFilter: true,

                initialBuyPercent: double.parse(
                  editFirstBuyController!.text.toString(),
                ),
                maxDcaCount: int.parse(editMultipleController!.text),

                takeProfitPercent: 1.4,
                trailingStopPercent: 0.2,
                rsiEntry: 1.3,
                rsiDca: 0.5,
                dcaLevels: dcsLevelList,
              );
              final setting = rq.toJson();
              Map<dynamic, dynamic> params = {
                "pair": widget.symbol,

                "setting": {
                  "mode": TradingMode.spot.value,
                  "symbols": widget.symbol,
                  "spotConfig": setting,
                },
              };

              DialogUtils.sveTradeSettingDialog(context, params);
            },
          ),
        ],
      ),
    );
  }
}
