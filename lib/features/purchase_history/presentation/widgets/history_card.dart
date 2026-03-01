// lib/features/purchase_history/presentation/widgets/history_card.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/purchase_history_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';

class HistoryCard extends StatelessWidget {
  final PurchaseHistoryEntity history;
  final String locale;

  const HistoryCard({super.key, required this.history, required this.locale});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isActive = history.isActive;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? AppColors.success.withAlpha(70)
              : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: (isActive ? AppColors.success : Colors.grey)
                .withAlpha(10),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Package Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isActive
                          ? AppColors.primaryGradient
                          : [Colors.grey.shade300, Colors.grey.shade400],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isActive ? Icons.card_membership : Icons.card_membership_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),

                // Package Name & Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.packageNameByLocale(locale),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        history.formattedAmount,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Status Badge
                _StatusBadge(
                  isActive: isActive,
                  label: isActive ? l10n.active : l10n.expired,
                ),
              ],
            ),
          ),

          // Divider
          Divider(color: Colors.grey.shade100, height: 1),

          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _DetailRow(
                  label: l10n.purchaseDate,
                  value: _formatDate(history.purchaseDate, locale),
                  icon: Icons.calendar_today_outlined,
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  label: l10n.expiryDate,
                  value: _formatDate(history.expiryDate, locale),
                  icon: Icons.event_outlined,
                  valueColor: isActive && history.daysRemaining <= 7
                      ? AppColors.warning
                      : null,
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  label: l10n.paymentMethod,
                  value: _paymentMethodLabel(history.paymentMethod, l10n,
                      history.lastFourDigits),
                  icon: _paymentIcon(history.paymentMethod),
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  label: l10n.orderId,
                  value: history.orderId,
                  icon: Icons.receipt_outlined,
                ),
              ],
            ),
          ),

          // Days remaining badge (active only)
          if (isActive && history.daysRemaining > 0)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.success.withAlpha(10),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  l10n.daysRemaining(history.daysRemaining),
                  style: const TextStyle(
                    color: AppColors.success,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
 
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date, String locale) {
    if (locale == 'th') {
      // Thai Buddhist calendar year
      final buddhistYear = date.year + 543;
      // final formatter = DateFormat('d MMMM', 'en');
      final thaiMonths = [
        'มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน',
        'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม',
      ];
      return '${date.day} ${thaiMonths[date.month - 1]} $buddhistYear';
    }
    return DateFormat('d MMM yyyy, HH:mm').format(date);
  }

  String _paymentMethodLabel(
    PaymentMethod method,
    AppLocalizations l10n,
    String? lastFour,
  ) {
    switch (method) {
      case PaymentMethod.creditCard:
        return lastFour != null
            ? '${l10n.creditCard} •••• $lastFour'
            : l10n.creditCard;
      case PaymentMethod.applePay:
        return l10n.applePay;
      case PaymentMethod.googlePay:
        return l10n.googlePay;
      case PaymentMethod.promptPay:
        return l10n.promptPay;
      default:
        return '-';
    }
  }

  IconData _paymentIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.creditCard:
        return Icons.credit_card;
      case PaymentMethod.applePay:
        return Icons.phone_iphone;
      case PaymentMethod.googlePay:
        return Icons.phone_android;
      case PaymentMethod.promptPay:
        return Icons.qr_code;
      default:
        return Icons.payment;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isActive;
  final String label;

  const _StatusBadge({required this.isActive, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.success.withAlpha(30)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? AppColors.success.withAlpha(70) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.success : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.textLight),
          const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
          ],
        ),
        
        
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: valueColor ?? AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
