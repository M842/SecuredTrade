import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/ui_helpers.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerificationScreen> {
  bool isEnable = false;
  final otpEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 80.0, top: 150),
            child: Image.asset(
              AppStrings.loginBg,
              height: UIHelpers.screenSize(context).height / 1.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70, width: 0),
                Text(
                  "Check your mail",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 5, width: 0),
                Text(
                  "We’ve sent a 6-digit confirmation code to Secure@trade.io Make sure you enter correct code.",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.black2,
                  ),
                ),
                SizedBox(height: 50, width: 0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "4m 44sec",
                        style: getDmSansTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderWidth: 2,
                  margin: EdgeInsets.only(right: 10, left: 10),
                  fillColor: AppColors.white,
                  filled: true,
                  borderColor: AppColors.grey3,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    if (code.length > 5) {
                      isEnable = true;
                    } else {
                      isEnable = false;
                    }
                    setState(() {});
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    if (verificationCode.length > 5) {
                      isEnable = true;
                      otpEditController.text = verificationCode;
                    } else {
                      isEnable = false;
                    }
                    setState(() {});
                  }, // end onSubmit
                ),
                SizedBox(height: 20, width: 0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Didn’t receive code?",
                      style: GoogleFonts.dmSans(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey3,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "Resend code",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: getDmSansTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25, width: 0),
                AppButton(
                  textColor: isEnable ? AppColors.white : AppColors.primary,
                  text: "Verify Code",
                  onPressed: () {
                    context.pop(otpEditController.text);
                  },
                  bWidth: 1,
                  borderColor: isEnable ? Colors.green : AppColors.primary,
                  backgroundColor: isEnable ? Colors.green : AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
