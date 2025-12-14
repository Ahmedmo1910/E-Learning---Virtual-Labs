import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import 'profile_screen_body_bloc_consumer.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(refresh: true),
      child: Container(
        color: const Color(0xffdfecf5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const ProfileScreenBodyBlocConsumer()],
        ),
      ),
    );
  }
}
