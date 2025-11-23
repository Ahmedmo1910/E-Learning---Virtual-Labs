import 'package:e_learning/features/home/presentation/views/data/courses_data.dart';
import 'package:e_learning/features/home/presentation/views/widgets/course-card.dart';
import 'package:flutter/material.dart';

class ListViewOfCourses extends StatelessWidget {
  const ListViewOfCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: CourseCard(
              imageUrl: courses[index].imageUrl,
              title: courses[index].title,
              subtitle: courses[index].subtitle,
              rating: courses[index].rating,
              ratingCount: courses[index].ratingCount,
              price: courses[index].price,
            ),
          );
        },
      ),
    );
  }
}
