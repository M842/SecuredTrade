import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';

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
    context.read<StrategyBloc>().add(GetTradeSettingData(pair: widget.symbol));
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

                BlocListener<StrategyBloc, StrategyState>(
                  listener: (BuildContext context, StrategyState state) {
                    if (state is StrategyFailure) {
                      SnackbarHelper.show(context, message: state.message);
                    }
                  },
                  child: BlocBuilder<StrategyBloc, StrategyState>(
                    builder: (c, mState) {
                      TradeSetting? tradeSetting = mState is TradeSettingLoaded
                          ? mState.tradeSetting
                          : null;
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 100.0,
                          left: 0,
                          right: 0,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              CurrencyDetailPosition(
                                symbol: widget.symbol,
                                mData: tradeSetting,
                              ),
                              SizedBox(height: 10),

                              //  ManageStrategy(),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 5,
                                ),
                                child: AppCustomCard(
                                  radius: 8,
                                  topPadding: 5,
                                  bottomPadding: 10,
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
                                            color: AppColors.black.withOpacity(
                                              .7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 5,
                                ),
                                child: AppCustomCard(
                                  bottomPadding: 15,
                                  radius: 8,

                                  height: 72,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Use EMA Filter",
                                        style: getDmSansTextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Spacer(),
                                      Switch(
                                        value: tradeSetting == null
                                            ? false
                                            : tradeSetting.useEmaFilter,
                                        activeThumbColor: AppColors.white,
                                        inactiveTrackColor: tradeSetting == null
                                            ? AppColors.white
                                            : AppColors.primary,
                                        activeColor: tradeSetting == null
                                            ? AppColors.white
                                            : AppColors.secondary,
                                        activeTrackColor: tradeSetting == null
                                            ? AppColors.white
                                            : AppColors.primary,
                                        inactiveThumbColor: AppColors.primary,

                                        onChanged: (onChanged) {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /* SizedBox(height: 5),
                              AppCustomCard(
                                radius: 8,
                                topPadding: 0,
                                bottomPadding: 10,
                                height: 72,
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
                                      value: tradeSetting == null
                                          ? false
                                          : tradeSetting.aiMarginCall,
                                      activeThumbColor: AppColors.white,
                                      inactiveTrackColor: tradeSetting == null
                                          ? AppColors.white
                                          : AppColors.primary,
                                      activeColor: tradeSetting == null
                                          ? AppColors.white
                                          : AppColors.secondary,
                                      activeTrackColor: tradeSetting == null
                                          ? AppColors.white
                                          : AppColors.primary,
                                      inactiveThumbColor: AppColors.primary,

                                      onChanged: (onChanged) {},
                                    ),
                                  ],
                                ),
                              ),*/
                              SizedBox(height: 5),
                              BotStrategyDetail(mData: tradeSetting),
                            ],
                          ),
                        ),
                      );
                    },
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
