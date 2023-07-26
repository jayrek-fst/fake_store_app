import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRatingWidget extends StatelessWidget {
  final int starCount;
  final dynamic rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;

  const StarRatingWidget({
    super.key,
    this.starCount = 5,
    required this.rating,
    this.onRatingChanged,
    required this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(Icons.star_border, color: Colors.grey.shade300, size: 10,);
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(Icons.star_half, color: color, size: 10,);
    } else {
      icon = Icon(Icons.star, color: color, size: 10,);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Row(
          children: List.generate(
            starCount,
            (index) => buildStar(context, index),
          ),
        ),
      ),
    );
  }
}
