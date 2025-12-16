import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'attendence_screen_body.dart';
import 'cubit/attendance_cubit.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceCubit()..getAttendance(),
      child: Scaffold(
        appBar: customAppBar(context, title: S.current.attendance),
        body: AttendenceScreenBody(),
      ),
    );
  }
}
