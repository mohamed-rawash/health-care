import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/core/themes/colors.dart';

class TextStyles {
  static TextStyle font24BlackWeight700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font13GreyWeight400 = TextStyle(
    color: ColorsManager.grey,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font16WhiteWeight600 = TextStyle(
    color: ColorsManager.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}