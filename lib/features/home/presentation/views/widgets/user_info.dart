import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:e_learning/features/home/presentation/views/widgets/notification_list.dart';
import 'package:e_learning/features/students/data/cubit/student_cubit.dart';
import 'package:e_learning/features/students/data/cubit/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:popover/popover.dart';

class UserInfo extends StatelessWidget {
  // final BuildContext context;
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        String name = 'Student';
        List notifications = [];
        if (state is GetProfile) {
          final data = state.data;
          name = data['fullname'];
        }
        if (state is GetNotifications) {
          notifications = state.data;
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.darkPrimaryColor,
              //backgroundImage: AssetImage('assets/images/MyPhoto.jpg'),
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextMe(
                  text: 'Hi, $name 👋🏻',
                  size: 18,
                  weight: FontWeight.bold,
                ),

                // Fallback widget for other states
                customTextMe(
                  text: 'Welcome to World of Learning! ',
                  size: 14,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(60, 255, 252, 252),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  showPopover(
                    context: context,
                    transitionDuration: const Duration(milliseconds: 150),
                    bodyBuilder: (context) => NotificationsList(
                      notifications: notifications,
                      context: context,
                    ),
                    direction: PopoverDirection.bottom,
                    width: 260,
                    height: 300,
                    arrowHeight: 10,
                    arrowWidth: 20,
                  );
                },
                icon: const Icon(Icons.notifications_none_rounded),
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
