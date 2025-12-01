import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/custom_text.dart';
import 'package:e_learning/core/widgets/custom_text_form_field.dart';
import 'package:e_learning/core/widgets/or_sign_with.dart';
import 'package:e_learning/core/widgets/password_field.dart';
import 'package:e_learning/core/widgets/social_auth.dart';
import 'package:e_learning/features/auth/data/auth_provider.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/widgets/have_account_widget.dart';
import 'package:e_learning/features/auth/verify_screen.dart';
import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, phoneNumber, fullName, password;
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(label: 'Create an '),
              const CustomText(label: 'account'),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => fullName = value!,
                hintText: 'User Name',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/userName.svg',
                  fit: BoxFit.scaleDown,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/email.svg',
                  fit: BoxFit.scaleDown,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                prefixIcon: Icon(Icons.phone),
                hintText: 'phoneNumber',
                onSaved: (value) => phoneNumber = value!,
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                hintText: ' Password',
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 32.0),
              if (auth.errorMsg != null)
                Text(
                  auth.errorMsg!,
                  style: const TextStyle(color: Colors.red),
                ),
              MainButton(
                text: 'Sign Up',
                hasCircularBorder: true,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    if (auth.isLoading) return;

                    final sucess = await auth.register(
                      fullName: fullName.trim(),
                      email: email.trim(),
                      password: password.trim(),
                      phoneNumber: phoneNumber.trim(),
                    );

                    if (!mounted) return;

                    if (sucess) {
                      SnackBarHelper.showSnackBar(
                        context,
                        'Account created successfuly',
                        Colors.green,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              VerifyEmailScreen(email: email.trim()),
                        ),
                      );
                    } else {
                      SnackBarHelper.showSnackBar(
                        context,
                        'Registration failed',
                        Colors.red,
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 32.0),
              OrSignWith(text: 'Up'),
              const SizedBox(height: 16.0),
              SocialAuth(
                text: 'Facebook',
                imagePath: 'facebook',
                color: Color(0XFF1877F2),
                textColor: Colors.white,
              ),

              SocialAuth(text: 'Google', imagePath: 'google'),

              const SizedBox(height: 16.0),
              const HaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
