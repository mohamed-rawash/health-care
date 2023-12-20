import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/extensions.dart';
import 'package:health_care/features/login/logic/login_cubit/login_cubit.dart';
import 'package:health_care/features/login/ui/widgets/password_validation.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/doc_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = passwordController.text.hasLowerCase;
        hasUpperCase = passwordController.text.hasUpperCase;
        hasSpecialCharacter = passwordController.text.hasSpecialCharacter;
        hasNumber = passwordController.text.hasNumber;
        hasMinLength = passwordController.text.hasMinLength;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          DocTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty || !value.isValidEmail) {
                return 'Pleas enter a valid email';
              }
            },
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
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty || !value.isValidPassword) {
                return 'Pleas enter a valid email';
              }
            },
          ),
          verticalSpacing(height: 16),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
