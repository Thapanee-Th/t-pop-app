// lib/features/purchase_package/presentation/pages/purchase_package_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/widgets/language_toggle_button.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/providers/purchase_provider.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/widgets/dialog_widget.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/widgets/package_list.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../providers/package_provider.dart';
import '../widgets/package_card.dart';
import '../widgets/package_skeleton.dart';

class PurchasePackagePage extends ConsumerWidget {
  const PurchasePackagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(packagesProvider);
    // final purchaseState = ref.watch(purchaseProvider);
    final locale = ref.watch(localeProvider).languageCode;

    // Handle purchase success
    ref.listen(purchaseProvider, (prev, next) {
      if (next is PurchaseSuccess) {
        _showSuccessDialog(context, ref, l10n);
      } else if (next is PurchaseError) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(next.message),
        //     backgroundColor: AppColors.error,
        //   ),
        // );
        _showErrorDialog(context, ref, l10n,next.message );
        ref.read(purchaseProvider.notifier).reset();
      }
    });

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = MediaQuery.sizeOf(context).width> 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          'assets/images/logo-black.png',
          height: 30,
          fit: BoxFit.contain,
        ),
       
        actions: [
          LanguageToggleButton(locale: locale),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(packagesProvider.notifier).fetchPackages();
        },
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: _PageHeader(
                title: l10n.selectPackage,
                subtitle: switch (state) {
                  PackagesLoaded(:final packages) => l10n.packageDescription(packages.length),
                  _ => l10n.packageDescription('X'),
                },
              ),
            ),
            // Content
            SliverPadding(
            padding: EdgeInsets.only(
                left: isTablet ? 24 : 0,
                right: isTablet ? 24 : 0,
                bottom: 32,
              ),
              sliver: switch (state) {
                PackagesLoading() =>  SliverToBoxAdapter(
                    child: PackageList(width: screenWidth, children: List.generate(3, (_) => const PackageCardSkeleton()),),
                  ),
                PackagesError(:final message) => SliverFillRemaining(
                    child: _ErrorState(
                      message: message,
                      l10n: l10n,
                      onRetry: () =>
                          ref.read(packagesProvider.notifier).fetchPackages(),
                    ),
                  ),
                PackagesLoaded(:final packages) when packages.isEmpty =>
                  SliverFillRemaining(
                    child: _EmptyState(l10n: l10n),
                  ),
                PackagesLoaded(:final packages) 
              
                  =>  SliverToBoxAdapter(
                        child: 
                        PackageList(width: screenWidth, children: packages.map((package) {
                            return PackageCard(
                              package: package,
                              onBuyPressed: () => showConfirmDialog(
                                  context, ref, l10n, locale, package.id,
                                  packageName: package.nameByLocale(locale),
                                  price: package.formattedPrice),
                            );
                          }).toList(),)
                      ),
                _ => const SliverToBoxAdapter(child: SizedBox()),
              },
            ),
          ],
        ),
      ),
    );
  }
  void _showSuccessDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: AppColors.greenGradient),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.purchaseSuccess,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
               
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.purchaseSuccessDesc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
           
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                ref.read(purchaseProvider.notifier).reset();
              },
              child: Text(l10n.close),
            ),
          ),
        ],
      ),
    );
  }

    void _showErrorDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    String errorMessage
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: AppColors.redGradient),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.purchaseError,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
               
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
           
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                ref.read(purchaseProvider.notifier).reset();
              },
              child: Text(l10n.close),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Supporting Widgets ───────────────────────────────────────────────────────

class _PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PageHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final AppLocalizations l10n;
  final VoidCallback onRetry;

  const _ErrorState({
    required this.message,
    required this.l10n,
    required this.onRetry,
  });

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
                color: AppColors.error.withAlpha(30),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.error_outline,
                  color: AppColors.error, size: 40),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.errorOccurred,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final AppLocalizations l10n;
  const _EmptyState({required this.l10n});

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

