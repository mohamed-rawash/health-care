import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/core/themes/colors.dart';

import '../themes/styles.dart';

class DocTextFormField extends StatelessWidget {
  const DocTextFormField({super.key, this.contentPadding, this.focusedBorder, this.enabledBorder, this.inputTextStyle, this.hintStyle, required this.hintText, this.isObscureText, this.suffixIcon});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    debugPrint("${"*-* " * 10} build from TextFormField ${"*-* " * 10}");
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding??
              EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
          focusedBorder: focusedBorder?? OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsManager.mainBlue, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: enabledBorder?? OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsManager.lighterGrey, width: 1.3),
            borderRadius: BorderRadius.circular(16),
          ),
        hintStyle: hintStyle?? TextStyles.font14LightGreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorsManager.moreLightGrey
      ),
      obscureText: isObscureText?? false,
      obscuringCharacter: "*",
      style: inputTextStyle?? TextStyles.font16DarkBlueMedium,
      onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
