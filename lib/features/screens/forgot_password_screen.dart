import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/controller/auth_controller.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/core/constants/app_colors.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/auth_text_field.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/primary_button.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/secondary_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword(AuthController controller) async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      _showMessage('Vui long nhap email.');
      return;
    }

    final isSuccess = await controller.resetPassword(email);

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamed(context, '/check-email');
    } else {
      _showMessage(controller.errorMessage ?? 'Gui email that bai.');
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

                AuthTextField(
                  label: 'Email',
                  hintText: 'Brandonelouis@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                ),

                const SizedBox(height: 28),

                PrimaryButton(
                  text: 'RESET PASSWORD',
                  isLoading: authController.isLoading,
                  onPressed: authController.isLoading
                      ? null
                      : () => _resetPassword(context.read<AuthController>()),
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
