import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rate_item.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';

class ReatingScreen extends StatelessWidget {
  const ReatingScreen({
    super.key,
    required this.rate,
  });
  final List<RatingModel> rate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: rate.length,
        itemBuilder: (context, index) => RateItem(rate: rate[index]),
      ),
    );
  }
}
