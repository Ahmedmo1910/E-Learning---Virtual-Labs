import 'package:e_learning/core/widgets/auth_header_widget.dart';
import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:e_learning/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              child: CustomTextFormField(
                onSaved: (value) {},
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/email.svg',
                  fit: BoxFit.scaleDown,
                  width: 24.0,
                  height: 24.0,
                ),
              )
            ),
            SizedBox(height: 40),

            //Continue Bottom ..................:)
            MainButton(
              text: 'Continue',
              hasCircularBorder: true,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
