import 'package:flutter/cupertino.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_mode_dialog.dart';

class ManageStrategy extends StatefulWidget {
  const ManageStrategy({super.key});

  @override
  State<ManageStrategy> createState() => _ManageStrategyState();
}

class _ManageStrategyState extends State<ManageStrategy> {
  String strategyShot = "One-Shot";

  @override
  Widget build(BuildContext context) {
    return AppCustomCard(
      height: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Manage Strategy",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.4,
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_up_rounded, size: 20),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                manageStrategyItemUI(
                  icon: Icons.one_k_rounded,
                  text: strategyShot,
                  index: 0,
                ),
                manageStrategyItemUI(
                  icon: CupertinoIcons.arrow_up_right_circle_fill,
                  text: "Sell",
                  index: 1,
                ),
                manageStrategyItemUI(
                  icon: CupertinoIcons.arrow_down_left_circle_fill,
                  text: "Buy",
                  index: 2,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          manageStrategyItemUI(
            icon: CupertinoIcons.square_stack_3d_up_fill,
            text: "Strategy Mode",
            index: 3,
          ),
        ],
      ),
    );
  }

  manageStrategyItemUI({
    required IconData icon,
    required String text,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        onHandlerEvent(index);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 38, color: AppColors.purple.withOpacity(.85)),
            AppSpacing.h12,
            Text(
              textAlign: TextAlign.center,
              text,
              style: getDmSansTextStyle(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onHandlerEvent(int index) {
    switch (index) {
      case 0:
        if (strategyShot == "One-Shot") {
          strategyShot = "Cycle";
        } else if (strategyShot == "Cycle") {
          strategyShot = "One-Shot";
        }
        setState(() {});
        break;
      case 3:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StrategyModeDialog();
          },
        );
        break;
    }
  }
}
