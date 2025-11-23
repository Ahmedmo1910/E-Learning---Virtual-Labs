import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/search_field.dart';
import 'package:e_learning/features/home/presentation/views/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppBarInHomeScreen extends StatelessWidget {
  const AppBarInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, Color(0xff96e1c0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(50),
            const UserInfo(),
            const Gap(25),
            const SearchField(),
          ],
        ),
      ),
    );
  }
}
