import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.icon,
    required this.subject,
    required this.teacher,
    required this.sessionNumber,
  });

  final IconData icon;
  final String subject;
  final String teacher;
  final int sessionNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject, style: AppTextStyles.semiBold14),
          const SizedBox(height: 4),
          Text(
            teacher,
            style: AppTextStyles.medium12.copyWith(color: AppColors.greyColor),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(icon, size: 18, color: AppColors.greyColor),
              const Gap(50),
              Text(
                "Session $sessionNumber",
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
