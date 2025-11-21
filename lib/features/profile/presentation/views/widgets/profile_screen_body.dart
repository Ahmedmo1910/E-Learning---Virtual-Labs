import 'package:e_learning/features/profile/presentation/views/widgets/profile_container_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffdfecf5),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ProfileContainerWidget(),
        ]
      ),
    );
  }
}

