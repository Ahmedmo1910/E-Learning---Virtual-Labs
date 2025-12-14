import 'package:flutter/material.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseInfo extends StatelessWidget {
  final String subject, lessonTitle;
  const CourseInfo({
    super.key,
    required this.subject,
    required this.lessonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subject, style: AppTextStyles.bold20),
              SizedBox(height: 3),
              Text(
                lessonTitle,
                style: AppTextStyles.regular14.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 7),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 25.0,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Color(0xFFFDCC0D)),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
