
import 'package:e_learning/features/grades/grades_screen_body.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().getGrades();
  }

  @override
  Widget build(BuildContext context) {
    return GradesScreenBody();
  }
}
