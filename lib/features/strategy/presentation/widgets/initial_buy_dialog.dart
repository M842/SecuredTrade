import 'package:securedtrade/config/path_config.dart';

class InitialBuyDialog extends StatelessWidget {
  const InitialBuyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ContainerBg(
            height: 405,
            radius: 10,
            width: double.infinity,
            backgroundColor: AppColors.white,
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  "Initial buy-in price",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10),

                /*  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: List.generate(
                      2,
                      (pos) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: ContainerBg(
                            radius: 10,
                            backgroundColor: pos == 0
                                ? AppColors.primary
                                : AppColors.grey5,
                            height: 50,
                            child: Center(
                              child: Text(
                                pos == 0 ? "Price" : "Drop Rate",
                                style: getDmSansTextStyle(
                                  fontSize: 16,
                                  color: pos == 0
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),*/
                Material(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      top: 10,
                    ),
                    child: AppTextField(
                      suffixText: "% ",
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey4,
                      borderWidth: 0,
                      isPrefixIcon: false,
                      hintText: "Drop rate",
                    ),
                  ),
                ),
                Material(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      top: 10,
                    ),
                    child: AppTextField(
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey4,
                      borderWidth: 0,
                      suffixText: "USDT ",
                      isPrefixIcon: false,
                      hintText: "Initial buy-in price",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ContainerBg(
                    radius: 10,
                    backgroundColor: Color(0xffFFF085).withOpacity(.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.info_outline,
                              color: Color(0xff733E0A),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 25.0,
                                top: 5,
                                bottom: 10,
                              ),
                              child: Text(
                                "When the first buy in price setting is lower the market price the system will only make the buy after market price falls to your set price.",
                                style: getDmSansTextStyle(
                                  color: Color(0xffA65F00),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: List.generate(
                      2,
                      (pos) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: GestureDetector(
                            onTap: () {
                              onHandlerEvent(context, pos);
                            },
                            child: ContainerBg(
                              radius: 10,
                              backgroundColor: pos == 1
                                  ? AppColors.primary
                                  : AppColors.grey5,
                              height: 50,
                              child: Center(
                                child: Text(
                                  pos == 1 ? "Confirm" : "Cancel",
                                  style: getDmSansTextStyle(
                                    fontSize: 16,
                                    color: pos == 1
                                        ? AppColors.white
                                        : AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onHandlerEvent(BuildContext context, int pos) {
    switch (pos) {
      case 0:
        context.pop();
        break;
    }
  }
}
