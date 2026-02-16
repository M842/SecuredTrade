import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/shared/styles/gradient.dart';

class WalletScreen extends StatelessWidget {
  final bool leading;
  const WalletScreen({super.key, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(title: "Wallet", leading: leading),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
              top: 5,
              bottom: 5,
            ),
            child: Container(
              width: double.infinity,
              height: 197,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: AppGradients.primary,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      AppStrings.withdrawLogoIcon,
                      height: 170,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8, width: 0),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          left: 12,
                          bottom: 10,
                        ),
                        child: Text(
                          "Total Estimated Assets(USD)",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "2,509.750",
                                  style: getOutfitTextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "=\$2,590.75",
                                  style: getOutfitTextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0, width: 20),
                          Text(
                            "+9.77%",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5, width: 0),
                      Row(
                        children: [
                          buildCurrencyBalance(heading: "USDT Balance"),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 10,
                              right: 8,
                            ),
                            child: ContainerBg(
                              backgroundColor: Color(0xffF8F9FA80),
                              height: 40,
                              width: 1,
                              child: SizedBox(),
                            ),
                          ),
                          buildCurrencyBalance(heading: "USDC Balance"),
                          SizedBox(
                            height: 0,
                            width: UIHelpers.screenSize(context).width / 4.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10, width: 0),
          withdrawBalanceUI(),
          SizedBox(height: 10, width: 0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: AppButton(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.primary,
                    bWidth: 1,
                    fontSize: 16,
                    padding: 5,
                    height: 45,
                    textColor: AppColors.black,
                    text: "Withdraw",
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 0, width: 10),
                Flexible(
                  child: AppButton(
                    height: 45,
                    backgroundColor: Colors.green,
                    padding: 5,
                    text: "Deposit",
                    fontSize: 16,
                    onPressed: () {
                      context.push(AppRoutePaths.deposit);
                      //Get.to(DepositNftScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15, width: 0),
          buildTransactionHistory(),
        ],
      ),
    );
  }

  buildCurrencyBalance({required String heading}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12),
          child: Text(
            heading,
            style: getDmSansTextStyle(
              fontSize: 12,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 2),
          child: Text(
            "\$1,618.50",
            style: getOutfitTextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  withdrawBalanceUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 8,
            bottom: 8,
          ),
          child: ContainerBg(
            height: 54,
            radius: 8,
            width: double.infinity,
            backgroundColor: Color(0xffF9F9F9),
            bWidth: 1,
            borderColor: Color(0xff6B6B6B33),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Withdrawable ",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff212529),
                          ),
                        ),
                        TextSpan(
                          text: "USDT",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff212529),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 5, right: 20),
                  child: Text(
                    "2500.212",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff212529),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildTransactionHistory() {
    return Expanded(
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0, width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 17),
              child: Text(
                "History Record",
                style: getDmSansTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black3,
                ),
              ),
            ),
            SizedBox(height: 5, width: 0),
            Column(
              children: List.generate(2, (intex) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: AppColors.grey.withOpacity(.35),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 15,
                        right: 15,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                intex == 0 ? "Activation gain" : "Withdrawal",
                                style: getDmSansTextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black2,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5, width: 0),
                              Text(
                                intex == 0
                                    ? "2023-04-22 04:40:20"
                                    : "2023-04-19 12:40:20",
                                style: getOutfitTextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black4,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Container(
                              width: 1,
                              height: 37,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(height: 0, width: 15),
                          SizedBox(
                            width: 130,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: intex == 0 ? "50.29" : "-16.40",
                                      style: getDmSansTextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: intex == 0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " USDT",
                                      style: getDmSansTextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: intex == 0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0, width: 5),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            // Flexible(
            //     child: NoDataFound(
            //   text: 'No Data Found',
            //   height: 4.2,
            // )),
          ],
        ),
      ),
    );
  }
}
