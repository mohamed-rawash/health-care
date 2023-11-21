import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/core/helpers/extensions.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/features/onboarding/widgets/doc_log_and_name.dart';
import 'package:health_care/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:health_care/features/onboarding/widgets/get_started_button.dart';

import '../../core/routing/routes.dart';
import '../../core/themes/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(
                height: 41.h,
              ),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    Text(
                      "Manage and schedule all of your medical appointments easily with DocDoc to get a new experience.",
                      textAlign: TextAlign.center,
                      style: TextStyles.font13GreyWeight400,
                    ),
                    const GetStartedButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
