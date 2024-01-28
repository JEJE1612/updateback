import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: primarycolor,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
        ),
      ),
    );
  }
}
