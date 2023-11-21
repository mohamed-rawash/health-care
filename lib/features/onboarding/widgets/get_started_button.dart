import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30.h,
        left: 10.w,
        right: 10.w,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 52),
          maximumSize: const Size(double.infinity, 52),
          backgroundColor: ColorsManager.mainBlue,
          foregroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: TextStyles.font16WhiteWeight600,
        ),
        child: const Text("Get Started"),
      ),
    );
  }
}
