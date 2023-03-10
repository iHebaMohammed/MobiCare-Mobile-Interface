import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {

  TextEditingController controller;
  TextInputType keyboardType;
  Function(String value) ? onSubmit;
  String? Function( String ? value) validation;
  Function(String value) ? onChange;
  String fieldName;
  IconData ? prefixIcon;
  IconData ? suffixIcon;
  Function() ? onPressedSuffixIcon;
  bool obscureText = false;
  Function() ? onTap;
  int ? maxLines = 1;
  int ? minLines;
  bool isClickable = true;
  double ? redius = 0;

  DefaultTextFormField({
    required this.controller,
    required this.keyboardType,
    this.onSubmit,
    required this.validation,
    this.onChange,
    required this.fieldName,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffixIcon,
    this.obscureText = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.isClickable = true,
    this.redius = 0,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      enabled: isClickable,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      validator: validation,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: fieldName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(redius!),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: onPressedSuffixIcon,
          icon: Icon(
            suffixIcon,
          ),
        ),
      ),
    );
  }
}


Widget defaultTextFormField
    ({
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function(String value) ? onSubmit,
  required String? Function( String ? value) validation,
  Function(String value) ? onChange,
  required String fieldName,
  IconData ? prefixIcon,
  IconData ? suffixIcon,
  Function() ? onPressedSuffixIcon,
  bool obscureText = false,
  Function() ? onTap,
  int ? maxLines = 1,
  int ? minLines,
  bool isClickable = true,
  double ? redius = 0,
}){
  return TextFormField(
    onTap: onTap,
    enabled: isClickable,
    minLines: minLines,
    maxLines: maxLines,
    obscureText: obscureText,
    controller: controller,
    keyboardType: keyboardType,
    onFieldSubmitted: onSubmit,
    validator: validation,
    onChanged: onChange,
    decoration: InputDecoration(
      labelText: fieldName,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(redius!),
      ),
      prefixIcon: Icon(
        prefixIcon,
      ),
      suffixIcon: IconButton(
        onPressed: onPressedSuffixIcon,
        icon: Icon(
          suffixIcon,
        ),
      ),
    ),
  );
}