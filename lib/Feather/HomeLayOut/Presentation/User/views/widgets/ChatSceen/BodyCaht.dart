import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/ChatSceen/ChatDeatiles.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

chatItemas(
  BuildContext context,
) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatDeatiles(),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(AssetsData.testImage),
                radius: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "Ahmed Mohmed",
                style: Styles.textStyle18,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
