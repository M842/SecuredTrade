import 'package:securedtrade/config/path_config.dart';

class StrategyStatus extends StatelessWidget {
  final String heading,
      botName,
      labelTotalPnL,
      totalPnL,
      labelInvestMargin,
      investMargin,
      imgIcon;
  const StrategyStatus({
    super.key,
    required this.heading,
    required this.botName,
    required this.labelInvestMargin,
    required this.labelTotalPnL,
    required this.totalPnL,
    required this.investMargin,
    required this.imgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,

      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: AppGradients.secondary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      botName,
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ContainerBg(
                  height: 48,
                  radius: 40,
                  width: 48,
                  backgroundColor: AppColors.white.withOpacity(.2),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      imgIcon,

                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                strategyTextView(
                  title: labelInvestMargin,
                  amount: investMargin,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: ContainerBg(
                    width: 1,
                    height: 40,
                    backgroundColor: AppColors.white.withOpacity(.3),
                    child: SizedBox(),
                  ),
                ),
                strategyTextView(title: labelTotalPnL, amount: totalPnL),
              ],
            ),
          ],
        ),
      ),
    );
  }

  strategyTextView({required String title, required String amount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getDmSansTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          amount,
          style: getDmSansTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
