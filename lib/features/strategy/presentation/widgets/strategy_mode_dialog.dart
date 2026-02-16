import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/padding_utils.dart';

class StrategyModeDialog extends StatelessWidget {
  const StrategyModeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerBg(
            backgroundColor: AppColors.white,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Strategy Mode",
                  style: getInterTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ContainerBg(
                    backgroundColor: AppColors.primary.withOpacity(.05),
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: PaddingUtils.only(
                            top: 5,bottom: 5
                          ),
                          child: Column(
                            children: [
                              AppSpacing.h4,
                              Row(
                                children: [
                                  AppSpacing.w12,
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        index == 0
                                            ? "Whole Warehouse Mode"
                                            : index == 1
                                            ? "Sub-bin Mode"
                                            : "Sub-bin Mode Real-Time Settlement",
                                        style: getDmSansTextStyle(
                                          fontSize: 14,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                  index == 0
                                      ? Icon(
                                          Icons.check,
                                          size: 20,
                                          color: AppColors.primary,
                                        )
                                      : SizedBox(),
                                  AppSpacing.w16,
                                ],
                              ),
                              index == 2
                                  ? SizedBox()
                                  : ContainerBg(
                                      height: 1,
                                      width: double.infinity,
                                      backgroundColor: AppColors.grey5,
                                      child: SizedBox(),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                ContainerBg(
                  backgroundColor: AppColors.grey5,
                  height: 1,
                  width: double.infinity,
                  child: SizedBox(),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (index == 0) {
                                context.pop();
                              }
                            },
                            child: Text(
                              index == 0 ? "Cancel" : "Confirm",
                              style: getInterTextStyle(
                                fontWeight: FontWeight.w600,
                                color: index == 0
                                    ? AppColors.grey7
                                    : AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          index == 1
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                    left: 35.0,
                                    right: 35,
                                  ),
                                  child: ContainerBg(
                                    backgroundColor: AppColors.grey5,
                                    height: 40,
                                    width: 1,
                                    child: SizedBox(),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
