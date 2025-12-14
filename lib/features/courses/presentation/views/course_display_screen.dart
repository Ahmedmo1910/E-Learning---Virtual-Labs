import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/features/courses/data/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'widgets/course_display_screen_body.dart';

class CourseDisplayScreen extends StatelessWidget {
  const CourseDisplayScreen({super.key});

  static const String routeName = ' courseDisplayScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final LessonModel lesson = args['lesson'];
    final int index = args['index'];

    return Scaffold(
      appBar: customAppBar(context, title: lesson.subject),
      body: CourseDisplayScreenBody(lesson: lesson, index: index),
    );
  }
}
