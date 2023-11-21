import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {required RoutePredicate predicate, Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName,predicate, arguments: arguments);

   void pop() => Navigator.of(this).pop();
}
