import 'package:flutter/material.dart';
import 'package:flutter_subscription_app/core/theme/app_theme.dart';
import 'package:flutter_subscription_app/features/purchase_history/presentation/widgets/history_card.dart';
import 'package:flutter_subscription_app/features/purchase_history/presentation/widgets/section_header.dart';
import 'package:flutter_subscription_app/generated/l10n/app_localizations.dart';

class HistoryContent extends StatelessWidget {
  final List activeItems;
  final List expiredItems;
  final String locale;
  final AppLocalizations l10n;

  const HistoryContent({super.key, 
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
            child: SectionHeader(
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
            child: SectionHeader(
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