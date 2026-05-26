import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/core/constants/app_colors.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/primary_button.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/secondary_button.dart';

class SuccesfulScreen extends StatelessWidget {
  const SuccesfulScreen({super.key});

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
                    'Successfully',
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
                    'Your password has been updated, please change your password regularly to avoid this happening',
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
                    'assets/images/succesful.svg',
                    width: 139,
                    height: 117,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 62),

                PrimaryButton(
                  text: 'CONTINUE',
                  onPressed: () {
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
