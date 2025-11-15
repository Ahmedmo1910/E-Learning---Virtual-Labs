import 'package:e_learning/features/courses/presentation/views/widgets/tabs/lesson_tab.dart';
import 'package:e_learning/features/courses/presentation/views/widgets/tabs/overview_tab.dart';
import 'package:e_learning/features/courses/presentation/views/widgets/tabs/reviews_tab.dart';
import 'package:flutter/material.dart';
import 'course_info.dart';
import 'video_player_widget.dart';

class CourseDisplayScreenBody extends StatelessWidget {
  const CourseDisplayScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          VideoPlayerWidget(),
          SizedBox(height: 20),
          CourseInfo(),
          const TabBar(
            labelColor: Colors.indigo,
            // unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.indigo,
            tabs: [
              Tab(text: "Overview"),
              Tab(text: "Lessons"),
              Tab(text: "Reviews"),
            ],
          ),

          Expanded(
            child: const TabBarView(
              children: [OverviewTab(), LessonsTab(), ReviewsTab()],
            ),
          ),
        ],
      ),
    );
  }
}
