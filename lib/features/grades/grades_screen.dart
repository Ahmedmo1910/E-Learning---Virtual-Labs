import 'package:flutter/material.dart';
import 'cubit/grades_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/features/grades/grades_screen_body.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});
  static const routeName = 'gradesScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GradesCubit()..getGrades(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'All Grades'),
        body: GradesScreenBody(),
      ),
    );
  }
}
