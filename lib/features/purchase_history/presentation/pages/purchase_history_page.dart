// lib/features/purchase_history/presentation/pages/purchase_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/widgets/empty_state.dart';
import 'package:flutter_subscription_app/core/widgets/error_state.dart';
import 'package:flutter_subscription_app/features/purchase_history/presentation/widgets/history_content.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../providers/history_provider.dart';
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
          HistoryError(:final message) => ErrorState(
              message: message,
              l10n: l10n,
              onRetry: () =>
                  ref.read(historyProvider.notifier).fetchHistory(),
            ),
          HistoryLoaded(:final activeItems, :final expiredItems)
              when activeItems.isEmpty && expiredItems.isEmpty =>
            EmptyState(l10n: l10n),
          HistoryLoaded(:final activeItems, :final expiredItems) =>
            HistoryContent(
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