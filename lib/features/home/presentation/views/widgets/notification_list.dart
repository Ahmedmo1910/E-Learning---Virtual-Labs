import 'package:e_learning/core/utils/app_colors.dart';
import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  final List notifications;

  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text("No Notifications Available"),
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            minVerticalPadding: 0,
            minTileHeight: 63,
            leading: const Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'New Message',
              style: AppTextStyles.small12.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            subtitle: Text(
              item,
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
