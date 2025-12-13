import 'package:e_learning/features/dashboard/dashbord_screen_body.dart';

import 'package:e_learning/features/students/data/cubit/student_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentCubit>().getDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return DashbordScreenBody();
  }
}
