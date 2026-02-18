import 'package:securedtrade/config/path_config.dart';

class AppCustomCard extends StatelessWidget {
  final double height,radius,topPadding,padding,bottomPadding;
  final Widget child;
  const AppCustomCard({super.key,this.radius=14,this.topPadding=16,
    this.bottomPadding=0,
    this.padding=15,required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Card(
        elevation: 1,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: padding,
              right: 15, top: padding,bottom: bottomPadding),
          child: child,
        ),
      ),
    );
  }
}
