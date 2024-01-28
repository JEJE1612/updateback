import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: primarycolor, borderRadius: BorderRadius.circular(50)),
      child: Text(
        "C",
        textAlign: TextAlign.center,
        style: Styles.textStyle36.copyWith(color: Colors.white),
      ),
    );
  }
}
