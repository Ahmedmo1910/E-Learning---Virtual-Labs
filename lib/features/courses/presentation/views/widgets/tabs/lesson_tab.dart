import 'package:e_learning/features/courses/presentation/views/widgets/lesson_tile.dart';
import 'package:flutter/material.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        LessonTile(lessonNumber: "Lesson 1", title: "intro to course"),
        LessonTile(
          lessonNumber: "Lesson 2",
          title: "dart",
          subLessons: [
            "dart variables and data types",
            "conditions and control flow",
          ],
        ),
        LessonTile(
          lessonNumber: "Lesson 3",
          title: "Creating Your First Project in Figma",
        ),
        LessonTile(
          lessonNumber: "Lesson 4",
          title: "Working with Layers and Groups in Figma",
        ),
      ],
    );
  }
}

