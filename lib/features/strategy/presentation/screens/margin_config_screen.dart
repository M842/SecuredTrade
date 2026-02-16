import 'dart:math';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/number_utils.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';
import 'package:securedtrade/core/utils/spacing.dart';

class MarginConfigurationScreen extends StatelessWidget {
  const MarginConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "Margin Configuration", isSuffixIcon: false),
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
                              "Margin call drop",
                              style: getDmSansTextStyle(
                                fontSize: 14,
                                color: AppColors.black.withOpacity(.76),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Multiple buy in radio",
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
                        children: List.generate(
                          7,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 8,
                                  left: 5,
                                ),
                                child: Text(
                                  "${NumberUtils.toOrdinal(index + 1)} Call",
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
                                      align: TextAlign.center,
                                      controller: TextEditingController(
                                        text: (index + 1).toString(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AppTextField(
                                      isPrefixIcon: false,
                                      align: TextAlign.center,
                                      suffixText: "Times ",
                                      controller: TextEditingController(
                                        text: (Random().nextInt(19) + 1)
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSpacing.h8,
                    ],
                  ),
                ),
              ),
              AppButton(height: 47, text: "Confirm", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
