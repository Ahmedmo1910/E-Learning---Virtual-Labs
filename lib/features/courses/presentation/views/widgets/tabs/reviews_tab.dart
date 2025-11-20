import 'package:e_learning/features/courses/presentation/views/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        ReviewCard(
          imgPath: 'assets/images/instructor.jpg',
          name: "Name Here",
          role: "Student",
          review:
              "Lorem ipsum dolor sit amet consectetur. Quisque frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet.",
        ),
        SizedBox(height: 10),
        ReviewCard(
          imgPath: 'assets/images/instructor.jpg',
          name: "Name Here",
          role: "Student",
          review:
              "Lorem ipsum dolor sit amet consectetur. Quisque frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet.",
        ),
      ],
    );
  }
}
