import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/core/themes/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/svgs/docdoc_logo_low_opacity.svg"),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 0.4],
              colors: [ColorsManager.white, ColorsManager.white.withOpacity(0)],
            ),
          ),
          child: Image.asset("assets/images/onboarding_doctor.png"),
        ),
        Positioned(
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
          child: Text(
            "Best Doctor Appointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
