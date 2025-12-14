import 'package:e_learning/features/home/presentation/views/widgets/course-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home_cubit/home_cubit.dart';

class ListViewOfCourses extends StatelessWidget {
  const ListViewOfCourses({super.key});

  @override
  Widget build(BuildContext context) {
    List imageUrl = [
      'https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg',
      'https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg',
      'https://images.pexels.com/photos/1181359/pexels-photo-1181359.jpeg',
    ];
    return SizedBox(
      height: 240,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.lessons != current.lessons,
        builder: (context, state) {
          final lessons = state.lessons ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lessons.length ,
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
        },
      ),
    );
  }
}
