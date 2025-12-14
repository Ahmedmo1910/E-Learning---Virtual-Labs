import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/features/home/presentation/views/widgets/custom_text_me.dart';
import 'package:e_learning/features/home/presentation/views/widgets/notification_list.dart';
import 'package:e_learning/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:popover/popover.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        final profileChanged = previous.profile != current.profile;
        final notificationsChanged =
            previous.notifications != current.notifications;
        return profileChanged || notificationsChanged;
      },
      builder: (context, state) {
        String name = 'Student';
        List notifications = state.notifications ?? [];

        if (state.profile != null && state.profile!['fullname'] != null) {
          name = state.profile!['fullname'] as String;
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.darkPrimaryColor,
              // backgroundImage: AssetImage('assets/images/MyPhoto.jpg'),
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextMe(
                  text: S.of(context).greeting(name),
                  size: 18,
                  weight: FontWeight.bold,
                ),
                customTextMe(
                  text:S.of(context).welcomeMessage,
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
                    bodyBuilder: (context) =>
                        NotificationsList(notifications: notifications),
                    direction: PopoverDirection.bottom,
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.3,
                    arrowHeight: 20,
                    arrowWidth: 25,
                    arrowDxOffset: MediaQuery.of(context).size.width * 0.42,
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
