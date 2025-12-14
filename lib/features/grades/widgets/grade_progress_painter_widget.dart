import 'package:e_learning/core/helper_functions/format_date.dart';
import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'circle_progress_painter.dart';

class GradeProgressPainterWidget extends StatefulWidget {
  final String subject;
  final String teacher;
  final double gradeValue;
  final String gradeType;
  final String dateRecorded;

  const GradeProgressPainterWidget({
    super.key,
    required this.subject,
    required this.teacher,
    required this.gradeValue,
    required this.gradeType,
    required this.dateRecorded,
  });

  @override
  State<GradeProgressPainterWidget> createState() => _GradeProgressCardState();
}

class _GradeProgressCardState extends State<GradeProgressPainterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.gradeValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return CustomPaint(
                  painter: CircleProgressPainter(_animation.value),
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${_animation.value.toStringAsFixed(1)}%",
                          style: AppTextStyles.bold16,
                        ),
                        Text(
                          'Overall',
                          style: AppTextStyles.regular12.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.subject, style: AppTextStyles.bold16),
                  const SizedBox(height: 8),
                  _infoRow(Icons.person, "Teacher", widget.teacher),
                  _infoRow(Icons.assignment, "Type", widget.gradeType),
                  _infoRow(
                    Icons.calendar_today,
                    "Date",
                    formatDate(widget.dateRecorded),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            style: AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.medium14.copyWith(
                overflow: TextOverflow.ellipsis,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

