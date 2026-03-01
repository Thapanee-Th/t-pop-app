import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/providers/locale_provider.dart';
import 'package:flutter_subscription_app/core/theme/app_theme.dart';

class LanguageToggleButton extends ConsumerWidget {
  final String locale;
  const LanguageToggleButton({super.key, required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(localeProvider.notifier).toggleLocale(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(Icons.language, color:  AppColors.primary,),
            Text(
              locale == 'en' ? 'ภาษาไทย' : 'English',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}