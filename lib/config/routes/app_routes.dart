import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_app/presentation/screens/login/login.dart';
import 'package:flutter_app/presentation/screens/onBoarding/onBoarding_screen.dart';
import 'package:flutter_app/presentation/screens/sign_up/signup_screen.dart';
import 'package:flutter_app/presentation/screens/splach/splach_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String initialRoute = '/';
  static const String splach = '/splach';
  static const String login = '/login';
  static const String onBoarding = '/onBoarding';
  static const String signUp = '/signUp';
  static const String home = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return PageTransition(
          child: const Login(),
          type: PageTransitionType.leftToRight,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 700),
          reverseDuration: const Duration(milliseconds: 700),
        );

      case Routes.splach:
        return MaterialPageRoute(builder: (context) => const SplachScreen());

      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case Routes.signUp:
        return PageTransition(
          child: SignUpScreen(),
          type: PageTransitionType.leftToRight,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 700),
          reverseDuration: const Duration(milliseconds: 700),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
