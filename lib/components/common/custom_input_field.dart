import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isDense;
  final bool obscureText;
  final bool suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomInputField({
    required this.labelText,
    required this.hintText,
    this.isDense = false,
    this.obscureText = false,
    this.suffixIcon = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          isDense: isDense,
          suffixIcon: suffixIcon ? Icon(Icons.visibility_off) : null,
        ),
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
