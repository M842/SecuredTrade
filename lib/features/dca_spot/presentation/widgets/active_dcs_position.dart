import 'package:securedtrade/config/path_config.dart';

class ActiveDCAPositionList extends StatelessWidget {
  final int index;
  const ActiveDCAPositionList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1.2,
        child: ContainerBg(
          width: double.infinity,
          radius: 16,
          height: index == 0 ? 565 : 365,
          borderColor: AppColors.grey5,
          bWidth: 1,
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              index == 0 ? "BTC/USDT" : "ETH/USDT",
                              style: getDmSansTextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            ContainerBg(
                              width: 70,
                              height: 25,
                              borderColor: AppColors.primary,
                              bWidth: 1,
                              backgroundColor: AppColors.primary.withOpacity(
                                .1,
                              ),
                              child: Center(
                                child: Text(
                                  "Smart DCA",
                                  style: getDmSansTextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Accumulation Mode",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.6,
                            color: AppColors.grey6,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+2.49%",
                          style: getDmSansTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff008236),
                          ),
                        ),
                        Text(
                          "+124.50",
                          style: getDmSansTextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff008236),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15, width: 0),
                Row(
                  children: [
                    itemPositionTextView(
                      title: "Avg Buy Price",
                      amount: "\$42,150.5",
                    ),
                    Spacer(),
                    itemPositionTextView(
                      title: "Current Price",
                      amount: "\$44,145",
                    ),
                    Spacer(),
                    itemPositionTextView(title: "Amount", amount: "0.0145 BTC"),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: ContainerBg(
                    height: 1,
                    width: double.infinity,
                    backgroundColor: Color(0xffF3F4F6),
                    child: SizedBox(),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "DCA Progress",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "3 / 5 Levels Used",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10, width: 0),

                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 9,
                        color: AppColors.primary,
                        backgroundColor: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 9,
                        color: AppColors.primary,
                        backgroundColor: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 9,
                        color: AppColors.primary,
                        backgroundColor: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 9,
                        color: AppColors.grey5,
                        backgroundColor: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        minHeight: 9,
                        color: AppColors.grey5,
                        backgroundColor: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadiusGeometry.circular(6),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2, width: 0),
                Row(
                  children: [
                    Text(
                      "Level 1",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                        color: AppColors.greyDark,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Level 5",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ],
                ),

                index == 1
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: ContainerBg(
                          height: 175,
                          radius: 10,
                          width: double.infinity,
                          backgroundColor: Color(0xffF9FAFB),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  "DCA Level Details",
                                  style: getDmSansTextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                dcaLevelsUI(
                                  title: "Level 1: \$45,000",
                                  status: "✓ Filled",
                                ),
                                dcaLevelsUI(
                                  title: "Level 2: \$43,332",
                                  status: "✓ Filled",
                                ),
                                dcaLevelsUI(
                                  title: "Level 3: \$41,000",
                                  status: "✓ Filled",
                                ),
                                dcaLevelsUI(
                                  title: "Level 4: \$34,464",
                                  status: "Pending",
                                ),
                                dcaLevelsUI(
                                  title: "Level 5: \$4,636",
                                  status: "Pending",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                Row(
                  children: [
                    Text(
                      "Take Profit Target",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$45,000 (+6.2%)",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Distance to TP",
                      style: getDmSansTextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyDark,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "2.5%",
                      style: getDmSansTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: .5,
                  minHeight: 9,
                  color: AppColors.primary,
                  backgroundColor: AppColors.grey.withOpacity(.1),
                  borderRadius: BorderRadiusGeometry.circular(6),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(AppStrings.targetIcon, height: 15),
                    SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Trailing TP: ",
                            style: getDmSansTextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyDark,
                            ),
                          ),

                          TextSpan(
                            text: "Enabled",
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //AppUtils.navPush2(
                          //     context, SpotDcaStrategyScreen());
                        },
                        child: ContainerBg(
                          width: double.infinity,
                          height: 40,
                          radius: 10,

                          backgroundColor: AppColors.primary.withOpacity(.1),
                          child: Center(
                            child: Text(
                              "View Chart",
                              style: getDmSansTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //AppUtils.navPush2(
                          //     context, SpotDcaStrategyScreen());
                        },
                        child: ContainerBg(
                          width: double.infinity,
                          height: 40,
                          radius: 10,
                          bWidth: 1,
                          borderColor: Color(0xffD1D5DC),
                          backgroundColor: AppColors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 14,
                                Icons.settings_outlined,
                                color: AppColors.black,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Setting",
                                style: getDmSansTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemPositionTextView({required String title, required String amount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getDmSansTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: AppColors.grey6,
          ),
        ),
        SizedBox(height: 3, width: 0),
        Text(
          amount,
          style: getDmSansTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  dcaLevelsUI({required String title, required status}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: getDmSansTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.greyDark,
            ),
          ),
          Spacer(),
          Text(
            status,
            style: getDmSansTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: status == "Pending" ? Color(0xff99A1AF) : AppColors.green2,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
