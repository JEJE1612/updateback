import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/CustomAppBarCatrois.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/ListOneCiral.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/grid_view_builder.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Catroisbody extends StatelessWidget {
  const Catroisbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomAppBarCatrois(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Hight Reating",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const ListOneCiral(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "All Catroies",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const GridViewBuilder(),
          ]),
        ),
      ),
    );
  }
}
