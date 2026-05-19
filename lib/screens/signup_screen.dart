import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/google_login_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/remember_forgot_row.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  bool isRemember = false;
  bool isPasswordHidden = true;

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
                    'Create an Account',
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
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(height: 62),

                const AuthTextField(
                  label: 'Full name',
                  hintText: 'Brandone Louis',
                  keyboardType: TextInputType.emailAddress,
                ),

                const AuthTextField(
                  label: 'Email',
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 22),

                AuthTextField(
                  label: 'Password',
                  hintText: 'Password',
                  obscureText: isPasswordHidden,
                  letterSpacing: 3,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                      size: 22,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                RememberForgotRow(
                  isRemember: isRemember,
                  onRememberTap: () {
                    setState(() {
                      isRemember = !isRemember;
                    });
                  },
                  onForgotTap: () {
                    Navigator.pushNamed(context, '/forgot-password');
                  },
                ),

                const SizedBox(height: 38),

                PrimaryButton(
                  text: 'LOGIN',
                  onPressed: () {
                    // TODO: xử lý đăng nhập
                  },
                ),

                const SizedBox(height: 22),

                GoogleLoginButton(
                  onPressed: () {
                    // TODO: xử lý đăng nhập Google
                  },
                ),

                const SizedBox(height: 24),

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

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}