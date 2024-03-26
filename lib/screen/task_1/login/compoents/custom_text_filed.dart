import 'package:flutter/material.dart';

class CustomTextformFiledWidget extends StatelessWidget {
  const CustomTextformFiledWidget(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      required this.obText});
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.2))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.2))),
        hintText: hintText,
      ),
    );
  }
}
