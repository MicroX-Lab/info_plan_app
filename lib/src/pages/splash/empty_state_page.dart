import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';
import '../../routes.dart';
import '../../widgets/primary_button.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.inbox_outlined, size: 96, color: AppColors.textSecondary),
                const SizedBox(height: 32),
                const Text(
                  '先添加你的内容来源',
                  style: AppTextStyle.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  '从小红书、公众号或自定义来源导入内容,开始你的信息管理之旅',
                  style: AppTextStyle.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: '添加内容来源',
                  prefixIcon: Icons.add,
                  onPressed: () => context.goNamed(AppRoute.import.name),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

