import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LineUpListView extends StatelessWidget {
  const LineUpListView({super.key, required this.listName, this.onTap});
  final String listName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextMe(
          text: listName,
          weight: FontWeight.bold,
          color: Colors.black,
          size: 17,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: customTextMe(
            text: 'See All',
            weight: FontWeight.w400,
            color: AppColors.primaryColor,
            size: 17,
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
