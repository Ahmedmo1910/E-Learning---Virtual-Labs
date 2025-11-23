import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'widgets/course_display_screen_body.dart';

class CourseDisplayScreen extends StatelessWidget {
  const CourseDisplayScreen({super.key});

  static const String routeName = ' courseDisplayScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: CourseDisplayScreenBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MainButton(
          hasCircularBorder: true,
          text: "Buy This Course",
          onTap: () {},
        ),
      ),
    );
  }
}
