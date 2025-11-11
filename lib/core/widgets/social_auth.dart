import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuth extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color? color;
  final Color textColor;
  const SocialAuth({
    super.key,
    required this.text,
    required this.imagePath,
    this.color,
    this.textColor = const Color(0XFF858383),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color(0XFFDEDEDE)),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$imagePath.svg',
              fit: BoxFit.scaleDown,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 12.0),
            Text(
              'Sign in with $text',
              style: AppTextStyles.regular16.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
