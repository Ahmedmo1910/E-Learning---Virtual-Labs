import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;
  final String ratingCount;
  final String subject;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.ratingCount,
    required this.subject,
  });

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
              // Bookmark
              Positioned(
                right: 8,
                top: 8,
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

              // Price
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "$subject",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
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

          customTextMe(text: subtitle, size: 13, color: Colors.grey.shade600),

          const Gap(3),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 18),
              customTextMe(
                text: " $rating",
                size: 14,
                weight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              customTextMe(
                text: " ($ratingCount K)",
                size: 13,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
