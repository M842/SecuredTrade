import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/dialog_utils.dart';
import 'package:securedtrade/features/strategy/data/models/margin_config_model.dart';
import 'package:securedtrade/features/strategy/data/models/margin_limit_model.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/data/models/trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_mode_dialog.dart';

class ManualCreateTab extends StatefulWidget {
  final SpotTradeSettingModel? tradeSettingModel;

  final String symbol;
  const ManualCreateTab({
    super.key,
    required this.tradeSettingModel,
    required this.symbol,
  });

  @override
  State<ManualCreateTab> createState() => _ManualCreateTabState();
}

class _ManualCreateTabState extends State<ManualCreateTab> {
  TextEditingController editInitialBuyController = TextEditingController(
    text: "1.2",
  );

  TextEditingController editDCACountController = TextEditingController(
    text: "7",
  );

  TextEditingController editTakeProfitPercentController = TextEditingController(
    text: "1.4",
  );

  TextEditingController editTrailingStopPercentController =
      TextEditingController(text: "0.2");

  TextEditingController editRSIEntryController = TextEditingController(
    text: "0.5",
  );
  TextEditingController editRSIDCAController = TextEditingController(
    text: "0.5",
  );

  bool isEmaFilter = false;

  List<DcaLevel> dcsLevelList = [];

  @override
  void initState() {
    // TODO: implement initState
    onInitTradeSetting();
    super.initState();
  }

  onInitTradeSetting() {
    if (widget.tradeSettingModel != null) {
      editRSIEntryController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .rsiEntry
          .toString();
      isEmaFilter = widget.tradeSettingModel!.data.spotConfig.useEmaFilter;
      editInitialBuyController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .initialBuyPercent
          .toString();
      editDCACountController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .maxDcaCount
          .toString();
      editTakeProfitPercentController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .takeProfitPercent
          .toString();
      editTrailingStopPercentController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .trailingStopPercent
          .toString();
      editRSIDCAController.text = widget
          .tradeSettingModel!
          .data
          .spotConfig
          .rsiDca
          .toString();
      dcsLevelList = widget.tradeSettingModel!.data.spotConfig.dcaLevels;
    } else {
      setDcsLevels(dca: editDCACountController.text.trim());
    }
  }

  setDcsLevels({required String dca}) {
    for (int i = 1; i <= int.parse(dca); i++) {
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
    return Column(
      children: [
        AppSpacing.h16,

        /* SizedBox(height: 10),
        AppCustomCard(
          radius: 7,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  "My Template",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Choose a strategy setting",
                        style: getDmSansTextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        //Strategy
        SizedBox(height: 4),
        AppCustomCard(
          radius: 7,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  "Strategy Mode",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.error, size: 20, color: AppColors.grey),

                Expanded(
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) {
                          return StrategyModeDialog();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Whole Warehouse Mode",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),*/
        AppCustomCard(
          height: 164,
          radius: 10,
          child: Column(
            children: [
              Row(
                children: [
                  headingTextView(title: "Initial Buy Percent"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "% ",
                      radius: 4,
                      controller: editInitialBuyController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "0.1",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              AppSpacing.h8,
              dividerLine(),

              Row(
                children: [
                  headingTextView(title: "Use EMA Filter"),
                  Spacer(),
                  Switch(
                    value: isEmaFilter,
                    activeThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.white,
                    activeColor: AppColors.secondary,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,

                    onChanged: (onChanged) {
                      setState(() {
                        if (isEmaFilter) {
                          isEmaFilter = false;
                        } else {
                          isEmaFilter = true;
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        AppCustomCard(
          height: 520,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Parameter Settings",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 12),

              dividerLine(),

              Row(
                children: [
                  headingTextView(title: "Max DCA count"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "",
                      radius: 4,
                      textInputType: TextInputType.number,
                      controller: editDCACountController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      onChanged: (val) {
                        dcsLevelList.clear();
                        for (int i = 1; i <= int.parse(val.data); i++) {
                          dcsLevelList.add(
                            DcaLevel(
                              priceDrop: Random().nextInt(10) + 1,
                              capitalPercent: (Random().nextInt(19) + 1),
                            ),
                          );
                        }
                      },
                      hintText: "0",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Take Profit Percent"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      controller: editTakeProfitPercentController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "1.4",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Trailing Stop Percent"),
                  Spacer(),
                  //Icon(Icons.error, color: AppColors.grey, size: 18),
                  SizedBox(width: 4),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      controller: editTrailingStopPercentController,
                      hintText: "0.2",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "DCA configuration"),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      final result = await context.push<List<DcaLevel>>(
                        AppRoutePaths.marginConfig,
                        extra: dcsLevelList,
                      );
                      if (result != null) {
                        setState(() {
                          dcsLevelList = result;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black2,
                      size: 18,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "RSI Entry"),
                  //Icon(Icons.error, color: AppColors.grey, size: 18),
                  Spacer(),

                  SizedBox(width: 4),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      controller: editRSIEntryController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "0.5",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),

              dividerLine(),
              /* Row(
                children: [
                  headingTextView(
                    title: "RSI DCA",
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black2,
                      size: 18,
                    ),
                  ),
                ],
              ),*/
              //dividerLine(),
              Row(
                children: [
                  headingTextView(title: "RSI DCA"),
                  Spacer(),
                  // Icon(Icons.error, color: AppColors.grey),
                  SizedBox(width: 7),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      controller: editRSIDCAController,
                      hintText: "0.3",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        AppButton(
          text: "Save",
          onPressed: () {
            // if (validation()) {
            SpotConfig rq = SpotConfig(
              useEmaFilter: isEmaFilter,

              initialBuyPercent: double.parse(
                editInitialBuyController.text.toString(),
              ),
              maxDcaCount: int.parse(editDCACountController.text),

              takeProfitPercent: double.parse(
                editTakeProfitPercentController.text,
              ),
              trailingStopPercent: double.parse(
                editTrailingStopPercentController.text,
              ),
              rsiEntry: editRSIEntryController.text,
              rsiDca: editRSIDCAController.text,
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
            //  }
          },
        ),
        SizedBox(height: 15),
      ],
    );
  }

  dividerLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: ContainerBg(
        backgroundColor: AppColors.grey5,
        width: double.infinity,
        height: 1,
        child: SizedBox(),
      ),
    );
  }

  headingTextView({required String title}) {
    return Text(
      title,
      style: getDmSansTextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  bool validation() {
    if (double.parse(editInitialBuyController.text) <= 0 ||
        double.parse(editInitialBuyController.text) > 1) {
      SnackbarHelper.show(
        context,
        message: "Initial Buy Percent must be between 0 and 1",
      );
      return false;
    }

    if (int.parse(editDCACountController.text) < 0 ||
        int.parse(editDCACountController.text) > 20) {
      SnackbarHelper.show(
        context,
        message: "Max Dca Count must be between 0 and 20",
      );
      return false;
    }

    if (int.parse(editTakeProfitPercentController.text) <= 0 ||
        int.parse(editTakeProfitPercentController.text) > 0.5) {
      SnackbarHelper.show(
        context,
        message: "Take Profit Percent must be between 0 and 0.5",
      );
      return false;
    }

    if (int.parse(editTrailingStopPercentController.text) < 0 ||
        int.parse(editTrailingStopPercentController.text) > 0.5) {
      SnackbarHelper.show(
        context,
        message: "Trailing Stop Percent must be between 0 and 0.5",
      );
      return false;
    }

    if (int.parse(editRSIEntryController.text) < 0 ||
        int.parse(editRSIEntryController.text) > 100) {
      SnackbarHelper.show(
        context,
        message: "RSI Entry must be between 0 and 100",
      );
      return false;
    }

    if (int.parse(editRSIDCAController.text) < 0 ||
        int.parse(editRSIDCAController.text) > 100) {
      SnackbarHelper.show(
        context,
        message: "RSI DCA must be between 0 and 100",
      );
      return false;
    }
    return true;
  }
}
