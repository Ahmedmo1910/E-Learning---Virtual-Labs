import 'package:e_learning/features/home/presentation/views/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home_cubit/home_cubit.dart';

class ListViewWatchingCourse extends StatelessWidget {
  const ListViewWatchingCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.schedule != current.schedule,
        builder: (context, state) {
          final schedule = state.schedule ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedule.length,
            itemBuilder: (context, i) {
              final schedule = state.schedule?[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ScheduleCard(
                  subject: schedule['subject'] ?? '',
                  teacher: schedule['teacher'] ?? '',
                  sessionNumber: schedule['sessionnumber'] ?? '',
                  icon: Icons.watch_later_outlined,
                  //classroomId: schedule['classroomid'] ?? '',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
