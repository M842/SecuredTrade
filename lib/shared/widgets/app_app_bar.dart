import 'package:securedtrade/config/path_config.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool leading,isSuffixIcon;
  final String? title, subtitle;
  final Color appBarColor;
  const AppAppBar({
    super.key,
    required this.title,
    this.subtitle = "",
    this.appBarColor = AppColors.appBarColor,
    this.leading = false,this.isSuffixIcon=true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: appBarColor,
          // gradient: AppUtils().appGradient(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: subtitle!.isEmpty
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            !leading
                ? IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      size: 22,
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                    ),
                  )
                : SizedBox(width: 5),
            //
            SizedBox(height: 0, width: 10),
            subtitle!.isEmpty
                ? Text(
                    title!,
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.black2,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: AppColors.black2,
                        ),
                      ),
                      Text(
                        subtitle!,
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.black2,
                        ),
                      ),
                    ],
                  ),
            SizedBox(height: 0, width: 25),
            Spacer(),

            isSuffixIcon?IconButton(
              onPressed: () {},
              icon: SizedBox(
                height: 22,
                child: Image.asset(
                  AppStrings.notificationIcon,
                  color: AppColors.black2,
                ),
              ),
            ):SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}

class AppAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final bool leading;
  final String title;
  const AppAppBar2({super.key, required this.title, this.leading = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.background,
          // gradient: AppUtils().appGradient(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0, width: 15),
            Image.asset(AppStrings.appBarIcon, height: 45),
            Spacer(),
            Image.asset(AppStrings.notificationIcon, height: 25),
            SizedBox(height: 0, width: 20),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}
