import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, state) async {
          if (state is Authenticated) {
            await Future.delayed(Duration(seconds: 1));
            context.go(AppRoutePaths.dashboard);
          } else if (state is Unauthenticated) {
            context.go(AppRoutePaths.login);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: Image.asset(AppStrings.splashAppLogo, height: 212),
          ),
        ),
      ),
    );
  }
}
