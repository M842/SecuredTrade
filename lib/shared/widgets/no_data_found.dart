import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/ui_helpers.dart';
class NoDataFound extends StatelessWidget {
  final String text;
  final double height;
  const NoDataFound({Key? key, required this.text, this.height = 3.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              height: UIHelpers.screenSize(context).height / height,
              AppStrings.noRecordFound,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: getPlusJakartaSansTextStyle(
                color: AppColors.black.withOpacity(.6),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          //Text('Go back to the chart if you want to open trade', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
