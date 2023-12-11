import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static toNamed({required routeName, Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static replaceNamed({required routeName, Object? arguments}) {
    navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static replaceUntilNamed({required routeName, Object? arguments}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void toReplacementNamed({required String routeName}) {
    Navigator.pushReplacementNamed(navigatorKey.currentContext!, routeName);
  }

  static back() => navigatorKey.currentState?.pop();
}
