

import 'package:securedtrade/config/path_config.dart';

class ContainerBg extends StatelessWidget {
  final double? radius, bWidth, width, height;
  final Widget child;
  final Color backgroundColor, borderColor;
  const ContainerBg(
      {super.key,
        this.radius = 5,
        this.backgroundColor = AppColors.primary,
        this.bWidth = 0,
        required this.child,
        this.borderColor = Colors.transparent,
        this.width,
        this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: bWidth!, color: borderColor),
          borderRadius: BorderRadius.circular(radius!)),
      child: child,
    );
  }
}