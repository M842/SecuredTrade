import 'package:securedtrade/config/path_config.dart';

class SelectCurrenciesMode extends StatelessWidget {
  final int mSelectedIndex;
  final Function() onPressed;
  const SelectCurrenciesMode({
    super.key,
    required this.mSelectedIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ["Spot", "Future"].map((toElement) {
        int index = ["Spot", "Future"].indexOf(toElement);
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 8.0),
            child: GestureDetector(
              onTap: onPressed,
              child: ContainerBg(
                height: 44,
                radius: 8,
                borderColor: AppColors.primary,
                bWidth: 1,
                backgroundColor: mSelectedIndex == index
                    ? AppColors.primary
                    : Colors.white,
                child: Center(
                  child: Text(
                    toElement,
                    style: GoogleFonts.dmSans(
                      letterSpacing: 1.1,
                      height: 1.1,
                      fontWeight: mSelectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 17,
                      color: mSelectedIndex == index
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
