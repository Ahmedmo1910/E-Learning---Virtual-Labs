import 'package:e_learning/features/auth/sign_up/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignUpScreenBody()),
    );
  }
}