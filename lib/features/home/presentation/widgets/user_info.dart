
import 'package:securedtrade/config/path_config.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff3C4CF9), Color(0xff9515FA)])),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2, width: 0),
                Text(
                  "Welcome to ${AppStrings.appName}",
                  style: getDmSansTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.white),
                ),
                SizedBox(height: 5, width: 0),
                Text(
                  "${AppStrings.appName} is a crypto trading bot that automates trading strategies for dca_spot and futures markets. Choosing the right strategy depends on your risk tolerance, market conditions, and investment goals. Here are some common strategies used with ${AppStrings.appName}:",
                  style: getDmSansTextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 12, width: 0),
                Row(
                  children: [
                    ContainerBg(
                        height: 9,
                        width: 9,
                        backgroundColor: Color(0xff05DF72),
                        child: SizedBox()),
                    SizedBox(height: 0, width: 10),
                    Text(
                      "Live Markets",
                      style: getDmSansTextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff43FFA1),
                          fontSize: 14),
                    ),
                    SizedBox(height: 0, width: 20),
                    ContainerBg(
                        height: 9,
                        width: 9,
                        backgroundColor: Color(0xffFFDF20),
                        child: SizedBox()),
                    SizedBox(height: 0, width: 10),
                    Text(
                      "4 Strategies",
                      style: getDmSansTextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFDF20),
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 7, width: 0),
              ],
            ),
          ),
          Positioned(
            top: -50,
            left: UIHelpers.screenSize(context).width / 1.3,
            child: Container(
              height: 114,
              width: 114,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey.withOpacity(.14)),
            ),
          ),
          Positioned(
            top: 150,
            right: UIHelpers.screenSize(context).width / 1.2,
            child: Container(
              height: 114,
              width: 114,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey.withOpacity(.20)),
            ),
          ),
        ],
      ),
    );
  }
}
