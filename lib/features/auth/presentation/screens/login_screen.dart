import 'package:flutter/cupertino.dart';

import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/shared/widgets/top_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final editEmailController = TextEditingController();
  final editPasswordController = TextEditingController();

  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    SystemUI.set(StatusBarStyle.darkTransparent);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (c, state) {
          if (state is Authenticated) {
            context.go(AppRoutePaths.dashboard);
          } else if (state is AuthLoading) {
            customProgressLoading(context);
          } else if (state is AuthFailure) {
            context.pop();
            SnackbarHelper.show(
              context,
              message: state.message,
              backgroundColor: Colors.red,
            );

            //SnackbarHelper.showError(context, state.message);
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80.0),
              child: Image.asset(AppStrings.loginBg),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70, width: 0),
                  Text(
                    "Log in",
                    style: getDmSansTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(height: 10, width: 0),
                  Text(
                    "If you are already a member, why don't you add you details and get going with the app",
                    style: getDmSansTextStyle(
                      color: AppColors.black2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 60, width: 0),

                  AppTextField(
                    labelText: "E-mail",
                    onChanged: (_) {
                      if (editEmailController.text.isEmpty ||
                          editPasswordController.text.isEmpty) {
                        isEnabled = false;
                      } else {
                        isEnabled = true;
                      }
                      setState(() {});
                    },
                    controller: editEmailController,
                    icon: CupertinoIcons.mail,
                    fillColor: AppColors.white,
                    hintText: "Enter your email",
                  ),
                  SizedBox(height: 22, width: 0),

                  AppTextField(
                    labelText: "Password",
                    obscureText: true,
                    isSuffixIcon: true,
                    onChanged: (_) {
                      if (editEmailController.text.isEmpty ||
                          editPasswordController.text.isEmpty) {
                        isEnabled = false;
                      } else {
                        isEnabled = true;
                      }
                      setState(() {});
                    },
                    icon: CupertinoIcons.padlock,
                    controller: editPasswordController,
                    hintText: "Enter your password",
                  ),
                  SizedBox(height: 10, width: 0),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        SizedBox(height: 0, width: 4),
                        Icon(
                          Icons.check_box_outline_blank,
                          size: 21,
                          color: Color(0xff3078FF),
                        ),
                        SizedBox(height: 0, width: 8),
                        Text(
                          "Remember Me",
                          style: getInterTextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff747980),
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: getInterTextStyle(
                              //decoration: TextDecoration.underline,
                              color: Color(0xff3078FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14, width: 0),

                  AppButton(
                    padding: 0,
                    bWidth: 1,
                    borderColor: AppColors.primary,
                    textColor: isEnabled ? AppColors.white : AppColors.primary,
                    onPressed: () {
                      KeyboardUtils.dismiss(context);
                      if (validation(context)) {
                        context.read<AuthBloc>().add(
                          LoginRequest(
                            email: editEmailController.text,
                            password: editPasswordController.text,
                          ),
                        );
                      }
                    },
                    text: "Login",
                    backgroundColor: isEnabled
                        ? AppColors.primary
                        : AppColors.white,
                  ),
                  SizedBox(height: 55, width: 0),

                  // PrivacyTermsCondition(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppStrings.login_option_icon,
                        height: 10,
                        width: 80,
                      ),
                      SizedBox(height: 0, width: 10),
                      Text(
                        "or continue with",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.grey3,
                        ),
                      ),
                      SizedBox(height: 0, width: 10),
                      Image.asset(
                        AppStrings.login_option_icon,
                        height: 10,
                        width: 80,
                      ),
                    ],
                  ),
                  SizedBox(height: 10, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 0, width: 30),
                      Image.asset(
                        AppStrings.google_icon,
                        height: 68,
                        width: 68,
                      ),
                      Image.asset(
                        AppStrings.facebook_icon,
                        height: 68,
                        width: 68,
                      ),
                      Image.asset(AppStrings.apple_icon, height: 68, width: 68),
                      SizedBox(height: 0, width: 30),
                    ],
                  ),

                  Spacer(),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: GoogleFonts.dmSans(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey3,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push(AppRoutePaths.register);
                              },
                            style: getDmSansTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10, width: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  bool validation(BuildContext context) {
    if (editEmailController.text.trim().isEmpty) {
      SnackbarHelper.show(context, message: "Please enter email address");
      return false;
    }
    if (!Validators.isValidEmail(editEmailController.text.trim())) {
      SnackbarHelper.show(context, message: "Invalid email address");
      return false;
    }

    if (editPasswordController.text.trim().isEmpty) {
      SnackbarHelper.show(context, message: "Please enter password");
      return false;
    }

    return true;
  }
}
