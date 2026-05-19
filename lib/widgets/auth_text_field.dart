import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final double letterSpacing;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.letterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textPrimary,
            letterSpacing: letterSpacing,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBackground,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.hintText,
              fontSize: 13,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 19,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}