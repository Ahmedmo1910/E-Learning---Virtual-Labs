import 'package:e_learning/core/widgets/auth_header_widget.dart';
import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/presentation/auth_ui_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  @override
  Widget build(BuildContext context) {
     final auth = context.watch<AuthCubit>();
      final state = auth.state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Screen .............:)
            AuthHeaderWidget(
              headerTitle: 'Forget Password ?',
              headerSubTitle:
                  "Enter your email address and\nwe’ll send a confirmation code",
            ),
            //Form .............:)
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,

                  hintText: "Email",
                  border: OutlineInputBorder(
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Email is required";

                  if (!val.contains("@")) return "Enter valid email";

                  return null;
                },
                onSaved: (val) => email = val!.trim(),
              ),
            ),
            SizedBox(height: 40),

            //Continue Bottom ..................:)
            MainButton(
              text: 'Continue',
              hasCircularBorder: true,
              onTap: state is AuthLoading? null : _sendResetOtp,
              child: state is AuthLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendResetOtp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    await AuthUiActions.sendResetOtp(context: context, email: email);
  }
}
