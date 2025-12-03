import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: customAppBar(context),
        body: ForgetPasswordScreenBody(),
      ),
    );
  }
}
