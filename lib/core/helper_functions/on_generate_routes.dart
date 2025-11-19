import 'package:e_learning/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/main_screen.dart';
import '../../features/auth/forget_password/presentation/views/forget_password_screen.dart';
import '../../features/auth/sign_in/presentation/views/signin_screen.dart';
import '../../features/auth/sign_up/presentation/views/signup_screen.dart';
import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SigninScreen());
    case SignupScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      );
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
