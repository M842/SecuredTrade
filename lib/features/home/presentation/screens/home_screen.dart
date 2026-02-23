import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/currency_websocket_service.dart';
import 'package:securedtrade/core/utils/dialog_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cSelectedIndex = 0, mSelectedIndex = 0;
  //CurrencyWebsocketService wc=CurrencyWebsocketService();
  @override
  void initState() {
    //  wc.call("wss://stream.binance.com:9443/stream?streams=!miniTicker@arr");
    // TODO: implement initState
    context.read<HomeBloc>().add(LoadHomeEvent(context));
    context.read<HomeBloc>().add(
      GetSpotCurrencies(url: AppConstants.getSpotCurrencyUrl),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.darkTransparent);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: ((c, s) {
        if (s is HomeFailure) {
          DialogUtils.forceLogout(
            context: context,
            title: "Session Expired",
            message: s.message,
          );
        }
      }),
      builder: (context, mState) {
        return Scaffold(
          appBar: AppAppBar2(title: ""),
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.background,
          body: ListView(
            children: [
              TradingBanner(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 6,
                  right: 6,
                  bottom: 10,
                ),
                child: SizedBox(height: 230, child: HomeItemList()),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 3.0,
                  right: 3,
                  top: 25,
                  bottom: 5,
                ),
                child: Column(
                  children: [
                    SelectCurrenciesMode(
                      mSelectedIndex: mSelectedIndex,
                      onPressed: () {
                        setState(() {
                          context.read<HomeBloc>().usdtCurrenciesList.clear();
                          context.read<HomeBloc>().btcCurrenciesList.clear();
                          if (mSelectedIndex == 0) {
                            mSelectedIndex = 1;
                            context.read<HomeBloc>().add(
                              GetSpotCurrencies(
                                url: AppConstants.getFutureCurrencyUrl,
                              ),
                            );
                          } else {
                            context.read<HomeBloc>().add(
                              GetSpotCurrencies(
                                url: AppConstants.getSpotCurrencyUrl,
                              ),
                            );
                            mSelectedIndex = 0;
                          }
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    SelectCurrency(
                      selectedIndex: cSelectedIndex,
                      onPressed: () {
                        setState(() {
                          if (cSelectedIndex == 0) {
                            cSelectedIndex = 1;
                          } else {
                            cSelectedIndex = 0;
                          }
                        });
                      },
                    ),
                    SizedBox(height: 10, width: 0),
                    Row(
                      children: [
                        SizedBox(height: 0, width: 10),
                        Text(
                          "Trading Coins",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.black2,
                          ),
                        ),
                        Spacer(),
                        SizedBox(height: 0, width: 20),
                        Text(
                          "24h Change",
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.black2,
                          ),
                        ),
                        SizedBox(height: 0, width: 15),
                      ],
                    ),
                    SizedBox(height: 10, width: 0),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) {
                        return current is SpotCurrenciesLoaded ||
                            current is HomeError;
                      },
                      builder: (context, mState) {
                        if (mState is SpotCurrenciesLoaded) {
                          return ListView.builder(
                            //controller: scrollController,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cSelectedIndex == 0
                                ? mState.usdtCurrencies.length
                                : mState.btcCurrencies.length,
                            itemBuilder: (c, index) {
                              final currencyList = cSelectedIndex == 0
                                  ? mState.usdtCurrencies[index]
                                  : mState.btcCurrencies[index];

                              return Currencies(
                                data: currencyList,
                                modeIndex: mSelectedIndex,
                              );
                            },
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Top Stories",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xff212529),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    ItemTrendingNews(
                      title:
                          "Why Bitcoiners Are Rooting for This Latest China Mining Ban to Finally, Actually Be Real",
                      img: AppStrings.storiesImg,
                    ),
                    SizedBox(height: 24),
                    ItemTrendingNews(
                      title:
                          "Grayscale Discount’ Narrows to 10% and Could Shrink More as Lockups Expire",
                      img: AppStrings.storiesImg2,
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
