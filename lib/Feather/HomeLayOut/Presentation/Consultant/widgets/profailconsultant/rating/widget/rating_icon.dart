import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key, required this.rateValue});
  final double rateValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: rateValue >= 1 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: rateValue >= 2 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: rateValue >= 3 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: rateValue >= 4 ? Color(0xffFFDD4F) : null,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: rateValue == 5 ? Color(0xffFFDD4F) : null,
        ),
      ],
    );
  }
}