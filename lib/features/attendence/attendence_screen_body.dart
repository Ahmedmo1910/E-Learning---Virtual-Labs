import 'package:e_learning/features/dashboard/widgets/built_info_card_widget.dart' show BuiltInfoCardWidget;
import 'package:e_learning/features/dashboard/widgets/custom_container.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AttendenceScreenBody extends StatelessWidget {
  const AttendenceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "My Attendance",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.teal.shade600,
        centerTitle: true,
        elevation: 0,
      ),

      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is StudentFailure) {
            return Center(
              child: Text(
                state.errorMsg,
                style: const TextStyle(color: Colors.red, fontSize: 22),
              ),
            );
          }

          if (state is GetAttendance) {
            final attendanceList = state.data;

            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: attendanceList.length,

                itemBuilder: (context, i) {
                  final attendence = attendanceList[i];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomContainer(title: 'Attendance Summary'),
                      ),
                      Gap(20),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "teacher",
                        value: attendence['teacher'] ?? "teacher",
                        icon: Icons.person_2_outlined,
                        color: Colors.blueAccent,
                      ),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "Subject",
                        value: attendence['subject'] ?? "Subject",
                        icon: Icons.play_lesson_sharp,
                        color: Colors.teal,
                      ),

                      BuiltInfoCardWidget.buildInfoCard(
                        title: "classroom",
                        value: "${attendence['classroom']}",
                        icon: Icons.my_library_books,
                        color: Colors.yellow,
                      ),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "State",
                        value: "${attendence['notes']}",
                        icon: Icons.assessment,
                        color: Colors.red,
                      ),
                    ],
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}