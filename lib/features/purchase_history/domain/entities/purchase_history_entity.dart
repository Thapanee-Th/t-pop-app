// lib/features/purchase_history/domain/entities/purchase_history_entity.dart

import 'package:equatable/equatable.dart';

enum SubscriptionStatus { active, expired, cancelled }

enum PaymentMethod { creditCard, applePay, googlePay, promptPay, unknown }

class PurchaseHistoryEntity extends Equatable {
  final String id;
  final String orderId;
  final String nameEn;
  final String nameTh;
  final String descriptionEn;
  final String descriptionTh;
  final double amount;
  final String currency;
  final DateTime purchaseDate;
  final DateTime startDate;
  final DateTime expiryDate;
  final SubscriptionStatus status;
  final PaymentMethod paymentMethod;
  final String? lastFourDigits;

  const PurchaseHistoryEntity({
    required this.id,
    required this.orderId,
    required this.nameEn,
    required this.nameTh,
    required this.descriptionEn,
    required this.descriptionTh,
    required this.amount,
    required this.currency,
    required this.purchaseDate,
    required this.startDate,
    required this.expiryDate,
    required this.status,
    required this.paymentMethod,
    this.lastFourDigits,
  });

  bool get isActive => status == SubscriptionStatus.active;

  int get daysRemaining {
    if (!isActive) return 0;
    final diff = expiryDate.difference(DateTime.now()).inDays;
    return diff < 0 ? 0 : diff;
  }

  String packageNameByLocale(String locale) =>
      locale == 'th' ? nameTh : nameEn;

  String get formattedAmount {
    if (currency == 'THB') return '฿${amount.toStringAsFixed(0)}';
    return '\$${amount.toStringAsFixed(2)}';
  }

  @override
  List<Object?> get props => [id, orderId, purchaseDate];
}
