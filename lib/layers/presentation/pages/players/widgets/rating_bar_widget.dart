import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

class RatingBarWidget extends StatelessWidget {
  final double rating;

  const RatingBarWidget({
    Key? key,
    this.rating = 0.0,
  })  : assert(rating >= 0.0 && rating <= 100.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int ratingCount = (rating / 20.0).round();

    return SizedBox(
      height: 10,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, index) {
          bool isActive = index + 1 <= ratingCount;

          return Container(
            width: 3,
            height: 9,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.secondary
                  : kBlankColor,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        },
      ),
    );
  }
}
