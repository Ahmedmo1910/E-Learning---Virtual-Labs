import 'package:e_learning/features/grades/cubit/grades_cubit.dart';
import 'package:e_learning/features/grades/widgets/grade_progress_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class GradesScreenBody extends StatelessWidget {
  const GradesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradesCubit, GradesState>(
      builder: (context, state) {
        if (state is GradesLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 250,
              width: 250,
            ),
          );
        }

        if (state is GradesFailed) {
          return Center(
            child: Text(
              state.errorMsg,
              style: const TextStyle(color: Colors.red, fontSize: 22),
            ),
          );
        }

        if (state is GradesLoaded) {
          final grades = state.grades;

          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: grades.length,

              itemBuilder: (context, i) {
                final grade = grades[i];

                return GradeProgressPainterWidget(
                  gradeValue: grade['gradevalue'],
                  subject: grade['subject'],
                  gradeType: grade['gradetype'],
                  dateRecorded: grade['daterecorded'],
                  teacher: grade['teacher'],
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
