import 'package:e_learning/features/home/presentation/views/widgets/course-card.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewOfCourses extends StatefulWidget {
  const ListViewOfCourses({super.key});

  @override
  State<ListViewOfCourses> createState() => _ListViewOfCoursesState();
}

class _ListViewOfCoursesState extends State<ListViewOfCourses> {
  @override
  void initState() {
    context.read<StudentCubit>().getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List imageUrl = [
      'https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg',
      'https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg',
      'https://images.pexels.com/photos/1181359/pexels-photo-1181359.jpeg',
    ];
    return SizedBox(
      height: 240,
      child: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is StudentFailure) {
            return Center(
              child: Text(
                state.errorMsg,
                style: const TextStyle(color: Colors.red, fontSize: 22),
              ),
            );
          }

          if (state is GetLessons) {
            final lessons = state.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lessons.length,
              itemBuilder: (context, i) {
                final lesson = lessons[i];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 10),
                  child: CourseCard(
                    imageUrl: imageUrl[i % imageUrl.length],

                    title: lesson['lessontitle'] ?? '',
                    subtitle: lesson['description'] ?? '',
                    rating: 4.5,
                    ratingCount: '100',
                    subject: lesson['subject'] ?? "",
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
