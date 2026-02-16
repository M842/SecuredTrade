import 'package:securedtrade/config/path_config.dart';

class HomeTradeOptionModel {
  final String title, icon;
  HomeTradeOptionModel({required this.title, required this.icon});
}

class HomeItemList extends StatefulWidget {
  const HomeItemList({super.key});

  @override
  State<HomeItemList> createState() => _HomeItemListState();
}

class _HomeItemListState extends State<HomeItemList> {
  List<HomeTradeOptionModel> homeOptionList = [
    HomeTradeOptionModel(title: "API", icon: AppStrings.apiManage),
    HomeTradeOptionModel(title: "Profit", icon: AppStrings.profitDetail),
    HomeTradeOptionModel(title: "Reward", icon: AppStrings.reward),
    HomeTradeOptionModel(title: "Wallet", icon: AppStrings.walletIcon2),
    HomeTradeOptionModel(title: "Invite", icon: AppStrings.inviteFriend),
    HomeTradeOptionModel(title: "Guide", icon: AppStrings.userGuide),
    HomeTradeOptionModel(title: "Mentor", icon: AppStrings.mentor),
    HomeTradeOptionModel(title: "More", icon: AppStrings.more),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10, width: 0),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              homeItemUI(homeOptionList[0].title, homeOptionList[0].icon),
              homeItemUI(homeOptionList[1].title, homeOptionList[1].icon),
              homeItemUI(homeOptionList[2].title, homeOptionList[2].icon),
              homeItemUI(homeOptionList[3].title, homeOptionList[3].icon),
            ],
          ),
        ),
        SizedBox(height: 12, width: 0),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              homeItemUI(homeOptionList[4].title, homeOptionList[4].icon),
              homeItemUI(homeOptionList[5].title, homeOptionList[5].icon),
              homeItemUI(homeOptionList[6].title, homeOptionList[6].icon),
              homeItemUI(homeOptionList[7].title, homeOptionList[7].icon),
              //buildItem(homeOptionList[3].title, homeOptionList[3].icon),
            ],
          ),
        ),
      ],
    );
  }

  homeItemUI(String title, String icon) {
    int index = homeOptionList.indexWhere((element) => element.title == title);
    return GestureDetector(
      onTap: () {
        onHandlerEvent(index);
      },
      child: Column(
        children: [
          SizedBox(height: 5, width: 0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.primary),

              borderRadius: BorderRadius.circular(12),
              color: AppColors.primary.withOpacity(.1),
              //gradient: AppUtils().appGradient2()
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  icon,
                  color: AppColors.primary,
                  height: 29,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5, width: 0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 5),
            child: Text(
              title,
              style: getOutfitTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.5,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(height: 10, width: 0),
        ],
      ),
    );
  }

  void onHandlerEvent(int index) {
    switch (index) {
      case 0:
        context.push(AppRoutePaths.apiManage);
        break;
      case 1:
        context.push(AppRoutePaths.profitDetail);
        break;
      case 2:
        context.push(AppRoutePaths.rewardDetail);
        break;
      case 3:

        context.push(AppRoutePaths.wallet, extra: false);
        break;
      case 4:
        //AppUtils().navPushName(context, AppRoutes.inviteFriends);
        break;
      case 5:
        //Get.toNamed(AppRoutes.userGuide);
      context.push(AppRoutePaths.userGuide);
        break;
    }
  }
}
