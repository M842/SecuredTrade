import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/data/models/burn_nfts_list_model.dart';
import 'package:securedtrade/features/dashboard/widgets/nfts_burn_list.dart';
import 'package:securedtrade/main.dart';

class SubscriptionOverlay extends StatelessWidget {
  const SubscriptionOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
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
                "Subscribe & Burn NFTs",
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
                padding: const EdgeInsets.only(right: 60.0, left: 60, top: 10),
                child: GestureDetector(
                  onTap: () async {
                    if (context.read<AuthBloc>().isMetamaskConnected &&
                        !context.read<AuthBloc>().isSubscribed) {
                      // context.read<AuthBloc>().add(
                      //   TodaySubsInvestmentEvent(),
                      // );
                      showBottomSheet(
                        context: context,
                        builder: (v) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff3C4CF9).withOpacity(.92),
                                    Color(0xff9515FA).withOpacity(.92),
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  AppSpacing.h16,

                                  Text(
                                    "Burn NFTs",
                                    style: getDmSansTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ),

                                  AppSpacing.h(15),

                                  BlocBuilder<AuthBloc, AuthState>(
                                    builder: (c, s) {
                                      if (s is GetUserHeldBurnNFTs) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: s.nftsBurnList.length,
                                          itemBuilder: (c, pos) {
                                            NFTsBurnModelList m = s.nftsBurnList
                                                .elementAt(pos);
                                            return NftsBurnItemList(
                                            model: m,
                                            );
                                          },
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),

                                  AppSpacing.h8,
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      context.read<AuthBloc>().add(MetamaskRequest());
                    }
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
                          Image.asset(
                            context.read<AuthBloc>().isMetamaskConnected
                                ? AppStrings.investment
                                : AppStrings.matamaskIcon,
                            height: 30,
                          ),
                          SizedBox(height: 0, width: 12),
                          Text(
                            context.read<AuthBloc>().isMetamaskConnected
                                ? "Burn NFTs"
                                : "Connect Wallet",
                            style: getDmSansTextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
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
