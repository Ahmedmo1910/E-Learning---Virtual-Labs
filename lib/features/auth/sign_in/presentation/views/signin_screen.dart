import 'package:e_learning/features/auth/sign_in/presentation/views/widgets/signin_screen_body.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const String routeName = 'signin';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(child: SigninScreenBody()),
    );
  }
}
