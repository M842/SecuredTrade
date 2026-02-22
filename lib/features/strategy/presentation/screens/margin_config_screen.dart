import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/number_utils.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';
import 'package:securedtrade/core/utils/spacing.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';

class MarginConfigurationScreen extends StatefulWidget {
  final List<DcaLevel> dcaLevelList;
  const MarginConfigurationScreen({super.key, required this.dcaLevelList});

  @override
  State<MarginConfigurationScreen> createState() =>
      _MarginConfigurationScreenState();
}

class _MarginConfigurationScreenState extends State<MarginConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "DCA Level Configuration", isSuffixIcon: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 1,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price drop",
                              style: getDmSansTextStyle(
                                fontSize: 14,
                                color: AppColors.black.withOpacity(.76),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Capital Percent",
                              style: getDmSansTextStyle(
                                fontSize: 14,
                                color: AppColors.black.withOpacity(.76),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.h(10),

                      Column(
                        children: widget.dcaLevelList.map((toElement) {
                          int index = widget.dcaLevelList.indexOf(toElement);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 8,
                                  left: 5,
                                ),
                                child: Text(
                                  "${NumberUtils.toOrdinal(index + 1)} Level",
                                  style: getDmSansTextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppTextField(
                                      isPrefixIcon: false,
                                      suffixText: "%  ",
                                      onChanged: (val) {
                                        setState(() {
                                          widget.dcaLevelList[index].priceDrop =
                                              double.parse(val.data);
                                        });
                                      },
                                      align: TextAlign.center,
                                      controller: TextEditingController(
                                        text: toElement.priceDrop
                                            .toStringAsFixed(2),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AppTextField(
                                      isPrefixIcon: false,
                                      onChanged: (val) {
                                        setState(() {
                                          widget.dcaLevelList[index].priceDrop =
                                              double.parse(val.data);
                                        });
                                      },
                                      align: TextAlign.center,
                                      suffixText: "Percent",
                                      controller: TextEditingController(
                                        text: /**/ toElement.capitalPercent
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),

                      AppSpacing.h8,
                    ],
                  ),
                ),
              ),
              AppButton(
                height: 47,
                text: "Confirm",
                onPressed: () {
                  context.pop<List<DcaLevel>>(widget.dcaLevelList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
