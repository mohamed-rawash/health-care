import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_care/core/helpers/spacing.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/core/widgets/doc_main_button.dart';
import 'package:health_care/core/widgets/doc_text24_blue_bold.dart';
import 'package:health_care/core/widgets/doc_text_form_field.dart';
import 'package:health_care/core/widgets/social_button.dart';

import '../../../core/themes/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isRemember = true;

  @override
  Widget build(BuildContext context) {
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const DocTextFormField(
                        hintText: "Email",
                      ),
                      verticalSpacing(height: 16),
                      DocTextFormField(
                        hintText: "Password",
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
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
                            setState(() {
                              isRemember = value!;
                            });
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
                DocMainButton(btnText: "Login", onPressed: () {}),
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
                    SocialButton(icon: SvgPicture.asset("assets/svgs/google_logo.svg"), onTap: (){}),
                    horizontalSpacing(width: 32),
                    SocialButton(icon: SvgPicture.asset("assets/svgs/facebook_logo.svg"), onTap: (){}),
                    horizontalSpacing(width: 32),
                    SocialButton(icon: SvgPicture.asset("assets/svgs/apple_logo.svg"), onTap: (){}),
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
                       text:  "and ",
                        style: TextStyles.font13GreyRegular,
                      ),
                      TextSpan(
                       text:  "PrivacyPolicy.",
                        style: TextStyles.font13BlackMedium,
                      ),
                    ]
                  ),
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
                      ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
