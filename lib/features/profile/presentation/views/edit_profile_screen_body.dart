import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditProfileScreenBody extends StatelessWidget {
  final BuildContext context;
  final String fullName;
  final String email;
  final String phone;
  EditProfileScreenBody({
    super.key,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.context,
  });
  final _formKey = GlobalKey<FormState>();

  late String _fullName;
  late String _phone;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is StudentFailure) {
          SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
        }

        if (state is UpdateProfile) {
          SnackBarHelper.showSnackBar(
            context,
            "Profile updated successfully",
            Colors.green,
          );

          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        final isLoading = state is StudentLoading;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: fullName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: "Full Name",
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "FullName is required";
                    }
                    return null;
                  },
                  onSaved: (val) => _fullName = val!.trim(),
                ),

                const Gap(16),

                TextFormField(
                  initialValue: email,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Email",
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const Gap(16),

                // Phone
                TextFormField(
                  initialValue: phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: "Phone Number",
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "phone is required";
                    } else if (val.length < 11) {
                      return "enter valid number";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => _phone = val!.trim(),
                ),

                const Gap(24),

                SizedBox(
                  width: double.infinity,
                  child: MainButton(
                    hasCircularBorder: true,
                    onTap: isLoading ? null : () => _onSavePressed(context),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onSavePressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    if (!context.mounted) return;
    context.read<StudentCubit>().updateProfile(
      fullname: _fullName,
      phonenumber: _phone,
    );
  }
}
