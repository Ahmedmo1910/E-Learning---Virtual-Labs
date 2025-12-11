import 'package:e_learning/features/attendence/attendence_screen_body.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<AttendenceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().getAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return AttendenceScreenBody();
  }
}
