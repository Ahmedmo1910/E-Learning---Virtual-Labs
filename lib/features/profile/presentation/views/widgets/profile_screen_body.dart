import 'package:e_learning/core/widgets/custom_bottom_navigation.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/profile_container_widget.dart';
import 'package:e_learning/features/profile/presentation/views/widgets/profile_header_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdfecf5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              ProfileHeaderWidget(),
              // Profile Container
              ProfileContainerWidget(),
            ],
          ),
        ),
      ),
      //navigation bar
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

