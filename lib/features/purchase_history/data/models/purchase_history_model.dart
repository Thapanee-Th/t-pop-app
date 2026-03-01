// lib/features/purchase_history/data/models/purchase_history_model.dart

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/purchase_history_entity.dart';

part 'purchase_history_model.g.dart';

@JsonSerializable()
class PurchaseHistoryModel {
  final String id;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'name_th')
  final String nameTh;
  @JsonKey(name: 'description_en')
  final String descriptionEn;
  @JsonKey(name: 'description_th')
  final String descriptionTh;
  final double amount;
  final String currency;
  @JsonKey(name: 'purchase_date')
  final String purchaseDate;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'expiry_date')
  final String expiryDate;
  final String status;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'last_four_digits')
  final String? lastFourDigits;

  const PurchaseHistoryModel({
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

  factory PurchaseHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseHistoryModelToJson(this);

  PurchaseHistoryEntity toEntity() => PurchaseHistoryEntity(
        id: id,
        orderId: orderId,
        nameEn: nameEn,
        nameTh: nameTh,
        descriptionEn: descriptionEn,
        descriptionTh: descriptionTh,
        amount: amount,
        currency: currency,
        purchaseDate: DateTime.parse(purchaseDate),
        startDate: DateTime.parse(startDate),
        expiryDate: DateTime.parse(expiryDate),
        status: _statusFromString(status),
        paymentMethod: _paymentFromString(paymentMethod),
        lastFourDigits: lastFourDigits,
      );

  SubscriptionStatus _statusFromString(String value) {
    switch (value) {
      case 'active':
        return SubscriptionStatus.active;
      case 'expired':
        return SubscriptionStatus.expired;
      case 'cancelled':
        return SubscriptionStatus.cancelled;
      default:
        return SubscriptionStatus.expired;
    }
  }

  PaymentMethod _paymentFromString(String value) {
    switch (value) {
      case 'credit_card':
        return PaymentMethod.creditCard;
      case 'apple_pay':
        return PaymentMethod.applePay;
      case 'google_pay':
        return PaymentMethod.googlePay;
      case 'prompt_pay':
        return PaymentMethod.promptPay;
      default:
        return PaymentMethod.unknown;
    }
  }
}
