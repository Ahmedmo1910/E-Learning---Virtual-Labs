import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/custom_text.dart';
import 'package:e_learning/core/widgets/custom_text_form_field.dart';
import 'package:e_learning/core/widgets/or_sign_with.dart';
import 'package:e_learning/core/widgets/password_field.dart';
import 'package:e_learning/core/widgets/social_auth.dart';
import 'package:e_learning/features/auth/data/auth_provider.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:e_learning/features/auth/sign_up/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:e_learning/features/auth/verify_screen.dart';
import 'package:e_learning/features/home/presentation/views/home_screen.dart';

import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SigninScreenBody extends StatefulWidget {
  const SigninScreenBody({super.key});

  @override
  State<SigninScreenBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<SigninScreenBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _auth = context.watch<AuthProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(label: 'Welcome'),
              const CustomText(label: 'Back!'),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'Username or Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/userName.svg',
                  fit: BoxFit.scaleDown,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              PasswordField(onSaved: (value) => password = value!),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.regular14.copyWith(
                      color: Color(0XFF858383),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              MainButton(
                text: 'Sign In',
                hasCircularBorder: true,
                onTap:
                    () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (_auth.isLoading) return;
                        final sucess = await _auth.login(
                          email: email.trim(),
                          password: password.trim(),
                        );
                        if (!mounted) return;
                        if (sucess) {
                          SnackBarHelper.showSnackBar(
                            context,
                            'Login successfuly',
                            Colors.green,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => MainScreen()),
                          );
                        } else {
                          SnackBarHelper.showSnackBar(
                            context,
                            'Login failed',
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
              OrSignWith(text: 'In'),
              const SizedBox(height: 16.0),
              SocialAuth(
                text: 'Facebook',
                imagePath: 'facebook',
                color: Color(0XFF1877F2),
                textColor: Colors.white,
              ),

              SocialAuth(text: 'Google', imagePath: 'google'),
              const SizedBox(height: 24.0),
              const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
