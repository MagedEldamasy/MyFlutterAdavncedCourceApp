import 'package:flutter/material.dart';
import 'package:test_flutter_app1/core/routing/routes.dart';
import 'package:test_flutter_app1/features/login/ui/login_screen.dart';
import 'package:test_flutter_app1/features/onBording/ui/onbording_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    // Define your route generation logic here
    // For example, you can use a switch statement to handle different routes
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return  MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
           child:  Text(
              "no Route For ${settings.name}"
            )
          )
        ));
    }
  }
}
