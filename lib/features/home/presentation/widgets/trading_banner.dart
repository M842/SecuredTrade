import 'package:securedtrade/config/path_config.dart';

class TradingBanner extends StatelessWidget {
  const TradingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff3C4CF9), Color(0xff9515FA)],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0, width: 0),
                Text(
                  "Welcome Agilan,",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Make you first Investment \ntoday",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15, width: 0),
                AppButton(
                  width: 130,
                  padding: 0,
                  height: 40,
                  text: "Invest Today",
                  textColor: AppColors.blue,
                  onPressed: () {
                    //context.read<AuthBloc>().getIsAffiliateUser();
                  },
                  backgroundColor: AppColors.white,
                ),
              ],
            ),
          ),
          Positioned(
            right: -140,
            top: 20,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppStrings.splashAppLogo,
                height: 360,
                width: 360,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
