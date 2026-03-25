import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/auth/data/models/burn_nfts_list_model.dart';

class NftsBurnItemList extends StatelessWidget {
  final NFTsBurnModelList model;
  const NftsBurnItemList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        children: [
          AppSpacing.w(10),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.white.withOpacity(.1),
                    AppColors.white.withOpacity(.1),
                  ],
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),

                    child: Image.network(
                      model.nftImage,
                      width: 90,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  AppSpacing.w16,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        model.nftName,
                        style: getDmSansTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                      AppSpacing.h12,
                      Row(
                        children: [
                          ContainerBg(
                            height: 20,
                            width: 20,
                            backgroundColor: AppColors.white.withOpacity(.7),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: AppColors.black,
                              ),
                            ),
                          ),

                          Container(
                            width: 30,
                            child: Center(
                              child: Text(
                                "2",
                                style: getDmSansTextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          ContainerBg(
                            height: 20,
                            width: 20,
                            backgroundColor: AppColors.white.withOpacity(.7),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: AppColors.black3,
                              ),
                            ),
                          ),
                          AppSpacing.w8,
                          Text(
                            "NFTs",
                            style: getDmSansTextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      AppSpacing.h12,
                      AppButton(
                        padding: 0,
                        width: 90,
                        height: 36,
                        backgroundColor: Colors.transparent,
                        text: "Transfer",
                        borderColor: Colors.transparent,
                        fontSize: 14,
                        onPressed: () {},
                      ),
                      AppSpacing.h8,
                      AppButton(
                        padding: 0,
                        width: 90,
                        fontSize: 14,
                        borderColor: AppColors.secondary,
                        bWidth: 1,
                        backgroundColor: AppColors.secondary,
                        textColor: AppColors.white,
                        height: 45,
                        text: "Burning NFTs",
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            BurnNFTsEvent(model.payload, model.nftTokenId, "1"),
                          );
                        },
                      ),
                    ],
                  ),
                  AppSpacing.w8,
                ],
              ),
            ),
          ),
          AppSpacing.w8,
        ],
      ),
    );
  }
}
