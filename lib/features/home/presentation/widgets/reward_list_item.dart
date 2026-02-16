import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/data/models/reward_model.dart';

class RewardListItem extends StatelessWidget {
  final RewardModel data;
  const RewardListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(blurRadius: 5, color: Color(0xff000013).withOpacity(.2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: Text(
                      data.date,
                      style: getDmSansTextStyle(
                        fontSize: 14,
                        color: AppColors.black3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 2,
                      bottom: 10,
                    ),
                    child: Text(
                      data.year,
                      style: getDmSansTextStyle(
                        fontSize: 13.6,
                        color: Color(0xff464647),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: data.amount,
                          style: getDmSansTextStyle(
                            fontSize: 16,
                            color: data.type == "Profit"
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " USDT",
                          style: getDmSansTextStyle(
                            fontSize: 16,
                            color: data.type == "Profit"
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5, width: 0),
                  Text(
                    data.type,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff464647),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.black2),
              SizedBox(height: 0, width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
