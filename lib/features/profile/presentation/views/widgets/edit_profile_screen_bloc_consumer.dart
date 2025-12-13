import 'package:e_learning/core/widgets/custom_progress_hud.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:e_learning/features/profile/presentation/views/edit_profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreenBlocConsumer extends StatelessWidget {
  final Map profile;
  const EditProfileScreenBlocConsumer({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUpdated) {
          Navigator.pop(context, true);
          SnackBarHelper.showSnackBar(
            context,
            'Updated Successfully',
            Colors.green,
          );
        } else if (state is ProfileFailure) {
          SnackBarHelper.showSnackBar(context, 'Failed to update', Colors.red);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ProfileLoading ? true : false,
          child: EditProfileScreenBody(profile: profile),
        );
      },
    );
  }
}
