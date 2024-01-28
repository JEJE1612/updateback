import 'package:flutter/material.dart';

class CreateRatingButton extends StatelessWidget {
  const CreateRatingButton(
      {super.key, required this.onPressed, required this.buttonName});
  final VoidCallback onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey,
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
