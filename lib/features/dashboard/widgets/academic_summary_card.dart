import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AcademicSummaryCard extends StatelessWidget {
  final String classroom;
  final String stage;
  final int year;
  final String gradeSummary;

  const AcademicSummaryCard({
    super.key,
    required this.classroom,
    required this.stage,
    required this.year,
    required this.gradeSummary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Card(
        elevation: 4,
        color: Color(0xFFFAFAFA),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.school, color: AppColors.primaryColor),
                  const SizedBox(width: 8),
                  Text("Academic Summary", style: AppTextStyles.bold18),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _infoTile(
                      icon: Icons.class_,
                      title: "Classroom",
                      value: classroom,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoTile(
                      icon: Icons.layers,
                      title: "Stage",
                      value: stage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _infoTile(
                      icon: Icons.calendar_today,
                      title: "Academic Year",
                      value: year.toString(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoTile(
                      icon: Icons.assessment,
                      title: "Status",
                      value: "Active",
                      valueColor: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        gradeSummary,
                        style: AppTextStyles.medium14.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.greyColor),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppTextStyles.regular12.copyWith(color: AppColors.greyColor),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.medium14.copyWith(
              color: valueColor ?? Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
