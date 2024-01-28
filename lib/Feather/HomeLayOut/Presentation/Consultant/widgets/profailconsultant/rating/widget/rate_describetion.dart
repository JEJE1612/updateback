import 'package:flutter/material.dart';

class RateDescribetion extends StatelessWidget {
  const RateDescribetion({super.key, required this.describe});
  final String describe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          describe,
          style: TextStyle(
            fontSize: 14,
            height: 1.2,
            textBaseline: TextBaseline.ideographic,
          ),
        ),
      ),
    );
  }
}