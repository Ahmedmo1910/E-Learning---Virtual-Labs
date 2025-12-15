import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../cubit/lessons_cubit.dart';
import 'widgets/course_widget.dart';

class CoursesScreenBody extends StatelessWidget {
  const CoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsCubit, LessonsState>(
      builder: (context, state) {
        if (state is LessonsLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 250,
              width: 250,
            ),
          );
        }

        if (state is LessonsFailure) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(color: Colors.red, fontSize: 22),
            ),
          );
        }

        if (state is LessonsLoaded) {
          final lessons = state.lessons;

          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: lessons.length,

              itemBuilder: (context, i) {
                final lesson = state.lessons;
                final List progress = [0.3, 0.5, 0.7, 0.8, 0.9, 1.0];

                return CourseWidget(
                  i: i,
                  lesson: lesson[i],
                  progress: progress[i],
                  // imageUrl: 'assets/images/history.jpeg',
                  imageUrl: images[i % images.length],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
final List<String> images = [


  'assets/images/science.jpeg',
  'assets/images/cs.jpeg',
  'assets/images/history.jpeg',
  'assets/images/chem.jpeg',
];
