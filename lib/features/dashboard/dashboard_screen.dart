import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/arbitrage/presentation/screens/arbitrage_position_screen.dart';
import 'package:securedtrade/main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> children = [
    const HomeScreen(),
    const SpotPositionScreen(),
    const FuturePositionScreen(),
    const ArbitrageTradePositionScreen(),
    const ProfileScreen(),
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      bottomNavigationBar: AppBottomMenu(
        onTabTapped: (value) {
          setState(() {
            context.read<AuthBloc>().isSubscribed=true;
            selectIndex = value;
          });
        },
        selectIndex: selectIndex,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (c, AuthState state) {
          if (state is InvestSuccessState) {
            SnackbarHelper.show(
              context,
              message: state.message,
              backgroundColor: AppColors.green,
            );
          } else if (state is InvestFailedState) {
            SnackbarHelper.show(context, message: state.message);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, AuthState st) {
            return Stack(
              children: [
                children[selectIndex],
                context.read<AuthBloc>().isSubscribed
                    ? SizedBox()
                    : SubscriptionOverlay(),
              ],
            );
          },
        ),
      ),
    );
  }
}
