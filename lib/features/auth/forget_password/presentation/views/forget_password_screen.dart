import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/features/auth/data/auth_repo.dart';
import 'package:e_learning/features/auth/forget_password/presentation/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/forget_password_bloc_consumer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(AuthRepo()),
      child: Scaffold(
        appBar: customAppBar(context),
        body: ForgetPasswordBlocConsumer(),
      ),
    );
  }
}
