import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/routing/routes.dart';
import 'package:health_care/features/home/ui/home_screen.dart';
import 'package:health_care/features/login/logic/login_cubit/login_cubit.dart';
import 'package:health_care/features/login/ui/login_screen.dart';
import 'package:health_care/features/onboarding/onboarding_screen.dart';

import '../di/dependency_injection.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Route Define For ${settings.name}"),
            ),
          ),
        );
    }
  }
}
