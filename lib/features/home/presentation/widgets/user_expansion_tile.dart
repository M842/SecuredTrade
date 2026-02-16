import 'package:securedtrade/config/path_config.dart';

class UserGuideExpansionTile extends StatelessWidget {
  final BuildContext context;
  final String strategyName,
      tradingName,
      img,
      title,
      perfectFor,
      config1,
      config2,
      config3,
      config4;

  const UserGuideExpansionTile({
    super.key,
    required this.context,
    required this.strategyName,
    required this.tradingName,
    required this.img,
    required this.title,
    required this.perfectFor,
    required this.config1,
    required this.config2,
    required this.config3,
    required this.config4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ContainerBg(
        backgroundColor: AppColors.white,
        radius: 16,
        bWidth: 1,
        borderColor: Color(0xff6B6B6B33),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Icon(Icons.keyboard_arrow_down_sharp),
            ),
            backgroundColor: AppColors.white,
            title: Column(
              children: [
                SizedBox(height: 12, width: 0),
                Row(
                  children: [
                    img == "AI"
                        ? ContainerBg(
                            borderColor: AppColors.primary,
                            bWidth: 1,
                            backgroundColor: AppColors.primary.withOpacity(.1),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(
                                height: 30,
                                width: 30,
                                color: AppColors.primary,
                                AppStrings.aiTradingIcon,
                              ),
                            ),
                          )
                        : Image.asset(img, height: 36, width: 36),
                    SizedBox(height: 0, width: 18),
                    tradingName.isEmpty
                        ? Text(
                            strategyName,
                            style: getDmSansTextStyle(
                              fontSize: 16,
                              color: AppColors.black2,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                strategyName,
                                style: getDmSansTextStyle(
                                  fontSize: 16,
                                  color: AppColors.black2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                tradingName,
                                style: getDmSansTextStyle(
                                  fontSize: 16,
                                  color: AppColors.black2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                SizedBox(height: 12, width: 0),
                Text(
                  title,
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff464647),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 104,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: AppColors.primary.withOpacity(.2),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xffC5CAFF), Color(0xffE8CCFF)],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(
                              AppStrings.targetIcon,
                              height: 22,
                              width: 22,
                            ),
                            SizedBox(height: 0, width: 10),
                            Text(
                              "Perfect for",
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          top: 0,
                          right: 15.0,
                        ),
                        child: Text(
                          perfectFor,
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.black2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ContainerBg(
                  radius: 16,
                  width: double.infinity,
                  height: config4.isEmpty ? 210 : 255,
                  bWidth: 1,
                  borderColor: Color(0xff6B6B6B33),
                  backgroundColor: Color(0xffF9F9F9),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Image.asset(
                              AppStrings.settingIcon,
                              height: 22,
                              width: 20,
                            ),
                            SizedBox(height: 0, width: 15),
                            Text(
                              "Configuration Settings",
                              style: getDmSansTextStyle(
                                fontSize: 16,
                                color: AppColors.black2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      configurationSettingUI(count: "1", title: config1),
                      configurationSettingUI(count: "2", title: config2),
                      configurationSettingUI(count: "3", title: config3),
                      config4.isEmpty
                          ? SizedBox()
                          : configurationSettingUI(count: "4", title: config4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  configurationSettingUI({required String count, required String title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15,
            top: 12,
            bottom: 12,
          ),
          child: ContainerBg(
            width: 24,
            height: 24,
            radius: 4,
            backgroundColor: AppColors.primary,
            child: Center(
              child: Text(
                count,
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            title,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.black3,
            ),
          ),
        ),
      ],
    );
  }
}
