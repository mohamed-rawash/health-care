import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care/core/helpers/extensions.dart';
import 'package:health_care/core/routing/routes.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/styles.dart';

class DocMainButton extends StatelessWidget {
  const DocMainButton({super.key, required this.btnText, required this.onPressed});

  final String btnText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        maximumSize: const Size(double.infinity, 52),
        backgroundColor: ColorsManager.mainBlue,
        foregroundColor: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyles.font16WhiteSemiBold,
      ),
      child: Text(btnText),
    );
  }
}
