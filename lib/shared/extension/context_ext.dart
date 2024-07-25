import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T, T0>(String routeName, {Object? arguments, T0? result}) {
    return Navigator.of(this).pushReplacementNamed<T, T0>(routeName, arguments: arguments, result: result);
  }

  Future<T?> push<T>(Route<T> route) {
    return Navigator.of(this).push<T>(route);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String newRouteName, {Object? arguments, RoutePredicate? predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate ?? (_) => false, arguments: arguments);
  }

  Future<T?> popAndPushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  Size get maxSize => MediaQuery.of(this).size;

  double get maxWidth => maxSize.width;

  double get maxHeight => maxSize.height;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}