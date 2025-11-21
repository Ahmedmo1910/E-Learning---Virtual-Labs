import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/courses/presentation/views/widgets/star_custom_widget.dart';
import 'package:flutter/material.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timer, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Text("70 Hours", style: AppTextStyles.regular14),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.emoji_events_outlined, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Text("Completion Certificate", style: AppTextStyles.regular14),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.bar_chart, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Text("Beginner", style: AppTextStyles.regular14),
            ],
          ),
          SizedBox(height: 20),
          Text("Description", style: AppTextStyles.bold18),
          SizedBox(height: 8),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Quisque drasut frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet...",
            style: AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
          ),
          SizedBox(height: 20),
          Text(
            "Instructor",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: Icon(
              Icons.person,
              size: 40,
              color: AppColors.primaryColor,
            ),
            title: Text("William Robert", style: AppTextStyles.semiBold14),
            subtitle: Text(
              "Figma Certified",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: StarCustomWidget(starCount: 3),
          ),
        ],
      ),
    );
  }
}
