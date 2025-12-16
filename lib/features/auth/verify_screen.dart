import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/cubit/auth_cubit.dart';
import 'package:e_learning/features/auth/cubit/auth_state.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>();
    final state = auth.state;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).verifyEmailTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Text("Enter the OTP sent to: ${widget.email}"),
            Text(S.of(context).enterOtpp(widget.email)),
            TextField(
              controller: otp,
              decoration: InputDecoration(labelText: S.of(context).otpCode),
            ),

            const SizedBox(height: 20),

            if (state is AuthFailure)
              Text(state.errorMsg, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: state is AuthLoading
                  ? null
                  : () async {
                      final sucess = await auth.verifyEmail(
                        email: widget.email,
                        otp: otp.text.trim(),
                      );

                      if (!mounted) return;

                      if (state is AuthSuccess) {
                        SnackBarHelper.showSnackBar(
                          context,
                          S.of(context).emailVerifiedSuccess,
                          Colors.green,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SigninScreen(),
                          ),
                        );
                      } else if (state is AuthFailure) {
                        SnackBarHelper.showSnackBar(
                          context,
                          state.errorMsg,
                          Colors.red,
                        );
                      }
                    },
              child: state is AuthLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(S.of(context).verifyButton),
            ),
          ],
        ),
      ),
    );
  }
}

// class VerifyEmailScreen extends StatefulWidget {
//   final String email;
//   const VerifyEmailScreen({super.key, required this.email});

//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }

// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   final otp = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final auth = context.watch<AuthProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Verify Email")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text("Enter the OTP sent to: ${widget.email}"),
//             TextField(
//               controller: otp,
//               decoration: const InputDecoration(labelText: "OTP Code"),
//             ),

//             const SizedBox(height: 20),

//             if (auth.errorMsg != null)
//               Text(auth.errorMsg!, style: const TextStyle(color: Colors.red)),

//             const SizedBox(height: 8),

//             ElevatedButton(
//               onPressed: auth.isLoading
//                   ? null
//                   : () async {
//                       final sucess = await auth.verifyEmail(
//                         email: widget.email,
//                         otp: otp.text.trim(),
//                       );

//                       if (!mounted) return;

//                       if (sucess) {
//                         SnackBarHelper.showSnackBar(
//                           context,
//                           'Email Verified Successfully!',
//                           Colors.green,
//                         );
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const SigninScreen(),
//                           ),
//                         );
//                       } else {
//                         SnackBarHelper.showSnackBar(
//                           context,
//                           'Verification failed',
//                           Colors.red,
//                         );
//                       }
//                     },
//               child: auth.isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Verify"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
