import 'package:flutter/material.dart';

class NavigatorContext {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static Future go(String routeName, {Object? arguments}) {
    return Navigator.of(key.currentContext!).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future add(String routeName, {Object? arguments}) {
    return Navigator.of(key.currentContext!).pushNamed(routeName, arguments: arguments);
  }

  static void back() {
    Navigator.of(key.currentContext!).pop();
  }
}
