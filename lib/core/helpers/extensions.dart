import 'package:flutter/cupertino.dart';
import 'package:health_care/core/helpers/app_regex.dart';

/// navigation
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
          {required RoutePredicate predicate, Object? arguments}) =>
      Navigator.of(this)
          .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void pop() => Navigator.of(this).pop();
}

///String
extension UserInputValidations on String {
  bool get isValidEmail => AppRegex.emailValid.hasMatch(this);
  bool get isValidPassword => AppRegex.passwordValid.hasMatch(this);
  bool get hasLowerCase => AppRegex.lowerCase.hasMatch(this);
  bool get hasUpperCase => AppRegex.upperCase.hasMatch(this);
  bool get hasNumber => AppRegex.number.hasMatch(this);
  bool get hasSpecialCharacter => AppRegex.specialCharacter.hasMatch(this);
  bool get hasMinLength => AppRegex.minLength.hasMatch(this);
}
