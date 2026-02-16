import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/strategy_model.dart';

class StrategyScreen extends StatefulWidget {
  const StrategyScreen({super.key});

  @override
  State<StrategyScreen> createState() => _StrategyScreenState();
}

class _StrategyScreenState extends State<StrategyScreen> {
  List<StrategyModel> strategyList = [
    StrategyModel(
      symbol: 'assets/icon/btc@2x.png',
      name: 'BTC',
      currencyType: "USDT",
      price: '57,260.37',
      percentage: '+0.54%',
      position: '24.02',
      floatingPL: '+0.27(+1.13)',
      avgPrice: '56,524.14',
      quantity: '0.00042',
    ),
    StrategyModel(
      symbol: 'assets/icon/doge@2x.png',
      name: 'DOGE',
      currencyType: "USDT",
      price: '0.26037',
      percentage: '+1.54%',
      position: '0.3402',
      floatingPL: '-0.2756(-0.13)',
      avgPrice: '0.3524.16',
      quantity: '39.5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.darkTransparent);
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      appBar: AppAppBar(leading: true, title: "Strategy"),
      body: Column(
        children: [
          Row(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerBg(
                  radius: 10,
                  bWidth: 1,
                  borderColor: index == 1
                      ? AppColors.primary
                      : Color(0xff6B6B6B33),
                  backgroundColor: index == 1
                      ? AppColors.primary
                      : AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      top: 8,
                      bottom: 8,
                      right: 12,
                    ),
                    child: Text(
                      index == 0
                          ? "Create"
                          : index == 1
                          ? "Running(2)"
                          : "Stopped(0)",
                      style: getDmSansTextStyle(
                        color: index == 1 ? AppColors.white : AppColors.black,
                        fontSize: 14,
                        fontWeight: index == 1
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: strategyList.isNotEmpty
                ? ListView.builder(
                    itemCount: strategyList.length,
                    itemBuilder: (c, index) {
                      StrategyModel m = strategyList[index];
                      return StrategyItemList(data: m);
                    },
                  )
                : NoDataFound(text: "No Data Found"),
          ),
          AppButton(
            text: "Create Bot",
            onPressed: () {
              context.push(AppRoutePaths.createBot);
              //AppUtils.navPush2(context, DynamicDcaStrategyPage());
              // AppUtils.navPush(context, AppRoutes.createStrategy);
              /* Get.bottomSheet(Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.grey5,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            addPadding(height: 0, width: 15),
                            Text(
                              "Create Bot",
                              style: getHibibiTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "Spot DCA Bot",
                          "Future Trading Bot",
                          "RBG Trading Bot"
                        ].map((toElement) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                onHandlerEvent(toElement);
                              },
                              child: Text(
                                toElement,
                                style: getDmSansTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ));*/
            },
          ),
          SizedBox(height: 10, width: 0),
        ],
      ),
    );
  }

  void onHandlerEvent(String toElement) {
    if (toElement.contains("Spot")) {
      //AppUtils.navPush(context, AppRoutes.spotDcaBot);
    } else if (toElement.contains("Future")) {
      //AppUtils.navPush(context, AppRoutes.futureTradingBot);
    } else {
      //AppUtils.navPush2(context, RbgTradingBotScreen());
    }
  }
}
