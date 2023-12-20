import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/helpers/extensions.dart';
import 'package:health_care/core/routing/routes.dart';
import 'package:health_care/core/themes/colors.dart';
import 'package:health_care/features/login/logic/login_cubit/login_cubit.dart';
import 'package:health_care/features/login/logic/login_cubit/login_state.dart';

import '../../../../core/themes/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (_) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorsManager.green,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  "Welcome You Logged In Successful",
                  style: TextStyles.font16DarkBlueMedium,
                ),
              ),
            );
          },
          error: (error) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorsManager.red,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  error,
                  style: TextStyles.font16DarkBlueMedium,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
