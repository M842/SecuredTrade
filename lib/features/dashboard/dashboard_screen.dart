import 'package:securedtrade/config/path_config.dart';
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
            selectIndex = value;
          });
        },
        selectIndex: selectIndex,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
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
    );
  }
}
