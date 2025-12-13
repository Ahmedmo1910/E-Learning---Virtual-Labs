import 'package:e_learning/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/profile_cubit/profile_cubit.dart';
import 'widgets/edit_profile_screen_bloc_consumer.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static const String routeName = 'editProfile';

  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
      create: (context) => ProfileCubit()..loadInitialProfile(profile),
      child: Scaffold(
        appBar: customAppBar(context, title: "Edit Profile"),
        body: EditProfileScreenBlocConsumer(profile: profile),
      ),
    );
  }
}
