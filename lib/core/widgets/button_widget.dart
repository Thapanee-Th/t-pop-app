import 'package:flutter/material.dart';
import 'package:flutter_subscription_app/core/theme/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const ButtonWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
        color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryLight.withAlpha(70),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}