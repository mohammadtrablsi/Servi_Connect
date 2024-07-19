import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.preIcon,
      this.vaildator,
      required this.obscureText,
      required this.suffixIcon,
      required this.suffixIconOnPressed,
      this.maxLines,
      this.minLines});
  final TextEditingController? controller;
  final String label;
  final preIcon;
  final String? Function(String?)? vaildator;
  final bool obscureText;
  final suffixIcon;
  final void Function()? suffixIconOnPressed;
  int? maxLines = 1;
  int? minLines = 1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      minLines: minLines,
      maxLines: maxLines,

      controller: controller,
      obscureText: obscureText == null ? false : obscureText!,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(preIcon), // Replace with your desired icon
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(20.sp), // Adjust border radius as needed
          borderSide: const BorderSide(color: Colors.grey),
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixIconOnPressed,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: const BorderSide(color: kPrimaryColor), // Cursor color
        ),
      ),
      validator: vaildator,
      cursorColor: kPrimaryColor, // Cursor color
    );
  }
}
