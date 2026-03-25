import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/dca_spot/data/models/running_bot_model.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_bloc.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_event.dart';
import 'package:securedtrade/features/dca_spot/presentation/bloc/spot_state.dart';

class SpotPositionScreen extends StatefulWidget {
  const SpotPositionScreen({super.key});

  @override
  State<SpotPositionScreen> createState() => _SpotPositionScreenState();
}

class _SpotPositionScreenState extends State<SpotPositionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<SpotBloc>().add(GetPairBotStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.darkTransparent);
    return BlocListener<SpotBloc, SpotState>(
      listener: (c, SpotState state) {
        if (state is BotSuccessMessage) {
          SnackbarHelper.show(
            context,
            message: state.messages,
            backgroundColor: AppColors.green,
          );
        } else if (state is BotFailedMessage) {
          SnackbarHelper.show(context, message: state.messages);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppAppBar2(title: ""),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.h20,
                Text(
                  "Spot Positions",
                  style: getDmSansTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    top: 10,
                    bottom: 25,
                  ),
                  child: Text(
                    "Spot is used for stability and accumulation",
                    style: getDmSansTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyDark,
                    ),
                  ),
                ),

                StrategyStatus(
                  heading: "Strategy Status",
                  investMargin: "6,225 USDT",
                  totalPnL: "+186.2 USDT",
                  botName: "Smart DCA Active",
                  labelInvestMargin: "Total Invested",
                  labelTotalPnL: "Total PnL",
                  imgIcon: AppStrings.trendSymbolIcon,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Active Positions (2)",
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.black2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                BlocBuilder<SpotBloc, SpotState>(
                  builder: (c, s) {
                    if (s is RunningBotsLoaded) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: s.list.length,
                        itemBuilder: (c, pos) {
                          RunningBotList bots = s.list.elementAt(pos);
                          return ActiveDCAPositionList(data: bots);
                        },
                      );
                    } else {
                      return ContainerBg(child: SizedBox());
                    }
                  },
                ),

                // ListView(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   children: List.generate(
                //     2,
                //     (index) => ActiveDCAPositionList(index: index),
                //   ),
                // ),
                AppSpacing.h12,

                ContainerBg(
                  height: 150,
                  radius: 14,
                  width: double.infinity,
                  backgroundColor: Color(0xffEFF6FF),
                  bWidth: 1,
                  borderColor: Color(0xffBEDBFF),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 14),
                        Image.asset(AppStrings.liveTrackingIcon, height: 20),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Smart DCA Strategy",
                                style: getDmSansTextStyle(
                                  fontSize: 13,
                                  color: Color(0xff1C398E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "The Smart DCA strategy automatically averages down your entry price during dips, protecting you from losses while accumulating more at lower prices. It uses Trend Guard to ensure entries only in favorable market conditions.",
                                style: getDmSansTextStyle(
                                  fontSize: 11,
                                  color: Color(0xff1C398E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                AppSpacing.h16,

                Text(
                  "Closed Positions (Last 3)",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),

                AppSpacing.h12,
                Column(
                  children: List.generate(
                    3,
                    (ind) =>
                        ClosePositionList(ind: ind, mode: TradingMode.spot),
                  ),
                ),

                AppSpacing.h16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
