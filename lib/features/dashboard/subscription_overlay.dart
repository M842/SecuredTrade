import 'package:securedtrade/config/path_config.dart';

class SubscriptionOverlay extends StatelessWidget {
  const SubscriptionOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff3C4CF9).withOpacity(.92),
              Color(0xff9515FA).withOpacity(.92),
            ],
          ),
        ),
        width: double.infinity,
        height: UIHelpers.screenSize(context).height / 1.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Subscribe",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20, width: 0),
              Card(
                elevation: 50,
                color: Colors.transparent,
                child: Image.asset(AppStrings.nftImage),
              ),
              SizedBox(height: 20, width: 0),
              Text(
                "Dummy text helps structure wireframes and mockups while maintaining branding and layout consistency.",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20, width: 0),
              Padding(
                padding: const EdgeInsets.only(right: 38.0, left: 38, top: 10),
                child: GestureDetector(
                  onTap: () async {
                    context.read<AuthBloc>().add(MetamaskRequest());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.secondary,
                        width: 0.40,
                      ),
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppStrings.matamaskIcon, height: 30),
                          SizedBox(height: 0, width: 15),
                          Text(
                            "Subscribe & Connect",
                            style: getDmSansTextStyle(
                              color: AppColors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
