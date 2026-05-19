import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app_colors.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const Center(
                  child: Text(
                    'Check Your Email',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                const Center(
                  child: Text(
                    'We have sent the reset password to the email address brandonelouis@gmial.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(height: 45),

                Center(
                  child: SvgPicture.asset(
                    'assets/images/forgot_password.svg',
                    width: 135,
                    height: 105,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 62),

                PrimaryButton(
                  text: 'OPEN YOUR EMAIL',
                  onPressed: () {
                    Navigator.pushNamed(context, '/successful');
                  },
                ),

                const SizedBox(height: 22),

                SecondaryButton(
                  text: 'BACK TO LOGIN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You don't have an account yet? ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.orange,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}