import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  final List notifications;
  final BuildContext context;

  const NotificationsList({
    super.key,
    required this.context,
    required this.notifications,
  });

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
        return ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(item),
          
        );
      },
    );
  }
}
