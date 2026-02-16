import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/presentation/widgets/user_guide_item_list.dart';
import 'package:securedtrade/features/home/presentation/widgets/user_info.dart';

class UserGuideScreen extends StatefulWidget {
  const UserGuideScreen({super.key});

  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  bool isExpanded1 = true,
      isExpanded2 = false,
      isExpanded3 = false,
      isExpanded4 = false,
      isExpanded5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(
        title: "User Guide",
        subtitle: "Master your strategies",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfo(),
              SizedBox(height: 20, width: 0),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  "Choose Your Strategy",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 10, width: 0),
              UserGuideItemList(),
              SizedBox(height: 20, width: 0),
              Container(
                height: 235,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xffC5CAFF), Color(0xffE8CCFF)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -30,
                      left: UIHelpers.screenSize(context).width / 1.3,
                      child: Container(
                        height: 114,
                        width: 114,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffE1C6F3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 170,
                      right: UIHelpers.screenSize(context).width / 1.24,
                      child: Container(
                        height: 114,
                        width: 114,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffA445CD).withOpacity(.20),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20, width: 0),
                        Text(
                          "Ready to Start Trading?",
                          style: getDmSansTextStyle(
                            fontSize: 21,
                            color: AppColors.black2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 8,
                          ),
                          child: Text(
                            "Choose your strategy and begin automated trading with confidence. Our advanced algorithms work 24/7 to maximize your returns.",
                            style: getDmSansTextStyle(
                              fontSize: 16,
                              color: Color(0xff464647),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 70.0,
                            right: 70.0,
                          ),
                          child: AppButton(text: "Start Now", onPressed: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
