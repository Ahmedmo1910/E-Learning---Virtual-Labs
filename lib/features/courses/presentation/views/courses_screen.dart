import 'package:e_learning/features/courses/presentation/cubit/lessons_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'courses_screen_body.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit()..getLessons(),
      child: Column(
        children: [
          Expanded(child: CoursesScreenBody()),
        ],
      ),
    );
  }
}
