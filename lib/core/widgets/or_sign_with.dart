import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrSignWith extends StatelessWidget {
  final String text;
  const OrSignWith({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDEDEDE), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or Sign $text With',
            style: AppTextStyles.regular14.copyWith(color: Color(0xFF858383)),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFFDEDEDE), thickness: 1)),
      ],
    );
  }
}
