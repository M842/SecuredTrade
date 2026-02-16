import 'package:securedtrade/config/path_config.dart';

class RiskEngine extends StatelessWidget {
  const RiskEngine({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBg(
      width: double.infinity,
      height: 63,
      bWidth: 1,
      borderColor: Color(0xffB9F8CF),
      backgroundColor: Color(0xffF0FDF4),
      child: Row(
        children: [
          AppSpacing.w16,

          Image.asset(AppStrings.privacyIcon, height: 20),
          AppSpacing.w16,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Risk Engine: Active",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.black,
                ),
              ),
              AppSpacing.h4,
              Text(
                "Strict risk control enabled. Max leverage capped at 3x.",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
