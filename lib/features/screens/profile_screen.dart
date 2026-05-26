import 'package:flutter/material.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/controller/auth_controller.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/core/constants/app_colors.dart';
import 'package:nguyen_minh_vuong_6451071090_btth1/features/widgets/secondary_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    final user = authController.currentUser;
    final photoUrl = user?.photoUrl;
    final hasPhoto = photoUrl != null && photoUrl.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Center(
                child: Text(
                  'Thông tin tài khoản',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 34),
              Center(
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: AppColors.checkboxInactive,
                  backgroundImage: hasPhoto ? NetworkImage(photoUrl!) : null,
                  child: hasPhoto
                      ? null
                      : const Icon(
                          Icons.person,
                          size: 58,
                          color: AppColors.primary,
                        ),
                ),
              ),
              const SizedBox(height: 38),
             
              _InfoRow(
                label: 'Họ tên',
                value: user?.displayName?.isNotEmpty == true
                    ? user!.displayName!
                    : 'Chưa cập nhật',
              ),
              _InfoRow(
                label: 'Email',
                value: user?.email?.isNotEmpty == true
                    ? user!.email!
                    : 'Chưa cập nhật',
              ),
              _InfoRow(
                label: 'Ảnh đại diện',
                value: user?.photoUrl?.isNotEmpty == true
                    ? user!.photoUrl!
                    : 'Chưa cập nhật',
              ),
              const SizedBox(height: 18),
              SecondaryButton(
                text: 'LOG OUT',
                onPressed: () async {
                  await context.read<AuthController>().logout();
                  if (!context.mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (_) => false,
                  );
                },
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
