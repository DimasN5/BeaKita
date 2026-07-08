import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(vertical: 18),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}