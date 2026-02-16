import 'package:securedtrade/config/path_config.dart';

class BotStrategyDetail extends StatelessWidget {
  const BotStrategyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Strategy Details",
                style: getDmSansTextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  strategyDetailItemView(
                    title: "First Buy in Amount(USDT)",
                    amount: "0",
                  ),
                  Spacer(),
                  strategyDetailItemView(
                    title: "Margin call limit",
                    amount: "0",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: ContainerBg(
                  backgroundColor: AppColors.grey5,
                  height: 1,
                  width: double.infinity,
                  child: SizedBox(),
                ),
              ),
              Row(
                children: [
                  strategyDetailItemView(
                    title: "Take profit ratio",
                    amount: "0%",
                  ),
                  Spacer(),
                  strategyDetailItemView(
                    title: "Earnings callback",
                    amount: "0%",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: ContainerBg(
                  backgroundColor: AppColors.grey5,
                  height: 1,
                  width: double.infinity,
                  child: SizedBox(),
                ),
              ),
              Row(
                children: [
                  strategyDetailItemView(
                    title: "Margin call drop",
                    amount: "-",
                  ),
                  Spacer(),
                  strategyDetailItemView(title: "Buy in callback", amount: "-"),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  strategyDetailItemView({required String title, required String amount}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            title,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 6),
          Text(
            amount,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.greyDark,
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    );
  }
}
