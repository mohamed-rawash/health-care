import 'package:flutter/material.dart';
import 'package:health_care/core/helpers/spacing.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/core/themes/styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidation({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacters, required this.hasNumber, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildValidationRow('At least has 1 lowercase letter', hasLowerCase),
        verticalSpacing(height: 2),
        buildValidationRow('At least has 1 uppercase letter', hasUpperCase),
        verticalSpacing(height: 2),
        buildValidationRow('At least has 1 special characters', hasSpecialCharacters),
        verticalSpacing(height: 2),
        buildValidationRow('At least has 1 number', hasNumber),
        verticalSpacing(height: 2),
        buildValidationRow('At least has 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: hasValidated? ColorsManager.green: ColorsManager.grey,
        ),
        horizontalSpacing(width: 6),
        Text(
          text,
          style: TextStyles.font13BlackRegular.copyWith(
            decoration: hasValidated? TextDecoration.lineThrough: null,
            decorationColor: ColorsManager.green,
            decorationThickness: 2,
            color: hasValidated? ColorsManager.green: ColorsManager.grey
          ),
        ),
      ],
    );
  }
}
