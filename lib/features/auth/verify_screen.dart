import 'package:e_learning/features/auth/data/auth_provider.dart';
import 'package:e_learning/core/widgets/snack_bar_helper.dart';
import 'package:e_learning/features/auth/sign_in/presentation/views/signin_screen.dart';
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
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Enter the OTP sent to: ${widget.email}"),
            TextField(
              controller: otp,
              decoration: const InputDecoration(labelText: "OTP Code"),
            ),

            const SizedBox(height: 20),

            if (auth.errorMsg != null)
              Text(auth.errorMsg!, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: auth.isLoading
                  ? null
                  : () async {
                      final sucess = await auth.verifyEmail(
                        email: widget.email,
                        otp: otp.text.trim(),
                      );

                      if (!mounted) return;

                      if (sucess) {
                        SnackBarHelper.showSnackBar(
                          context,
                          'Email Verified Successfully!',
                          Colors.green,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SigninScreen(),
                          ),
                        );
                      } else {
                        SnackBarHelper.showSnackBar(
                          context,
                          'Verification failed',
                          Colors.red,
                        );
                      }
                    },
              child: auth.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
