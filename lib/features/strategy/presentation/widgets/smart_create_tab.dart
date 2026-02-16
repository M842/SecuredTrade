import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/bottom_sheet_utils.dart';
import 'package:securedtrade/core/utils/dialog_utils.dart';
import 'package:securedtrade/core/utils/number_utils.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';
import 'package:securedtrade/core/utils/spacing.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_period_sheet.dart';

class SmartCreateTab extends StatefulWidget {
  const SmartCreateTab({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        SizedBox(
          height: 65,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Card(
              elevation: 1,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Row(
                  children: [
                    Text(
                      "Strategy Period",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        BottomSheetUtils.show(
                          context: context,
                          child: StrategyPeriodSheet(),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Cycle",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        BotStrategySettingDetail(),

        AppCustomCard(
          padding: 0,
          height: isMarginListShow ? 699 : 244,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h12,

              Row(
                children: [
                  AppSpacing.w(16),
                  Text(
                    "First Buy in Amount",
                    style: getDmSansTextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "USDT ",
                      align: TextAlign.center,
                      radius: 4,
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
                      "Multiples",
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
                      hintText: "",
                      controller: editMultipleController,
                      align: TextAlign.center,
                      radius: 4,
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
                    "Margin Call Parameters",
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
                        (index) => Padding(
                          padding: PaddingUtils.only(left: 12, right: 8),
                          child: Text(
                            textAlign: TextAlign.center,
                            index == 0
                                ? "Margin Call Count"
                                : index == 1
                                ? "Drop Rate"
                                : "Buy USDT",
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              AppSpacing.h20,
              isMarginListShow
                  ? Column(
                      children: List.generate(
                        7,
                        (index) => Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: PaddingUtils.only(left: 15),
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

        AppButton(
          text: "Save",
          onPressed: () {
            DialogUtils.sveTradeSettingDialog(context);
          },
        ),
      ],
    );
  }
}
