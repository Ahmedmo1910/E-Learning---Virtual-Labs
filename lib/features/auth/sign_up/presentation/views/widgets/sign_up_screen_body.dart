import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/custom_text.dart';
import 'package:e_learning/core/widgets/custom_text_form_field.dart';
import 'package:e_learning/core/widgets/or_sign_with.dart';
import 'package:e_learning/core/widgets/password_field.dart';
import 'package:e_learning/core/widgets/social_auth.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/widgets/have_account_widget.dart';
import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name, confirmPassword;
  @override
  Widget build(BuildContext context) {
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
                onSaved: (value) => name = value!,
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
              PasswordField(onSaved: (value) => password = value!),
              const SizedBox(height: 16.0),
              PasswordField(
                hintText: 'Confirm Password',
                onSaved: (value) => confirmPassword = value!,
              ),
              const SizedBox(height: 32.0),
              MainButton(
                text: 'Sign Up',
                hasCircularBorder: true,
                onTap: () {
                  Navigator.pushNamed(context, MainScreen.routeName);

                  if (formKey.currentState!.validate()) {
                    // formKey.currentState!.save();
                    // context
                    //     .read<SignUpCubit>()
                    //     .createUserWithEmailAndPassword(email, password, name);
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
