import 'package:fluttertoast/fluttertoast.dart';
import 'package:securedtrade/config/path_config.dart';

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
                              AppSpacing.h8,

                              widget.tradingMode == TradingMode.future
                                  ? FutureBotConfig(
                                      tradeSettingModel: tradeSetting,
                                    )
                                  : SpotBotStrategyDetail(
                                      tradeSettingModel: tradeSetting,
                                    ),
                            ],
                          ),
                        ),
                      ),

                      AppSpacing.h16,

                      widget.tradingMode == TradingMode.future
                          ? AppButton(
                              padding: 8,
                              raidus: 4,
                              text: "Activate",
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.white,
                              onPressed: () {},
                            )
                          : tradeSettingBotActivationBotton(tradeSetting),

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

  tradeSettingBotActivationBotton(SpotTradeSettingModel? tradeSetting) {
    return Row(
      children: [
        TradeButton(
          onTap: () {
            // if (widget.tradingMode ==
            //     TradingMode.future) {
            //   context.push(AppRoutePaths.futureBotConfig);
            // } else {
            context.push(
              AppRoutePaths.tradeSetting,
              extra: ManualCreateArgs(
                tradeSettingModel: tradeSetting,
                symbol: widget.symbol,
              ),
            );
            // }
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
    );
  }
}
