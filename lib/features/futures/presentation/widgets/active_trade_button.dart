import 'package:securedtrade/config/path_config.dart';

class ActiveTradeButton extends StatelessWidget {
  final Color bgColor, borderColor;
  final String text;
  final Function() onPressed;
  const ActiveTradeButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.text,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: ContainerBg(
          width: double.infinity,
          height: 40,
          radius: 10,
          bWidth: 1,
          borderColor: borderColor,
          backgroundColor: bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text == "Setting"
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        size: 14,
                        Icons.settings_outlined,
                        color: AppColors.black,
                      ),
                    )
                  : SizedBox(),

              Text(
                text,
                style: getDmSansTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: text == "Setting" ? AppColors.black : AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
