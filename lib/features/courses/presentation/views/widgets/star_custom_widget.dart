import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarCustomWidget extends StatelessWidget {
  final double starCount;
  final double itemSize;
  const StarCustomWidget({super.key, this.starCount = 0, this.itemSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: starCount,
      itemSize: itemSize,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(Icons.star, color: Color(0xFFFDCC0D)),
      onRatingUpdate: (rating) {},
    );
  }
}
