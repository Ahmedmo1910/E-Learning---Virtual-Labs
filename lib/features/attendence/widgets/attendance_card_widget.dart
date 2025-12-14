import 'package:e_learning/core/helper_functions/format_date.dart';
import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AttendanceCardWidget extends StatelessWidget {
  final String subject;
  final String teacher;
  final String classroom;
  final String date;
  final bool isPresent;
  final String notes;

  const AttendanceCardWidget({
    super.key,
    required this.subject,
    required this.teacher,
    required this.classroom,
    required this.date,
    required this.isPresent,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isPresent ? Colors.green : Colors.red;
    final statusText = isPresent ? "Present" : "Absent";
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subject, style: AppTextStyles.bold16),
                _statusChip(statusText, statusColor),
              ],
            ),

            const SizedBox(height: 10),

            _infoRow(Icons.person, "Teacher", teacher),
            _infoRow(Icons.class_, "Class", classroom),
            _infoRow(
              Icons.calendar_today,
              "Date",
              formatDate(date),
            ),

            if (notes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Divider(color: AppColors.greyColor.withOpacity(0.3)),
              const SizedBox(height: 4),
              _infoRow(Icons.notes, "Notes", notes),
            ],
          ],
        ),
      ),
    );
  }

 
  Widget _statusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.medium14.copyWith(color: color),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.greyColor),
          const SizedBox(width: 6),
          Text(
            "$label: ",
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.medium14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
