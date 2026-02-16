import 'package:securedtrade/config/path_config.dart';

class TradeButton extends StatelessWidget {
  final String title;
  final Color backgroundColor, txColor;
  final double radius;
  final Function()onTap;
  const TradeButton({
    super.key,
    this.radius=8,
    required this.title,
    required this.backgroundColor,
    required this.txColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(onTap: onTap,
        child: ContainerBg(
          radius: radius,
          height: 50,
          backgroundColor: backgroundColor,
          child: Center(
            child: Text(
              title,
              style: getDmSansTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: txColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
