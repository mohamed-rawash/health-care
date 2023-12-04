import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/styles.dart';
import '../../../generated/l10n.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svgs/docdoc_logo.svg"),
        SizedBox(
          width: 8.w,
        ),
        Text(
          S.of(context).app_title,
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}
