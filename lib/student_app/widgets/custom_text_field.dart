import 'package:flutter/material.dart';

TextFormField Txt(String name, TextEditingController controller,
    {Icon? prefixIcon, IconButton? suffixIcon, bool obscureText = false}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: name,
      labelStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
      prefixIcon: prefixIcon != null ? prefixIcon : null,
      suffixIcon: suffixIcon != null ? suffixIcon : null,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "It can't be empty";
      }
      return null;
    },
  );
}
