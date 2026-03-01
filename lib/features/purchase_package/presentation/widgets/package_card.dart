// lib/features/purchase_package/presentation/widgets/package_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/widgets/button_widget.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../domain/entities/package_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';

class PackageCard extends ConsumerWidget {
  final PackageEntity package;
  final VoidCallback onBuyPressed;

  const PackageCard({
    super.key,
    required this.package,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider).languageCode;
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final isTablet = MediaQuery.sizeOf(context).width >= 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(
        horizontal: isTablet ? 0 : 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:   Colors.grey.shade200,
          width:  1,
        ),
        boxShadow: [
          BoxShadow(
            color:  Colors.grey
                .withValues(alpha: 10),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.nameByLocale(locale),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        package.descriptionByLocale(locale),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Price Section
              _buildPriceSection(context, package, locale, l10n),
                
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade100, height: 1),
              const SizedBox(height: 16),
                
              const SizedBox(height: 12),
              ...package.features.map(
                (f) => _FeatureRow(feature: f, locale: locale),
              ),
              ButtonWidget(onTap: onBuyPressed, text:   l10n.buyNow, ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildPriceSection(
    BuildContext context,
    PackageEntity package,
    String locale,
    AppLocalizations l10n,
  ) {
  

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          package.formattedPrice,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final PackageFeatureEntity feature;
  final String locale;

  const _FeatureRow({required this.feature, required this.locale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: feature.isIncluded
                  ? AppColors.primary.withAlpha(30)
                  : AppColors.success.withAlpha(0),
              shape: BoxShape.circle,
            ),
            child: Icon(
             feature.isIncluded ? Icons.check: Icons.close,
              size: 14,
              color: feature.isIncluded ? AppColors.primary : AppColors.success.withAlpha(0),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              feature.descriptionByLocale(locale),
              style: TextStyle(
                fontSize: 14,
                color: feature.isIncluded
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontWeight:
                    feature.isIncluded ? FontWeight.w600 : FontWeight.w400,
        
              ),
            ),
          ),
        ],
      ),
    );
  }
}
