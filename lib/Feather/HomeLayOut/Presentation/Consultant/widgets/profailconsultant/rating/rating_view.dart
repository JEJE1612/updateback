import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rate_item.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';

class RatingView extends StatelessWidget {
  final List<RatingModel> allRating;

  const RatingView({super.key, required this.allRating});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: allRating.length,
            itemBuilder: (context, index) => RateItem(
              rate: allRating[index],
            ),
          ),
        ],
      ),
    );
  }
}
