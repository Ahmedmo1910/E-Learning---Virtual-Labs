import 'package:e_learning/features/dashboard/widgets/built_info_card_widget.dart';
import 'package:e_learning/features/dashboard/widgets/custom_container.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class GradesScreenBody extends StatelessWidget {
  const GradesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "My Grades",
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

          if (state is GetGrades) {
            final grades = state.data;

            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: grades.length,

                itemBuilder: (context, i) {
                  final grade = grades[i];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomContainer(title: 'Grade Summary'),
                      ),
                      Gap(20),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "teacher",
                        value: grade['teacher'] ?? "teacher",
                        icon: Icons.person_2_outlined,
                        color: Colors.blueAccent,
                      ),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "Subject",
                        value: grade['subject'] ?? "Subject",
                        icon: Icons.play_lesson_sharp,
                        color: Colors.teal,
                      ),

                      BuiltInfoCardWidget.buildInfoCard(
                        title: "grade value",
                        value: "${grade['gradevalue']}",
                        icon: Icons.my_library_books,
                        color: Colors.yellow,
                      ),
                      BuiltInfoCardWidget.buildInfoCard(
                        title: "grade type",
                        value: "${grade['gradetype']}",
                        icon: Icons.my_library_books,
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
