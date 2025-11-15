import 'package:e_learning/core/utils/app_text_styles.dart';
import 'package:e_learning/features/courses/presentation/views/widgets/star_custom_widget.dart';
import 'package:flutter/material.dart';


class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.timer, color: Colors.indigo),
              SizedBox(width: 8),
              Text("70 Hours"),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.emoji_events_outlined, color: Colors.indigo),
              SizedBox(width: 8),
              Text("Completion Certificate"),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.bar_chart, color: Colors.indigo),
              SizedBox(width: 8),
              Text("Beginner"),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Description",
            style: AppTextStyles.bold18,
          ),
          const SizedBox(height: 8),
          const Text(
            "Lorem ipsum dolor sit amet consectetur. Quisque drasut frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            "Instructor",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/instructor.jpg"), // حط صورة عندك في assets
            ),
            title: const Text("William Robert",style: AppTextStyles.bold16,),
            subtitle: const Text("Figma Certified",style: TextStyle(color: Colors.grey),),
            trailing:  StarCustomWidget(starCount: 3,),
          ),
        ],
      ),
    );
  }
}