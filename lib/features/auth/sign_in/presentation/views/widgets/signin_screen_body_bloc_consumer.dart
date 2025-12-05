import 'package:e_learning/core/widgets/custom_progress_hud.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/sign_in/presentation/cubit/signin_cubit.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/widgets/signin_screen_body.dart';
import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SigninScreenBodyBlocConsumer extends StatelessWidget {
  const SigninScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          SnackBarHelper.showSnackBar(
            context,
            'Login successful',
            Colors.green,
          );
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        } else if (state is SigninFailure) {
          SnackBarHelper.showSnackBar(context, 'Failed to login', Colors.red);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninScreenBody(),
        );
      },
    );
  }
}
