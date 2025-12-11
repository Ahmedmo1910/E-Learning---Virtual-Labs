import 'package:e_learning/features/home/presentation/views/widgets/app-bar-in-home-screen.dart';
import 'package:e_learning/features/home/presentation/views/widgets/list_view_watching_course.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:e_learning/features/home/presentation/views/widgets/line_up_listView.dart';
import 'package:e_learning/features/home/presentation/views/widgets/list_view_category_item.dart';
import 'package:e_learning/features/home/presentation/views/widgets/list_view_courses.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const AppBarInHomeScreen()),
        SliverToBoxAdapter(child: const Gap(15)),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const customTextMe(
                    text: 'Category',
                    weight: FontWeight.bold,
                    color: Colors.black,
                    size: 17,
                  ),
                  const Gap(15),
                  const ListViewOFCategoryItem(),
                  const Gap(15),
                  LineUpListView(listName: 'Top Courses'),
                  const Gap(15),
                  ListViewOfCourses(),
                  const Gap(15),
                  LineUpListView(listName: 'Continue Watching'),
                  const Gap(15),
                  ListViewWatchingCourse(),
                  Gap(20),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
