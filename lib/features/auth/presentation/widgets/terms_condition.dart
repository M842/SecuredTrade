import 'package:securedtrade/config/path_config.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0, width: 7),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ContainerBg(
              radius: 4,
              width: 20,
              height: 20,
              backgroundColor: Color(0xff3078FF),
              bWidth: 2,
              borderColor: Color(0xff3078FF),
              child: Icon(
                Icons.check_rounded,
                size: 15,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 0, width: 15),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RichText(
                text: TextSpan(
                    text: "By proceeding you are agreeing to SecureTrade ",
                    style: getDmSansTextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff312E49),
                        fontSize: 14),
                    children: [
                      TextSpan(
                          text: "Terms of Service",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: getDmSansTextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3078FF))),
                      TextSpan(
                          text: " & ",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: getPTSandTextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColors.white)),
                      TextSpan(
                          text: "Privacy policy",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: getPTSandTextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.white)),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

