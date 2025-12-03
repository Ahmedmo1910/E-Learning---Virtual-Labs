import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/presentation/auth_ui_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _formKey = GlobalKey<FormState>();

  String otp = "";

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>();
    final state = auth.state;
    return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Verify OTP")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "OTP Code",
                    filled: true,
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
                    if (val == null || val.isEmpty) {
                      return "OTP required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => otp = val!.trim(),
                ),
      
                const SizedBox(height: 20),
      
                MainButton(
                  onTap: state is AuthLoading ? null : _verifyOtp,
                  child: state is AuthLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOtp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await AuthUiActions.verifyOtp(
        context: context,
        email: widget.email,
        otp: otp,
      );
    } else {
      return;
    }
  }
}
