  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/theme/app_theme.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/providers/package_provider.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/providers/purchase_provider.dart';
import 'package:flutter_subscription_app/generated/l10n/app_localizations.dart';

void showConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    String locale,
    String packageId, {
    required String packageName,
    required String price,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.confirmPurchase),
        content: Text(
          l10n.confirmPurchaseDesc(packageName, price),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.cancel,
                style: const TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(purchaseProvider.notifier).purchase(packageId);
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }