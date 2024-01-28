import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/Consultant/widgets/home/widgwts/list_all_ask_user.dart';

import 'package:flutter_application_1/core/utils/styles.dart';

class HomeCuslatant extends StatelessWidget {
  const HomeCuslatant({super.key});

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Consultant Me",
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: Size.height * 0.03,
                ),
                // ignore: prefer_const_constructors
                ListAllAskUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
