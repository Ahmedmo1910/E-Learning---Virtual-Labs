import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/presentation/auth_ui_actions.dart';
import 'package:e_learning/generated/l10n.dart';
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
    final auth = context.watch<AuthCubit>();
    final state = auth.state;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title:  Text(S.of(context).resetPasswordTitle)),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: S.of(context).newPasswordHint,
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
                    if (val == null || val.isEmpty) return S.of(context).passwordRequired;
      
                    if (val.length < 8) return  S.of(context).passwordMinLength;
      
                    return null;
                  },
                  onSaved: (val) => newPassword = val!.trim(),
                ),
      
                const SizedBox(height: 20),
      
                MainButton(
                  onTap: state is AuthLoading ? null : _resetPassword,
                  child: state is AuthLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      :  Text(S.of(context).resetPasswordButton),
                ),
              ],
            ),
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
