import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/alert_market_guidance.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/future_active_position_list.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/performance_snapshot.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/portfolio_overview.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/quick_action_buttons.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/small_method_widget.dart';
import 'package:securedtrade/features/arbitrage/presentation/widgets/spot_active_position_list.dart';

class ArbitrageTradePositionScreen extends StatelessWidget {
  const ArbitrageTradePositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar2(title: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arbitrage Position",
                    style: getDmSansTextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  AppSpacing.h(15),
                  ArbitrageTradingMode(),
                  AppSpacing.h(12),
                  SystemRunning(),
                  AppSpacing.h(25),
                ],
              ),
            ),
            MarketRegimeRiskEngine(
              icon: AppStrings.liveTrackingIcon,
              title: "Market Regime:",
              subTitle: "Trading",
              textColor: AppColors.primary,
            ),
            AppSpacing.h8,
            MarketRegimeRiskEngine(
              icon: AppStrings.privacyIcon,
              title: "Risk Engine:",
              width: 170,
              textColor: AppColors.green2,
              subTitle: "Active",
            ),

            PortfolioOverview(),

            TradingBanner(title:"Welcome Trader,",allPadding: 10),

            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 10,
                top: 20,
                bottom: 12,
              ),
              child: Text(
                "Active Spot Positions",
                style: getDmSansTextStyle(
                  fontSize: 15.1,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            SpotActivePositionList(),
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 10,
                top: 20,
                bottom: 12,
              ),
              child: Text(
                "Active Futures Positions",
                style: getDmSansTextStyle(
                  fontSize: 15.1,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),

            FutureActivePositionList(),
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 10,
                top: 20,
                bottom: 12,
              ),
              child: Text(
                "Alerts & Market Guidance",
                style: getDmSansTextStyle(
                  fontSize: 15.1,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            AlertMarketGuidance(
              bgColor: Color(0xffEFF6FF),
              txColor: Color(0xff1C398E),
              iconColor: Color(0xff155DFC),
              icon: Icons.info_outline,
              text: "Sideways market detected. Spot strategy\nprioritized.",
            ),
            AlertMarketGuidance(
              bgColor: Color(0xffFFFBEB),
              iconColor: Color(0xffE17100),
              txColor: Color(0xff7B3306),
              icon: Icons.error_outline_outlined,
              text: "High volatility. Futures size reduced\nautomatically.",
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 20, top: 20),
              child: Text(
                "Quick Actions",
                style: getDmSansTextStyle(
                  fontSize: 15.1,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            QuickActionButtons(),

            AppSpacing.h(16),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 12, bottom: 12),
              child: Text(
                "Performance Snapshot",
                style: getDmSansTextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            PerformanceSnapshot(),
          ],
        ),
      ),
    );
  }
}
