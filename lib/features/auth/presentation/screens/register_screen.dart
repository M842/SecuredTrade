import 'package:flutter/cupertino.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/core/utils/ui_helpers.dart';
import 'package:securedtrade/features/auth/presentation/widgets/terms_condition.dart';
import 'package:securedtrade/shared/widgets/top_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final editEmailController = TextEditingController();
  final editPasswordController = TextEditingController();

  bool isEnabled = false;

  final editCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AppStrings.registerBg,
                  height: UIHelpers.screenSize(context).height / 1.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70, width: 0),
                    Text(
                      "Sign up",
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: 10, width: 0),
                    Text(
                      "As you know, you are new to us so we need your more info so we can understand you and know better.",
                      style: getDmSansTextStyle(
                        color: AppColors.black2,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 40, width: 0),
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
                      icon: CupertinoIcons.mail,
                      controller: editEmailController,
                      hintText: "Enter your email",
                    ),
                    SizedBox(height: 20, width: 0),
                    AppButton(
                      padding: 0,
                      text: "Verify Email Address",
                      onPressed: () {
                        if (editEmailController.text.trim().isEmpty) {
                          return SnackbarHelper.show(
                            context,
                            message: "Please enter email address",
                          );
                        }
                        context.push(AppRoutePaths.emailVerification);
                        // Get.to(EmailVerificationScreen())!.then((result) {
                        //   editCodeController.text = result;
                        // });
                      },
                      backgroundColor: Colors.white,
                      bWidth: 2,
                      textColor: AppColors.primary,
                      borderColor: AppColors.primary,
                    ),
                    SizedBox(height: 15, width: 0),
                    AppTextField(
                      controller: editCodeController,
                      labelText: "Verification Code",
                      icon: CupertinoIcons.creditcard,
                      hintText: "Verification Code",
                    ),
                    SizedBox(height: 15, width: 0),
                    AppTextField(
                      obscureText: true,
                      labelText: "Password",
                      icon: CupertinoIcons.padlock,
                      onChanged: (_) {
                        if (editEmailController.text.isEmpty ||
                            editPasswordController.text.isEmpty) {
                          isEnabled = false;
                        } else {
                          isEnabled = true;
                        }
                        setState(() {});
                      },
                      isSuffixIcon: true,
                      hintText: "Enter your password",
                      controller: editPasswordController,
                    ),
                    SizedBox(height: 15, width: 0),
                    TermsCondition(),
                    SizedBox(height: 20, width: 0),
                    AppButton(
                      padding: 0,
                      bWidth: 1,
                      borderColor: AppColors.primary,
                      textColor: isEnabled
                          ? AppColors.white
                          : AppColors.primary,
                      onPressed: () {
                        if (validation(context)) {
                          customProgressLoading(context);
                          context.read<AuthBloc>().add(
                            RegisterRequest(
                              email: editEmailController.text,
                              password: editPasswordController.text,
                            ),
                          );
                        }
                      },
                      text: "Register",
                      backgroundColor: isEnabled
                          ? AppColors.primary
                          : AppColors.white,
                    ),
                    SizedBox(height: 25, width: 0),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: GoogleFonts.dmSans(
                            letterSpacing: 1.13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey3,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(AppRoutePaths.login);
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
                  ],
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is RegisterSuccess) {
            context.go(AppRoutePaths.login);
          } else if (state is AuthFailure) {
            context.pop();
            SnackbarHelper.show(context, message: state.message);
          }
        },
      ),
    );
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
