import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/courses/presentation/views/course_display_screen.dart';
import 'package:flutter/material.dart';

import 'custom_progress_bar.dart';

class CourseWidget extends StatelessWidget {
  final String imageUrl;
  final String courseName;
  final String instructorName;

  const CourseWidget({
    super.key,
    required this.imageUrl,
    required this.courseName,
    required this.instructorName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CourseDisplayScreen.routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    imageUrl,
                    height: MediaQuery.of(context).size.height * 0.135,
                    width: MediaQuery.of(context).size.width * 0.28,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(courseName, style: AppTextStyles.semiBold14),
                      const SizedBox(height: 4),
                      Text(
                        instructorName,
                        style: AppTextStyles.regular12.copyWith(
                          color: Colors.black38,
                        ),
                      ),
                      Spacer(),
                      CustomProgressBar(progress: 0.7),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
