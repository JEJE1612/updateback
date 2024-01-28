import 'package:flutter/material.dart';

class CustomTextFoemaFaildEditProfail extends StatelessWidget {
  const CustomTextFoemaFaildEditProfail({
    super.key,
    required this.nameController,
    required this.onSaved,
    required this.textCapitalization,
    required this.text,
    required this.hintText,
    required this.prefixIcon,
  });

  final TextEditingController nameController;
  final void Function(String?)? onSaved;
  final TextCapitalization textCapitalization;
  final String text;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      textCapitalization: textCapitalization,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return text;
        }
        return null;
      },
      controller: nameController,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
