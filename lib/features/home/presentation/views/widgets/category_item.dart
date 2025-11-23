import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.itemName,
    this.icon,
    this.onTap,
  });
  final String itemName;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
              ),
              child: Icon(icon, size: 40, color: AppColors.primaryColor),
            ),

            const Gap(5),

            customTextMe(
              text: itemName,
              color: AppColors.primaryColor,
              size: 11,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
