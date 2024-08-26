import 'package:bdo_online_clone/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_routes.dart';
import 'core/providers/navbar_provider.dart';
import 'core/utils/navigator_context.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavBarProvider()),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorContext.key,
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.routeName,
        routes: AppRoutes.routes,
      ),
    );
  }
}
