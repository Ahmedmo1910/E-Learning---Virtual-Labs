import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchingCoursesCard extends StatelessWidget {
  const WatchingCoursesCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.completed,
    required this.progress,
  });
  final String imageUrl;
  final String title;
  final String subTitle;
  final String completed;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 260,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bookmark_border,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          const Gap(5),

          customTextMe(
            text: title,
            size: 14,
            weight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),

          const Gap(3),

          customTextMe(text: subTitle, size: 13, color: Colors.grey.shade600),

          const Gap(3),

          Row(
            children: [
              Spacer(),
              customTextMe(
                text: completed,
                size: 9,
                weight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ],
          ),

          const Gap(3),

          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryColor,
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
