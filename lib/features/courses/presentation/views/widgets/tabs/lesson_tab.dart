import 'package:e_learning/features/courses/presentation/views/widgets/lesson_tile.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children:  [
        LessonTile(lessonNumber: S.of(context).lesson1, title: S.of(context).introToCourse),
        LessonTile(
          lessonNumber: S.of(context).lesson2,
          title: S.of(context).dart,
          subLessons: [
            S.of(context).dartVariables,
            S.of(context).conditions,
          ],
        ),
        LessonTile(
          lessonNumber: S.of(context).lesson3,
          title:S.of(context).firstProjectFigma,
        ),
        LessonTile(
          lessonNumber:  S.of(context).lesson4,
          title: S.of(context).workingLayersFigma,
        ),
      ],
    );
  }
}

