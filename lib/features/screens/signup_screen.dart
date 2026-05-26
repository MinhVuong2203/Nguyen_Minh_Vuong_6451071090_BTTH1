import 'package:flutter/material.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/controller/auth_controller.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/core/constants/app_colors.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/auth_text_field.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/google_login_button.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/primary_button.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/remember_forgot_row.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  bool isRemember = false;
  bool isPasswordHidden = true;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerWithEmail(AuthController controller) async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Vui long nhap day du ho ten, email va mat khau.');
      return;
    }

    final isSuccess = await controller.registerWithEmail(
      fullName: fullName,
      email: email,
      password: password,
    );

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, '/profile', (_) => false);
    } else {
      _showMessage(controller.errorMessage ?? 'Dang ky that bai.');
    }
  }

  Future<void> _loginWithGoogle(AuthController controller) async {
    final isSuccess = await controller.loginWithGoogle();

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(context, '/profile', (_) => false);
    } else {
      _showMessage(controller.errorMessage ?? 'Dang nhap Google that bai.');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

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

                AuthTextField(
                  label: 'Full name',
                  hintText: 'Brandone Louis',
                  controller: fullNameController,
                  textInputAction: TextInputAction.next,
                ),

                AuthTextField(
                  label: 'Email',
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 22),

                AuthTextField(
                  label: 'Password',
                  hintText: 'Password',
                  obscureText: isPasswordHidden,
                  letterSpacing: 3,
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
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
                  text: 'REGISTER',
                  isLoading: authController.isLoading,
                  onPressed: authController.isLoading
                      ? null
                      : () =>
                          _registerWithEmail(context.read<AuthController>()),
                ),

                const SizedBox(height: 22),

                GoogleLoginButton(
                  text: 'SIGN UP WITH GOOGLE',
                  isLoading: authController.isLoading,
                  onPressed: authController.isLoading
                      ? null
                      : () => _loginWithGoogle(context.read<AuthController>()),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
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
