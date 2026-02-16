import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/presentation/widgets/user_expansion_tile.dart';

class UserGuideItemList extends StatelessWidget {
  const UserGuideItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        UserGuideExpansionTile(
          context: context,
          strategyName: "Martingale Strategy",
          tradingName: "(Grid Trading)",
          img: AppStrings.gridTradingIcon,
          title: "Buy more when prices drop to lower the average cost.",
          perfectFor:
              "Sideways or slightly bullish markets with moderate volatility.",
          config1: "First buy-in: Small percentage (e.g., 5% of total capital)",
          config2:
              "Margin call: Increase buy volume at set price drops (e.g., 1%, 2%, 4%, 8% drop)",
          config3: "Take profit: 1-3% per trade.",
          config4: "",
        ),
        SizedBox(height: 15, width: 0),
        UserGuideExpansionTile(
          context: context,
          strategyName: "One-Shot Trading",
          tradingName: "",
          img: AppStrings.oneShotTradingIcon,
          title: "Execute single, well-timed trades based on market analysis.",
          perfectFor:
              "Short-term trades, news-based trading, or trending markets.",
          config1:
              "Short-term trades, news-based trading, or trending markets.",
          config2: "First buy-in: 10–20% of capital.",
          config3: "Take profit: 3–5% & Stop loss: 5–10%",
          config4: "No continuous cycle.",
        ),
        SizedBox(height: 15, width: 0),
        UserGuideExpansionTile(
          context: context,
          strategyName: "Cycle Trading",
          tradingName: "(Dollar Cost Averaging)",
          img: AppStrings.cycleTradingIcon,
          title: "Continuous trading, reinvesting profits.",
          perfectFor: "Long-term traders who want compounding growth.",
          config1: "First buy-in: 5–10% of capital.",
          config2: "Take profit: 1.5–3%.",
          config3: "Margin calls: 4–6 levels",
          config4: "increasing position sizes & Stop loss: Optional.",
        ),
        SizedBox(height: 15, width: 0),
        UserGuideExpansionTile(
          context: context,
          strategyName: "Futures Trading Strategy",
          tradingName: "",
          img: AppStrings.futureTradingIcon,
          title: "Leverage trading with long and short positions.",
          perfectFor: "High-risk traders with experience.",
          config1: "Leverage: 3x–10x (higher leverage increases risk).",
          config2: "Stop loss: Mandatory (5–10% max risk per trade).",
          config3: "Take profit: 5–10%",
          config4: "Hedge mode: Optional to reduce losses.",
        ),
        SizedBox(height: 15, width: 0),
        UserGuideExpansionTile(
          context: context,
          strategyName: "AI Strategy",
          tradingName: "(Copy Trading)",
          img: "AI",
          title: "Follows expert traders strategies.",
          perfectFor: "Beginners or passive investors.",
          config1: "Select a reputable trader with a good track record.",
          config2: "Allocate a budget per trader.",
          config3: "Monitor performance and adjust as needed.",
          config4: "",
        ),
      ],
    );
  }
}
