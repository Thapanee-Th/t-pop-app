// lib/core/widgets/main_scaffold.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../../generated/l10n/app_localizations.dart';

class MainScaffold extends ConsumerWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final location = GoRouterState.of(context).uri.path;

    int currentIndex = 0;
    if (location.startsWith('/history')) currentIndex = 1;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryLight.withValues(alpha: 20),
        onDestinationSelected: (index) {
          if (index == 0) context.go('/packages');
          if (index == 1) context.go('/history');
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.card_membership_outlined),
            selectedIcon: const Icon(Icons.card_membership),
            label: l10n.purchasePackage,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: const Icon(Icons.history),
            label: l10n.purchaseHistory,
          ),
        ],
      ),
    );
  }
}
