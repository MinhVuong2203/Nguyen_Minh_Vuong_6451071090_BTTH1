import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app_colors.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    'Forgot Password?',
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
                    'To reset your password, you need your email or mobile\n'
                        'number that can be authenticated',
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

                const AuthTextField(
                  label: 'Email',
                  hintText: 'Brandonelouis@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 28),

                PrimaryButton(
                  text: 'RESET PASSWORD',
                  onPressed: () {
                    Navigator.pushNamed(context, '/check-email');
                  },
                ),

                const SizedBox(height: 22),

                SecondaryButton(
                  text: 'BACK TO LOGIN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}