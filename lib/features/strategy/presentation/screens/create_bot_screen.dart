import 'package:securedtrade/config/path_config.dart';

class CreateBotScreen extends StatefulWidget {
  final String symbol;
  const CreateBotScreen({super.key, required this.symbol});

  @override
  State<CreateBotScreen> createState() => _CreateBotScreenState();
}

class _CreateBotScreenState extends State<CreateBotScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<StrategyBloc>().add(GetTradeSettingData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.lightTransparent);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                CustomBotAppBar(),

                Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 0, right: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        CurrencyDetailPosition(symbol: widget.symbol),
                        SizedBox(height: 10),

                        ManageStrategy(),
                        SizedBox(height: 6),
                        AppCustomCard(
                          radius: 8,
                          topPadding: 5,
                          height: 70,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return InitialBuyDialog();
                                },
                              );
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Text(
                                    "Initial buy-in-price",
                                    style: getDmSansTextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: AppColors.black.withOpacity(.7),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        AppCustomCard(
                          radius: 8,
                          topPadding: 5,
                          height: 70,
                          child: Row(
                            children: [
                              Text(
                                "Switch on Margin Call",
                                style: getDmSansTextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Switch(
                                value: false,
                                inactiveTrackColor: AppColors.white,
                                activeColor: AppColors.white,
                                inactiveThumbColor: AppColors.primary,

                                onChanged: (onChanged) {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        AppCustomCard(
                          radius: 8,
                          topPadding: 5,
                          height: 70,
                          child: Row(
                            children: [
                              Text(
                                "AI Margin Call",
                                style: getDmSansTextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Switch(
                                value: true,
                                activeThumbColor: AppColors.white,
                                inactiveTrackColor: AppColors.primary,
                                activeColor: AppColors.secondary,
                                activeTrackColor: AppColors.primary,
                                inactiveThumbColor: AppColors.primary,

                                onChanged: (onChanged) {},
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 5),
                        BotStrategyDetail(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              TradeButton(
                onTap: () {
                  context.push(
                    AppRoutePaths.tradeSetting,
                    extra: widget.symbol,
                  );
                },
                title: "Trade Setting",
                radius: 4,
                backgroundColor: Color(0xffF5F7FC),
                txColor: AppColors.black,
              ),
              TradeButton(
                radius: 5,
                onTap: () {},
                title: "Activate",
                backgroundColor: AppColors.primary,
                txColor: AppColors.white,
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
