import 'package:flutter/material.dart';

import '../themes/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, required this.onTap});
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: ColorsManager.grey20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
        ),
        child: icon,
      ),
    );
  }
}
