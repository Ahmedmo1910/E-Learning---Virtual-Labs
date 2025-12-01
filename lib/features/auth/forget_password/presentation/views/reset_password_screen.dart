import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/data/auth_provider.dart';
import 'package:e_learning/features/auth/presentation/auth_ui_actions.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String resetToken;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.resetToken,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String newPassword = "";

  @override
  Widget build(BuildContext context) {
    final _auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Password",
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
                  if (val == null || val.isEmpty) return "Password required";

                  if (val.length < 8) return "Required 8 characters or higher";

                  return null;
                },
                onSaved: (val) => newPassword = val!.trim(),
              ),

              const SizedBox(height: 20),

              MainButton(
                onTap: _auth.isLoading ? null : _resetPassword,
                child: _auth.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : const Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    // final _auth = context.read<AuthProvider>();
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    await AuthUiActions.resetPassword(
      context: context,
      email: widget.email,
      resetToken: widget.resetToken,
      newpassword: newPassword,
    );
    // final success = await _auth.resetPassword(
    //   email: widget.email,
    //   resetToken: widget.resetToken,
    //   newpassword: newPassword,
    // );

    // if (!mounted) return;

    // if (success) {
    //   SnackBarHelper.showSnackBar(
    //     context,
    //     "Password Changed Successfully",
    //     Colors.green,
    //   );

    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (_) => SigninScreen()),
    //     (route) => false,
    //   );
    // } else {
    //   SnackBarHelper.showSnackBar(context, _auth.errorMsg!, Colors.red);
    // }
  }
}
