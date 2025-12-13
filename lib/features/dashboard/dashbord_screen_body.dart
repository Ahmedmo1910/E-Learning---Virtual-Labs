import 'package:e_learning/features/dashboard/widgets/built_info_card_widget.dart';
import 'package:e_learning/features/dashboard/widgets/custom_container.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbordScreenBody extends StatelessWidget {
  const DashbordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
        title: const Text(
          "Student Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
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
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }

          if (state is GetDashboard) {
            final data = state.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomContainer(title: "Your Dashboard Summary"),
                    ),
                    SizedBox(height: 20),
                    BuiltInfoCardWidget.buildInfoCard(
                      title: "Classroom",
                      value: "${data['classroom'] ?? ''}",
                      icon: Icons.class_,
                      color: Colors.blue,
                    ),
                    BuiltInfoCardWidget.buildInfoCard(
                      title: "Stage",
                      value: data['stage'] ?? '',
                      icon: Icons.flag_outlined,
                      color: Colors.deepPurple,
                    ),
                    BuiltInfoCardWidget.buildInfoCard(
                      title: "Grade Summary",
                      value: data['gradesummary'] ?? '',
                      icon: Icons.grade,
                      color: Colors.orange,
                    ),
                    BuiltInfoCardWidget.buildInfoCard(
                      title: "Year",
                      value: data['year'].toString(),
                      icon: Icons.calendar_month,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}