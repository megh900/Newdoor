
import 'package:first/screens/aboutus/aboutus.dart';
import 'package:first/screens/buy/buy.dart';
import 'package:first/screens/home/home_screen.dart';
import 'package:first/screens/sell/sell.dart';
import 'package:first/screens/sell_form/sellform.dart';
import 'package:first/screens/sign_in/sign_in_screen.dart';
import 'package:first/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../screens/onboarding/on_boarding_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoute {

  static const splashScreen = '/';
  static const onBoardingScreen = '/onBoarding';
  static const signInScreen = '/signIn';
  static const signUpScreen = '/signUp';
  static const homeScreen = '/home';
  static const aboutScreen='/about';
  static const buyScreen='/buy';
  static const sellScreen='/sell';
  static const sellformscreen='/sellform';


  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        );
      case signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case aboutScreen:
        return MaterialPageRoute(
          builder: (context) => about(),
        );
      case buyScreen:
        return MaterialPageRoute(
          builder: (context) => buy(),
        );
      case sellScreen:
        return MaterialPageRoute(
          builder: (context) => sell(),
        );
      case sellformscreen:
        return MaterialPageRoute(
          builder: (context) => sellfrom(),
        );

    }
  }
}
