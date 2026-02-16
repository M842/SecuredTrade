import 'package:securedtrade/config/path_config.dart';

class SelectCurrency extends StatelessWidget {
  final int selectedIndex;
  final Function() onPressed;
  const SelectCurrency({
    super.key,
    required this.selectedIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: ["USDT", "BTC"].map((toElement) {
          int index = ["USDT", "BTC"].indexOf(toElement);
          return Padding(
            padding: const EdgeInsets.only(
              left: 6.0,
              top: 10,
              right: 10,
              bottom: 10,
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: ContainerBg(
                backgroundColor: selectedIndex == index
                    ? AppColors.primary.withOpacity(.1)
                    : AppColors.white,
                borderColor: AppColors.primary,
                bWidth: 1,
                radius: 10,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      toElement,
                      style: getDmSansTextStyle(
                        fontWeight: index == 0
                            ? FontWeight.w500
                            : FontWeight.w500,
                        fontSize: 15,
                        color: selectedIndex == index
                            ? AppColors.primary
                            : AppColors.black2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
    ;
  }
}
