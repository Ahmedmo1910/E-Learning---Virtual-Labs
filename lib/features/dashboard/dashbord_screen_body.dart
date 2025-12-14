import 'package:e_learning/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'widgets/academic_summary_card.dart';

class DashbordScreenBody extends StatelessWidget {
  const DashbordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 250,
              width: 250,
            ),
          );
        }

        if (state is DashboardFailed) {
          return Center(
            child: Text(
              state.errorMsg,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }

        if (state is DashboardLoaded) {
          final data = state.dashboardData;
          return Center(
            child: AcademicSummaryCard(
              classroom: data['classroom'],
              stage: data['stage'],
              year: data['year'],
              gradeSummary: data['gradesummary'],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
