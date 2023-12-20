import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/helpers/spacing.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/core/widgets/doc_main_button.dart';
import 'package:health_care/core/widgets/doc_text24_blue_bold.dart';
import 'package:health_care/core/widgets/doc_text_form_field.dart';
import 'package:health_care/core/widgets/social_button.dart';
import 'package:health_care/features/login/data/models/login_request_body.dart';
import 'package:health_care/features/login/logic/login_cubit/login_cubit.dart';
import 'package:health_care/features/login/ui/widgets/email_and_password.dart';
import 'package:health_care/features/login/ui/widgets/login_bloc_listener.dart';

import '../../../core/themes/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRemember = false;
    debugPrint("${"*-* " * 10} build from login ${"*-* " * 10}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 24.w, right: 24.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DocText24BlueBold(text: "Welcome Back!"),
                      verticalSpacing(height: 8),
                      Text(
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                        style: TextStyles.font14GreyRegular,
                      ),
                    ],
                  ),
                ),
                verticalSpacing(height: 36),
                const EmailAndPassword(),
                verticalSpacing(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isRemember,
                          activeColor: ColorsManager.mainBlue,
                          onChanged: (value) {
                            debugPrint("$isRemember");
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyles.font13GreyRegular,
                        ),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyles.font13BlueRegular,
                    )
                  ],
                ),
                verticalSpacing(height: 32),
                DocMainButton(
                    btnText: "Login",
                    onPressed: () {
                      validateThenDoLogin(context: context);
                    }),
                verticalSpacing(height: 46),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: ColorsManager.grey30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or sign in with",
                        style: TextStyles.font13GreyRegular,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: ColorsManager.grey30,
                      ),
                    ),
                  ],
                ),
                verticalSpacing(height: 41),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                        icon: SvgPicture.asset("assets/svgs/google_logo.svg"),
                        onTap: () {}),
                    horizontalSpacing(width: 32),
                    SocialButton(
                        icon: SvgPicture.asset("assets/svgs/facebook_logo.svg"),
                        onTap: () {}),
                    horizontalSpacing(width: 32),
                    SocialButton(
                        icon: SvgPicture.asset("assets/svgs/apple_logo.svg"),
                        onTap: () {}),
                  ],
                ),
                verticalSpacing(height: 32),
                RichText(
                  text: TextSpan(
                      text: "By logging, you agree to our ",
                      style: TextStyles.font13GreyRegular,
                      children: [
                        TextSpan(
                          text: "Terms & Conditions ",
                          style: TextStyles.font13BlackMedium,
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyles.font13GreyRegular,
                        ),
                        TextSpan(
                          text: "PrivacyPolicy.",
                          style: TextStyles.font13BlackMedium,
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
                verticalSpacing(height: 24),
                RichText(
                  text: TextSpan(
                      text: "Already have an account yet? ",
                      style: TextStyles.font13BlackRegular,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyles.font13BlueMedium,
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
                verticalSpacing(height: 24),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin({required BuildContext context}) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
