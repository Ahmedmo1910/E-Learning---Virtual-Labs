import 'package:e_learning/core/utils/app_text_styles.dart';
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(0),
      ),
      child: ExpansionTile(
        title: Text("$lessonNumber\n$title", style: AppTextStyles.bold16),
        children: subLessons != null
            ? subLessons!
                  .map(
                    (item) => ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.play_circle_outline),
                        onPressed: () {},
                      ),
                      title: Text(item),
                    ),
                  )
                  .toList()
            : [
                Text(
                  'This course will be available soon',
                  style: AppTextStyles.medium18,
                ),
              ],
      ),
    );
  }
}
