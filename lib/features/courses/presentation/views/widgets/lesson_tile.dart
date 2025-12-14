import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final String lessonNumber;
  final String title;
  final List<String>? subLessons;

  const LessonTile({
    super.key,
    required this.lessonNumber,
    required this.title,
    this.subLessons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Color(0xFFF9F9F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      child: ExpansionTile(
        iconColor: AppColors.primaryColor,
        collapsedIconColor: AppColors.primaryColor,
        title: Text("$lessonNumber\n$title", style: AppTextStyles.semiBold14),
        children: subLessons != null
            ? subLessons!
                  .map(
                    (item) => ListTile(
                      dense: true,
                      leading: IconButton(
                        icon: Icon(Icons.play_circle_outline),
                        onPressed: () {},
                      ),
                      title: Text(item, style: AppTextStyles.medium14),
                    ),
                  )
                  .toList()
            : [
                Text(
                    S.of(context).courseComingSoon,
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
      ),
    );
  }
}
