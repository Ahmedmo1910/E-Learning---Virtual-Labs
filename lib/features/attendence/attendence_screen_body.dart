import 'package:e_learning/features/attendence/cubit/attendance_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'widgets/attendance_card_widget.dart';

class AttendenceScreenBody extends StatelessWidget {
  const AttendenceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        if (state is StudentLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }

        if (state is AttendanceFailed) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(color: Colors.red, fontSize: 22),
            ),
          );
        }

        if (state is AttendanceLoaded) {
          final attendanceList = state.attendance;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: attendanceList.length,

              itemBuilder: (context, i) {
                final attendance = attendanceList[i];

                return AttendanceCardWidget(
                  subject: attendance['subject'],
                  teacher: attendance['teacher'],
                  classroom: attendance['classroom'],
                  date: attendance['date'],
                  isPresent: attendance['ispresent'],
                  notes: attendance['notes'],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
