import 'package:flutter/material.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/core/constants/app_colors.dart';

class RememberForgotRow extends StatelessWidget {
  final bool isRemember;
  final VoidCallback onRememberTap;
  final VoidCallback onForgotTap;

  const RememberForgotRow({
    super.key,
    required this.isRemember,
    required this.onRememberTap,
    required this.onForgotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onRememberTap,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isRemember
                  ? AppColors.primary
                  : AppColors.checkboxInactive,
              borderRadius: BorderRadius.circular(5),
            ),
            child: isRemember
                ? const Icon(
              Icons.check,
              color: AppColors.white,
              size: 16,
            )
                : null,
          ),
        ),

        const SizedBox(width: 14),

        const Text(
          'Remember me',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.hintText,
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: onForgotTap,
          child: const Text(
            'Forgot Password ?',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
