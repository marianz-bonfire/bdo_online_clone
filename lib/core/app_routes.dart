import 'package:bdo_online_clone/ui/screens/home_screen.dart';
import 'package:bdo_online_clone/ui/screens/passcode_screen.dart';
import 'package:bdo_online_clone/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HomeScreen.routeName: (context) => HomeScreen(),
    WelcomeScreen.routeName: (context) => WelcomeScreen(),
    PasscodeScreen.routeName: (context) => PasscodeScreen(),
  };
}
