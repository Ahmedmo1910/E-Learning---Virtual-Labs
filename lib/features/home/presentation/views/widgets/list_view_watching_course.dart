import 'package:e_learning/features/home/presentation/views/data/watching-course_data.dart';
import 'package:e_learning/features/home/presentation/views/widgets/watching_courses_card.dart';
import 'package:flutter/material.dart';

class ListViewWatchingCourse extends StatelessWidget {
  const ListViewWatchingCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: watchingCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: WatchingCoursesCard(
              imageUrl: watchingCourses[index].imageUrl,
              title: watchingCourses[index].title,
              subTitle: watchingCourses[index].subTitle,
              completed: watchingCourses[index].completed,
              progress: watchingCourses[index].progress,
            ),
          );
        },
      ),
    );
  }
}
