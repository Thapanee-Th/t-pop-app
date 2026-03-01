// lib/features/purchase_history/presentation/pages/purchase_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../providers/history_provider.dart';
import '../widgets/history_card.dart';
import '../widgets/history_skeleton.dart';

class PurchaseHistoryPage extends ConsumerWidget {
  const PurchaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(historyProvider);
    final locale = ref.watch(localeProvider).languageCode;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.purchaseHistory),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () => ref.read(historyProvider.notifier).fetchHistory(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(historyProvider.notifier).fetchHistory();
        },
        child: switch (state) {
          HistoryLoading() => const SingleChildScrollView(
              child: HistoryListSkeleton(),
            ),
          HistoryError(:final message) => _ErrorState(
              message: message,
              l10n: l10n,
              onRetry: () =>
                  ref.read(historyProvider.notifier).fetchHistory(),
            ),
          HistoryLoaded(:final activeItems, :final expiredItems)
              when activeItems.isEmpty && expiredItems.isEmpty =>
            _EmptyState(l10n: l10n),
          HistoryLoaded(:final activeItems, :final expiredItems) =>
            _HistoryContent(
              activeItems: activeItems,
              expiredItems: expiredItems,
              locale: locale,
              l10n: l10n,
            ),
          _ => const SizedBox(),
        },
      ),
    );
  }
}

// ─── Content ──────────────────────────────────────────────────────────────────

class _HistoryContent extends StatelessWidget {
  final List activeItems;
  final List expiredItems;
  final String locale;
  final AppLocalizations l10n;

  const _HistoryContent({
    required this.activeItems,
    required this.expiredItems,
    required this.locale,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Active subscriptions
        if (activeItems.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _SectionHeader(
              title: l10n.activeSubscriptions,
              count: activeItems.length,
              color: AppColors.success,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HistoryCard(
                history: activeItems[index],
                locale: locale,
              ),
              childCount: activeItems.length,
            ),
          ),
        ],

        // Expired subscriptions
        if (expiredItems.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _SectionHeader(
              title: l10n.expiredSubscriptions,
              count: expiredItems.length,
              color: AppColors.textSecondary,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HistoryCard(
                history: expiredItems[index],
                locale: locale,
              ),
              childCount: expiredItems.length,
            ),
          ),
        ],

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Empty / Error ────────────────────────────────────────────────────────────

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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withAlpha(30),
                    AppColors.primaryLight.withAlpha(15),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.history_outlined,
                color: AppColors.primary,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.noHistory,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.noHistoryDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
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
            Text(l10n.errorOccurred,
                style: Theme.of(context).textTheme.titleLarge),
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
