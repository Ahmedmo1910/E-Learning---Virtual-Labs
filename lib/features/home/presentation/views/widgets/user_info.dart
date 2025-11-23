import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),

        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.darkPrimaryColor,
          //backgroundImage: AssetImage('assets/images/MyPhoto.jpg'),
        ),

        Gap(15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextMe(
              text: 'Hi, Mostafa 👋🏻',
              size: 18,
              weight: FontWeight.bold,
            ),

            customTextMe(
              text: 'Welcome to World of Learning! ',
              size: 14,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ],
        ),

        Spacer(),

        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 255, 252, 252),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
            iconSize: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
