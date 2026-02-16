import 'package:securedtrade/config/path_config.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double bWidth, fontSize, padding, height, width, raidus;
  final Color backgroundColor, borderColor, textColor;
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bWidth = 0,
    this.fontSize = 17,
    this.padding = 15,
    this.height = 55,
    this.width = double.infinity,
    this.raidus = 8,
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.secondary,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    /*  Card(
        shadowColor: AppColors.primary,
        color: AppColors.secondary,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Login",
              style: getPTSandTextStyle(
                  color: AppColors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )),*/
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: bWidth),
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(raidus)),
            /*  gradient: LinearGradient(
              colors: [
                Color(0xFF8E0038), // Dark pink shade
                Color(0xFF500021), // Deep maroon shade
                Color(0xFF280010), // Almost black
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),*/
          ),
          child: Center(
            child: Text(
              text,
              style: getDmSansTextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
