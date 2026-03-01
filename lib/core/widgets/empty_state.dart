import 'package:flutter/material.dart';
import 'package:flutter_subscription_app/core/theme/app_theme.dart';

import '../../generated/l10n/app_localizations.dart';


class EmptyState extends StatelessWidget {
  final AppLocalizations l10n;
  const EmptyState({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inbox_outlined,
                  color: AppColors.primary, size: 40),
            ),
            const SizedBox(height: 16),
            Text(l10n.noPackagesAvailable,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(l10n.noPackagesDescription,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

