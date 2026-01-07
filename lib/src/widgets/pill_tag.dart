import 'package:flutter/material.dart';

import '../config/constants.dart';

class PillTag extends StatelessWidget {
  const PillTag({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
      decoration: BoxDecoration(
        color: color ?? AppColors.tagBackground,
        borderRadius: BorderRadius.circular(AppSpacing.pillRadius),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
      ),
    );
  }
}

