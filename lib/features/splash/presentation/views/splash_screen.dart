import 'package:e_learning/constants.dart';
import 'package:e_learning/core/helper_functions/secure_storage.dart';
import 'package:e_learning/core/services/shared_preferences_singleton.dart';
import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import '../../../auth/sign_in/presentation/views/signin_screen.dart';
import 'widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPrimaryColor,
      body: SplashScreenBody(),
    );
  }

  void executeNavigation() async {
    bool isOnBoardingViewSeen = prefs.getBool(kIsOnBoardingViewSeen);
    final isLoggedIn = await SecureStorage.isLoggedIn();
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninScreen.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }
    });
  }
}
