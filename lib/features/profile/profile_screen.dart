import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/shared/widgets/list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(title: "Profile", leading: true),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              height: 204,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: AppGradients.primary,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 135,
                    right: UIHelpers.screenSize(context).width / 1.23,
                    child: Image.asset(
                      width: 90,
                      AppStrings.circleImg,
                      height: 90,
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    left: UIHelpers.screenSize(context).width / 1.32,
                    child: ContainerBg(
                      backgroundColor: AppColors.grey.withOpacity(.1),
                      height: 150,
                      width: 150,
                      radius: 150,
                      child: SizedBox(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                         context.push(AppRoutePaths.editProfile);
                        },
                        icon: Image.asset(
                          height: 20,
                          width: 20,
                          AppStrings.editIcon,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppStrings.profileImg,
                          height: 88,
                          width: 88,
                        ),
                        SizedBox(height: 8, width: 0),
                        Text(
                          "Manish Negi",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "maxedlogicweb@gmail.com",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "+91-9999009999",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8, width: 0),
          ListTiles(image: AppStrings.historyIcon, title: "History", index: 0),
          ListTiles(
            image: AppStrings.notificationIcon2,
            title: "Notification",
            index: 2,
          ),
          ListTiles(
            image: AppStrings.securityIcon,
            title: "Security",
            index: 3,
          ),
          ListTiles(
            image: AppStrings.helpIcon,
            title: "Help and Support",
            index: 4,
          ),
          ListTiles(
            image: AppStrings.termsIcon,
            title: "Terms and Conditions",
            index: 5,
          ),
          ListTiles(image: AppStrings.logout, title: "Logout", index: 6),
          SizedBox(height: 15, width: 0),
          /* IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.logout,
                size: 30,
                color: AppColors.black,
              ))*/
        ],
      ),
    );
  }
}
