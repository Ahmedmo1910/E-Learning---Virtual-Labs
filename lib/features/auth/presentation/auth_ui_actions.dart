import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/forget_password/presentation/views/reset_password_screen.dart';
import 'package:e_learning/features/auth/forget_password/presentation/views/verify_otp_screen.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:e_learning/features/auth/verify_screen.dart';
import 'package:e_learning/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthUiActions {
  static Future<void> signUpActions({
    required BuildContext context,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final auth = context.read<AuthCubit>();

    // isLoading alternative
    if (auth.state is AuthLoading) return;

    await auth.register(
      fullName: fullName.trim(),
      email: email.trim(),
      password: password.trim(),
      phoneNumber: phoneNumber.trim(),
    );

    if (!context.mounted) return;

    final state = auth.state;

    if (state is AuthSuccess) {
      SnackBarHelper.showSnackBar(
        context,
        'Account created successfuly',
        Colors.green,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VerifyEmailScreen(email: email.trim()),
        ),
      );
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }

  static Future<void> signInActions({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final auth = context.read<AuthCubit>();

    if (auth.state is AuthLoading) return;

    await auth.login(email: email.trim(), password: password.trim());

    if (!context.mounted) return;

    final state = auth.state;

    if (state is AuthSuccess) {
      SnackBarHelper.showSnackBar(context, 'Login successfuly', Colors.green);
      Navigator.pushReplacementNamed(context,MainScreen.routeName);
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }

  static Future<void> sendResetOtp({
    required BuildContext context,
    required String email,
  }) async {
    final auth = context.read<AuthCubit>();

    await auth.sendResetOtp(email: email);

    if (!context.mounted) return;

    final state = auth.state;

    if (state is OtpSent) {
      SnackBarHelper.showSnackBar(context, "OTP sent! To $email", Colors.green);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VerifyOtpScreen(email: email)),
      );
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }

  static Future<void> verifyOtp({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    final auth = context.read<AuthCubit>();

    await auth.verifyOtp(email: email.trim(), otp: otp.trim());

    if (!context.mounted) return;

    final state = auth.state;

    if (state is OtpVerified) {
      SnackBarHelper.showSnackBar(context, "OTP Verified!", Colors.green);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ResetPasswordScreen(email: email, resetToken: state.resetToken),
        ),
      );
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }

  static Future<void> resetPassword({
    required BuildContext context,
    required String email,
    required String resetToken,
    required String newpassword,
  }) async {
    final auth = context.read<AuthCubit>();

    await auth.resetPassword(
      email: email.trim(),
      resetToken: resetToken.trim(),
      newpassword: newpassword.trim(),
    );

    if (!context.mounted) return;

    final state = auth.state;

    if (state is PasswordResetSuccess) {
      SnackBarHelper.showSnackBar(
        context,
        "Password Changed Successfully",
        Colors.green,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => SigninScreen()),
        (route) => false,
      );
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }

  static Future<void> signOut({required BuildContext context}) async {
    final auth = context.read<AuthCubit>();

    await auth.logout();

    if (!context.mounted) return;

    final state = auth.state;

    if (state is AuthSuccess) {
      SnackBarHelper.showSnackBar(
        context,
        'Logged out successfully.',
        Colors.green,
      );
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SigninScreen()),
        (route) => false,
      );
    } else if (state is AuthFailure) {
      SnackBarHelper.showSnackBar(context, state.errorMsg, Colors.red);
    }
  }
}

// class AuthUiActions {
//   static Future<void> signUpActions({
//     required BuildContext context,
//     required String fullName,
//     required String email,
//     required String phoneNumber,
//     required String password,
//   }) async {
//     final auth = context.read<AuthProvider>();
//     if (auth.isLoading) return;
//     final sucess = await auth.register(
//       fullName: fullName.trim(),
//       email: email.trim(),
//       password: password.trim(),
//       phoneNumber: phoneNumber.trim(),
//     );

//     if (!context.mounted) return;

//     if (sucess) {
//       SnackBarHelper.showSnackBar(
//         context,
//         'Account created successfuly',
//         Colors.green,
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => VerifyEmailScreen(email: email.trim()),
//         ),
//       );
//     } else {
//       SnackBarHelper.showSnackBar(context, 'Registration failed', Colors.red);
//     }
//   }

//   static Future<void> signInActions({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     final auth = context.read<AuthProvider>();
//     if (auth.isLoading) return;
//     final sucess = await auth.login(
//       email: email.trim(),
//       password: password.trim(),
//     );
//     if (!context.mounted) return;
//     if (sucess) {
//       SnackBarHelper.showSnackBar(context, 'Login successfuly', Colors.green);
//       Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
//     } else {
//       SnackBarHelper.showSnackBar(context, 'Login failed', Colors.red);
//     }
//   }

//   static Future<void> sendResetOtp({
//     required BuildContext context,
//     required String email,
//   }) async {
//     final auth = context.read<AuthProvider>();

//     final success = await auth.sendResetOtp(email: email);
//     if (!context.mounted) return;
//     if (success) {
//       SnackBarHelper.showSnackBar(context, "OTP sent! To $email", Colors.green);

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => VerifyOtpScreen(email: email)),
//       );
//     } else {
//       SnackBarHelper.showSnackBar(context, auth.errorMsg!, Colors.red);
//     }
//   }

//   static Future<void> verifyOtp({
//     required BuildContext context,
//     required String email,
//     required String otp,
//   }) async {
//     final auth = context.read<AuthProvider>();
//     final resetToken = await auth.verifyOtp(
//       email: email.trim(),
//       otp: otp.trim(),
//     );
//     if (!context.mounted) return;
//     if (resetToken != null) {
//       SnackBarHelper.showSnackBar(context, "OTP Verified!", Colors.green);

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) =>
//               ResetPasswordScreen(email: email, resetToken: resetToken),
//         ),
//       );
//     } else {
//       SnackBarHelper.showSnackBar(context, auth.errorMsg!, Colors.red);
//     }
//   }

//   static Future<void> resetPassword({
//     required BuildContext context,
//     required String email,
//     required String resetToken,
//     required String newpassword,
//   }) async {
//     final auth = context.read<AuthProvider>();
//     final success = await auth.resetPassword(
//       email: email.trim(),
//       resetToken: resetToken.trim(),
//       newpassword: newpassword.trim(),
//     );

//     if (!context.mounted) return;

//     if (success) {
//       SnackBarHelper.showSnackBar(
//         context,
//         "Password Changed Successfully",
//         Colors.green,
//       );

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => SigninScreen()),
//         (route) => false,
//       );
//     } else {
//       SnackBarHelper.showSnackBar(context, auth.errorMsg!, Colors.red);
//     }
//   }

//   static Future<void> signOut({required BuildContext context}) async {
//     final auth = context.read<AuthProvider>();
//     final sucess = await auth.logout();

//     if (!context.mounted) return;

//     if (sucess) {
//       SnackBarHelper.showSnackBar(
//         context,
//         'Logged out successfully.',
//         Colors.green,
//       );
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const SigninScreen()),
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(auth.errorMsg ?? "Logout failed"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }
