import 'package:flutter/material.dart';
import 'course_info.dart';
import 'video_player_widget.dart';

class CourseDisplayScreenBody extends StatelessWidget {
  const CourseDisplayScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [VideoPlayerWidget(), SizedBox(height: 20), CourseInfo()],
    );
  }
}
