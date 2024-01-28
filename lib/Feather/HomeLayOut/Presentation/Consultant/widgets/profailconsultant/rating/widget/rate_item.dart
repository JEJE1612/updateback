import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/edit_rating.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rate_describetion.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rater_image.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/profailconsultant/rating/widget/rating_icon.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';

class RateItem extends StatelessWidget {
  const RateItem({super.key, required this.rate});
  final RatingModel rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 20.0,
      //color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RaterImage(image: rate.image),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              rate.userName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              rate.date.year.toString() +
                                  "/" +
                                  rate.date.month.toString() +
                                  "/" +
                                  rate.date.day.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: SizedBox()),
                        RatingIcon(rateValue: rate.rateValue),
                      ],
                    ),
                  ],
                ),
              ),
              EditRate(
                rate: rate,
              )
            ],
          ),
          RateDescribetion(
            describe: rate.describe,
          )
        ],
      ),
    );
  }
}
