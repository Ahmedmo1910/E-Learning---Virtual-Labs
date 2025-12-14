import 'package:e_learning/core/widgets/custom_progress_hud.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../auth/sign_in/presentation/views/signin_screen.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import 'profile_container_widget.dart';

class ProfileScreenBodyBlocConsumer extends StatelessWidget {
  const ProfileScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogout) {
          SnackBarHelper.showSnackBar(
            context,
            'Logged out successfully',
            Colors.green,
          );

          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamedAndRemoveUntil(SigninScreen.routeName, (route) => false);
        }

        if (state is ProfileFailure) {
          SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
        }
      },
      builder: (context, state) {
        final isLoading = state is ProfileLoading;
        final isLogoutLoading =
            state is ProfileLoading && state.isLogout == true;

        if (state is ProfileLoaded) {
          return CustomProgressHud(
            isLoading: isLogoutLoading,
            child: ProfileContainerWidget(profile: state.profile),
          );
        }

        if (state is ProfileInitial || isLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 250,
              width: 250,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
