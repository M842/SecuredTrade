import 'package:securedtrade/config/path_config.dart';

class FuturePerfItemInfo extends StatelessWidget {
  final Color txColor;
  final String title, value;
  const FuturePerfItemInfo({
    super.key,
    required this.title,
    required this.txColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: AppColors.greyDark,
            ),
          ),
          AppSpacing.h4,
          Text(
            value,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: txColor,
            ),
          ),
        ],
      ),
    );
  }
}
