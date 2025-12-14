import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../cubits/home_cubit/home_cubit.dart';
import 'app-bar-in-home-screen.dart';
import 'line_up_listView.dart';
import 'list_view_courses.dart';
import 'list_view_watching_course.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getAllData(refresh: true),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AppBarInHomeScreen()),
          SliverToBoxAdapter(child: const Gap(15)),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(30),
                    LineUpListView(listName: S.of(context).allSubjects),
                    const Gap(15),
                    ListViewOfCourses(),
                    const Gap(15),
                    LineUpListView(listName: S.of(context).mySchedule),
                    const Gap(15),
                    ListViewWatchingCourse(),
                    Gap(20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
