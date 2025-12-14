import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:e_learning/features/dashboard/dashbord_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const routeName = 'DashboardScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()..getDashboard(),
      child: Scaffold(
        appBar: customAppBar(context, title: "Dashboard"),
        body: DashbordScreenBody(),
      ),
    );
  }
}
