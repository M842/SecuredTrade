import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/services/encryption_service.dart';

class ApiManageScreen extends StatefulWidget {
  const ApiManageScreen({super.key});

  @override
  State<ApiManageScreen> createState() => _ApiManageScreenState();
}

class _ApiManageScreenState extends State<ApiManageScreen> {
  final editApiKeyController = TextEditingController();
  final editSecretKeyController = TextEditingController();
  final editVerificationController = TextEditingController();

  @override
  void initState() {
    context.read<HomeBloc>().add(LoadKeyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      appBar: AppAppBar(title: "API Manage", appBarColor: Color(0xffF8F9FA)),
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, mState) {
          if (mState is GetApiKeysLoaded) {
            editApiKeyController.text = mState.apiKey;
            editSecretKeyController.text = mState.secretKey;
          }
          return ListView(
            children: [
              SizedBox(height: 10, width: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerBg(
                  height: 248,
                  radius: 10,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.grey3.withOpacity(.2),
                  bWidth: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Precautions",
                          style: getDmSansTextStyle(
                            fontSize: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15,
                          top: 5,
                        ),
                        child: Text(
                          "1. Please confirm that the API permission Enable Spot & Margin Trading has been checked.\n\n"
                          "2. Please enter the correct API, please do not enter special characters.\n\n"
                          "3. To use Futures strategy, please check the Enable Futures in API management.",
                          style: getDmSansTextStyle(
                            fontSize: 14,
                            color: AppColors.black4,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 15, width: 0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10, width: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerBg(
                  height: 315,
                  radius: 10,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.grey3.withOpacity(.2),
                  bWidth: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7, width: 0),
                        buildApiFields(
                          controller: editApiKeyController,
                          heading: "API Key",
                          hintText: "Please Enter API Key",
                        ),
                        buildApiFields(
                          controller: editSecretKeyController,
                          heading: "Secret Key",
                          hintText: "Please Enter Secret Key",
                        ),
                        SizedBox(height: 10, width: 0),
                        // buildApiFields(
                        //     controller: editVerificationController,
                        //     heading: "Verification Code",
                        //     hintText: "Please enter Verification Code"),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Verification Code",
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.black2,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: getDmSansTextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: AppColors.black2,
                            ),
                            controller: editVerificationController,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<HomeBloc>().
                                    add(SentOTP(context));
                                  },
                                  child: ContainerBg(
                                    radius: 8,
                                    width: 82,
                                    bWidth: 1,
                                    borderColor: AppColors.primary,
                                    backgroundColor: AppColors.primary
                                        .withOpacity(.1),
                                    child: Center(
                                      child: Text(
                                        "Send",
                                        style: getDmSansTextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffA2A2A6).withOpacity(.65),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffA2A2A6).withOpacity(.65),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffA2A2A6).withOpacity(.65),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 15,
                                left: 10,
                                bottom: 15,
                              ),
                              hintText: "Please enter Verification Code",
                              hintStyle: getDmSansTextStyle(
                                color: Color(0xff747980),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5, width: 0),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10, width: 0),
              AppButton(
                text: "Bind",
                onPressed: () {
                  if (editApiKeyController.text.trim().isEmpty) {
                    return SnackbarHelper.show(
                      context,
                      message: "Please enter api key",
                    );
                  }
                  if (editSecretKeyController.text.trim().isEmpty) {
                    return SnackbarHelper.show(
                      context,
                      message: "Please enter secret key",
                    );
                  }
                  final result = EncryptionService.encrypt(
                    editApiKeyController.text.trim(),
                    editSecretKeyController.text.trim(),
                  );

                  // print("$apiKeyEnc  ||  $secretKeyEnc  ||  $aesKeyEnc");
                  context.read<HomeBloc>().add(
                    ApiManageRequest(
                      encrypt: result,
                      keyOtp: editVerificationController.text.trim(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20, width: 0),
            ],
          );
        },
        listener: (BuildContext context, HomeState state) {
          if (state is HomeLoaded) {
            editApiKeyController.clear();
            editSecretKeyController.clear();
            editVerificationController.clear();
            SnackbarHelper.show(context, message:state.messages,
            backgroundColor: AppColors.green);
          } else if (state is ApiKeysNotExist) {
            SnackbarHelper.show(context, message: state.error);
          }else if(state is HomeError){
            SnackbarHelper.show(context, message: state.message);
          }
        },
      ),
    );
  }

  buildApiFields({
    required String heading,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0, width: 10),
          Text(
            heading,
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.black2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 6, width: 0),
          TextField(
            style: getDmSansTextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: AppColors.black2,
            ),
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffA2A2A6).withOpacity(.65),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffA2A2A6).withOpacity(.65),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xffA2A2A6).withOpacity(.65),
                ),
              ),
              contentPadding: EdgeInsets.only(top: 15, left: 10, bottom: 15),
              hintText: hintText,
              hintStyle: getDmSansTextStyle(
                color: Color(0xff747980),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 0, width: 10),
        ],
      ),
    );
  }
}

//Binance
//
// Precautions
// Instructions
//
// Please confirm that the API permission Enable Spot & Margin Trading has been checked.
// Please enter the correct API, please do not enter special characters.
// To use Futures strategy, please check the "Enable Futures" in API management.
// IP Group Binding
// For security purposes, Binance Exchange recommends binding the server IP address when creating the API. For users who need to bind the IP address, click “Edit restrictions” in the upper right corner after the API is created, and check “Restrict access to trusted IPs only”. Click the copy button to copy the IP group to the input box and click OK. Finally, click save in the upper right corner.
//
// IP Addresses:
// 8.212.130.232 8.212.128.18 8.212.1... (truncated in the image)
// [Copy]
