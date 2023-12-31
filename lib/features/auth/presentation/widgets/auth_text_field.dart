import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isLableText;
  final String labelText;
  final bool isObscure;
  final TextInputType textInputType;
  final int maxLines;
  final bool isHintColor;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  // ignore: prefer_typing_uninitialized_variables
  final onChange;
  const AuthTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.validator,
      required this.suffixIcon,
      this.isHintColor = false,
      this.onChange,
      this.isObscure = false,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      this.labelText = '',
      this.isLableText = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: AppColors.primaryDark,
      validator: validator,
      obscureText: isObscure,
      maxLines: maxLines,
      onChanged: onChange,
      style: const TextStyle(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.normal,
        fontFamily: 'Montserrat',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        labelText: isLableText ? labelText : null,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.primaryLight,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
