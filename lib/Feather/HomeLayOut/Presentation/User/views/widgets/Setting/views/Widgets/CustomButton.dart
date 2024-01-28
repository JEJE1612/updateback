import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
