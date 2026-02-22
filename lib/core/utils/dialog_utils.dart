import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/theme/app_colors.dart';
import 'package:securedtrade/shared/styles/text_styles.dart';

class DialogUtils {
  static Future<void> forceLogout({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: getOutfitTextStyle(fontSize: 18, color: AppColors.black),
        ),
        content: Text(
          message,
          style: getPlusJakartaSansTextStyle(
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(Logout());
              context.go(AppRoutePaths.login);
            },
            child: Text(
              'Re-Login',
              style: getOutfitTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> logout({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: getOutfitTextStyle(fontSize: 18, color: AppColors.black),
          ),
          content: Text(
            message,
            style: getPlusJakartaSansTextStyle(
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                "Cancel".toUpperCase(),
                style: getOutfitTextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
                context.go(AppRoutePaths.login);
              },
              child: Text(
                "OK",
                style: getOutfitTextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void sveTradeSettingDialog(
    BuildContext context,
    Map<dynamic, dynamic> params,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ContainerBg(
              radius: 14,
              backgroundColor: AppColors.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Image.asset(
                          AppStrings.closeIcon,
                          height: 25,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Confirm saving the current trade setting?",
                    style: getDmSansTextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: List.generate(
                      2,
                      (tEl) => Expanded(
                        child: AppButton(
                          bWidth: 0,
                          height: 46,
                          borderColor: AppColors.grey5,
                          textColor: tEl == 0
                              ? AppColors.black
                              : AppColors.white,
                          backgroundColor: tEl == 0
                              ? AppColors.grey5
                              : AppColors.primary,
                          text: tEl == 0 ? "Return" : "Confirm",
                          onPressed: () {
                            if (tEl == 0) {
                              context.pop();
                            } else {
                              context.read<StrategyBloc>().add(
                                SaveTradeSettingData(params: params),
                              );
                              context.pop();
                              context.pop();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
