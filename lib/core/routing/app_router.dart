import 'package:flutter/material.dart';
import 'package:health_care/core/routing/routes.dart';
import 'package:health_care/features/login/ui/login_screen.dart';
import 'package:health_care/features/onboarding/onboarding_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
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
