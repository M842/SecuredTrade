
import 'package:securedtrade/config/path_config.dart';


class StrategyPeriodSheet extends StatelessWidget {
  const StrategyPeriodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacing.h16,
        Row(
          children: [
            AppSpacing.w16,
            Text(
              "Strategy Period",
              style: getDmSansTextStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Image.asset(
                AppStrings.closeIcon,
                height: 20,
              ),
            ),
            AppSpacing.w12,
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            2,
                (index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    index == 0 ? "Cycle" : "One-Shot",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),

                  Spacer(),
                  index == 1
                      ? SizedBox()
                      : Icon(
                    Icons.check_circle,
                    color: AppColors.primary,
                  ),
                  AppSpacing.w8,
                ],
              ),
            ),
          ),
        ),

        AppSpacing.h16,
      ],
    );
  }
}
