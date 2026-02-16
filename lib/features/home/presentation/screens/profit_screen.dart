import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/shared/widgets/app_tabs_view.dart';

class ProfitScreen extends StatelessWidget {
  const ProfitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(title: "Profit Detail"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shadowColor: AppColors.secondary,
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                height: 186,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: AppGradients.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildBalanceUI(
                      heading: "  Total Profit\nToday(USDT)",
                      value: "0.00",
                      value2: "=\$0.00",
                    ),
                    Container(
                      height: 80,
                      width: 1,
                      color: AppColors.white.withOpacity(.65),
                    ),
                    buildBalanceUI(
                      heading: "Total Profit(USDT)",
                      value: "0.00",
                      value2: "=\$0.00",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ContainerBg(
              radius: 10,
              backgroundColor: AppColors.grey.withOpacity(.05),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8,
                  top: 9,
                  bottom: 9,
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: AppColors.black),
                    SizedBox(height: 0, width: 10),
                    Expanded(
                      child: Text(
                        "Profit will only be shown after all position are closed.",
                        style: getPlusJakartaSansTextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10, width: 0),
          Flexible(child: AppTabs()),
        ],
      ),
    );
  }

  buildBalanceUI({
    required String heading,
    required String value,
    required String value2,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: getPlusJakartaSansTextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15, width: 0),
          Text(
            value,
            style: getPlusJakartaSansTextStyle(
              fontSize: 17,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2, width: 0),
          Text(
            value2,
            style: getPlusJakartaSansTextStyle(
              fontSize: 15,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  buildTransactionHistory() {
    return Expanded(
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 15, width: 0)],
        ),
      ),
    );
  }
}
