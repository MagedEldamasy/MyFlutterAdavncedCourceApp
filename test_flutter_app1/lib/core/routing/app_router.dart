import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_app1/core/di/dependency_injection.dart';
import 'package:test_flutter_app1/core/routing/routes.dart';
import 'package:test_flutter_app1/features/home/ui/home_screen.dart';
import 'package:test_flutter_app1/features/login/logic/login_cubit.dart';
import 'package:test_flutter_app1/features/login/ui/login_screen.dart';
import 'package:test_flutter_app1/features/onBording/ui/onbording_screen.dart';
import 'package:test_flutter_app1/features/sing_up/logic/sign_up_cubit.dart';
import 'package:test_flutter_app1/features/sing_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    // Define your route generation logic here
    // For example, you can use a switch statement to handle different routes
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt<SignUpCubit
          >(),
          child: SignUpScreen()));

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
