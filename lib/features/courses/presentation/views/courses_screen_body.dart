import 'package:flutter/material.dart';
import 'widgets/course_widget.dart';

class CoursesScreenBody extends StatelessWidget {
  const CoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 60),
      CourseWidget(
        imageUrl: 'assets/images/figma.png',
        courseName: 'Introduction to Figma',
        instructorName: 'by John Doe',
      ),
    ]);
  }
}
