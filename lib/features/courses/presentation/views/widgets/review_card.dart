import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/courses/presentation/views/widgets/star_custom_widget.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String role;
  final String review;
  final String imgPath;

  const ReviewCard({
    super.key,
    required this.name,
    required this.role,
    required this.review,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(imgPath)),
              title: Text(name, style: AppTextStyles.bold16),
              subtitle: Text(role, style: TextStyle(color: Colors.grey)),
              trailing: StarCustomWidget(starCount: 4),
            ),
            SizedBox(height: 5),
            Text(review, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
