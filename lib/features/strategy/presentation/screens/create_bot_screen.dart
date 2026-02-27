import 'package:fluttertoast/fluttertoast.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/spot_trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_state.dart';

class CreateBotScreen extends StatefulWidget {
  final String symbol;
  final TradingMode tradingMode;
  const CreateBotScreen({
    super.key,
    required this.symbol,
    required this.tradingMode,
  });

  @override
  State<CreateBotScreen> createState() => _CreateBotScreenState();
}

class _CreateBotScreenState extends State<CreateBotScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.tradingMode.name);
    context.read<StrategyBloc>().add(GetTradeSettingData(pair: widget.symbol));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.lightTransparent);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomBotAppBar(),

          BlocListener<StrategyBloc, StrategyState>(
            listener: (BuildContext context, StrategyState state) {
              if (state is GetTradeSettingEmpty) {
                //SnackbarHelper.show(context, message: state.message);
                Fluttertoast.showToast(
                  msg: state.messages,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.grey4,
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              } else if (state is StrategyFailure) {
                SnackbarHelper.show(context, message: state.message);
              } else if (state is BotActivatedState) {
                SnackbarHelper.show(
                  context,
                  message: state.messages,
                  backgroundColor: AppColors.green,
                );
              } else if (state is ActivationFailure) {
                SnackbarHelper.show(
                  context,
                  message: state.messages.toString(),
                );
              }
            },
            child: BlocBuilder<StrategyBloc, StrategyState>(
              builder: (c, mState) {
                SpotTradeSettingModel? tradeSetting =
                    mState is TradeSettingLoaded ? mState.tradeSetting : null;

                return Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 0, right: 0),
                  child: Column(
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              CurrencyDetailPosition(
                                symbol: widget.symbol,
                                mData: tradeSetting,
                                mode: widget.tradingMode,
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
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Initial Buy In Percent",
                                          style: getDmSansTextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Spacer(),
                                        ContainerBg(
                                          bWidth: 1,
                                          backgroundColor: AppColors.grey5
                                              .withOpacity(.7),
                                          borderColor: AppColors.grey6
                                              .withOpacity(.3),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8,
                                              left: 15,
                                              right: 15,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  tradeSetting == null
                                                      ? "0.0"
                                                      : tradeSetting
                                                            .data
                                                            .spotConfig
                                                            .initialBuyPercent
                                                            .toString(),
                                                  style: getDmSansTextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),

                                                Text(
                                                  " %",
                                                  style: getDmSansTextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        AppSpacing.w8,
                                      ],
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
                                            : tradeSetting
                                                  .data
                                                  .spotConfig
                                                  .useEmaFilter,
                                        activeThumbColor: AppColors.white,
                                        inactiveTrackColor: tradeSetting == null
                                            ? AppColors.white
                                            : !tradeSetting
                                                  .data
                                                  .spotConfig
                                                  .useEmaFilter
                                            ? AppColors.white
                                            : AppColors.primary,
                                        activeColor: tradeSetting == null
                                            ? AppColors.white
                                            : !tradeSetting
                                                  .data
                                                  .spotConfig
                                                  .useEmaFilter
                                            ? AppColors.white
                                            : AppColors.secondary,
                                        activeTrackColor: tradeSetting == null
                                            ? AppColors.white
                                            : !tradeSetting
                                                  .data
                                                  .spotConfig
                                                  .useEmaFilter
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
                      ),

                      SizedBox(height: 15),
                      Row(
                        children: [
                          TradeButton(
                            onTap: () {
                              context.push(
                                AppRoutePaths.tradeSetting,
                                extra: ManualCreateArgs(
                                  tradeSettingModel: tradeSetting,
                                  symbol: widget.symbol,
                                ),
                              );
                            },
                            title: "Trade Setting",
                            radius: 4,
                            backgroundColor: Color(0xffF5F7FC),
                            txColor: AppColors.black,
                          ),
                          TradeButton(
                            radius: 5,
                            onTap: () {
                              context.read<StrategyBloc>().add(
                                SetBotActivation(pair: widget.symbol),
                              );
                            },
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
