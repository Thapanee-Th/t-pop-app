// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseHistoryModel _$PurchaseHistoryModelFromJson(
        Map<String, dynamic> json) =>
    PurchaseHistoryModel(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      nameEn: json['name_en'] as String,
      nameTh: json['name_th'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionTh: json['description_th'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      purchaseDate: json['purchase_date'] as String,
      startDate: json['start_date'] as String,
      expiryDate: json['expiry_date'] as String,
      status: json['status'] as String,
      paymentMethod: json['payment_method'] as String,
      lastFourDigits: json['last_four_digits'] as String?,
    );

Map<String, dynamic> _$PurchaseHistoryModelToJson(
        PurchaseHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'name_en': instance.nameEn,
      'name_th': instance.nameTh,
      'description_en': instance.descriptionEn,
      'description_th': instance.descriptionTh,
      'amount': instance.amount,
      'currency': instance.currency,
      'purchase_date': instance.purchaseDate,
      'start_date': instance.startDate,
      'expiry_date': instance.expiryDate,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
      'last_four_digits': instance.lastFourDigits,
    };
