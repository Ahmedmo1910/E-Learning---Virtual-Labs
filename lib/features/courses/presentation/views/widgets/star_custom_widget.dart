import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarCustomWidget extends StatelessWidget {
  double starCount = 0;
  StarCustomWidget({super.key, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: starCount,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) {},
    );
  }
}
