import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/custom_text_form_field.dart';
import 'package:e_learning/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditProfileScreenBody extends StatefulWidget {
  final Map profile;
  const EditProfileScreenBody({super.key, required this.profile});

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  late TextEditingController fullNameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(
      text: widget.profile['fullname'] ?? '',
    );
    phoneController = TextEditingController(
      text: widget.profile['phone'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Full Name',
            labelText: 'Full Name',
            controller: fullNameController,
          ),
          const Gap(16),

          CustomTextFormField(
            hintText: 'Phone Number',
            labelText: 'Phone Number',
            controller: phoneController,
          ),
          const Gap(50),
          MainButton(
            text: 'Update Profile',
            hasCircularBorder: true,
            onTap: () {
              context.read<ProfileCubit>().updateProfile(
                fullName: fullNameController.text,
                phoneNumber: phoneController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
