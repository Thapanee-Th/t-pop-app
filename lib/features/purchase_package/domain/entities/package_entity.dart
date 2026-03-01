// lib/features/purchase_package/domain/entities/package_entity.dart

import 'package:equatable/equatable.dart';

enum PackageDuration {weekly ,monthly, yearly }

enum PackageTier { basic, pro, premium }

class PackageEntity extends Equatable {
  final String id;
  final String nameEn;
  final String nameTh;
  final String descriptionEn;
  final String descriptionTh;
  final double price;
  final String currency;
  final PackageDuration duration;
  final PackageTier tier;
  final List<PackageFeatureEntity> features;
  final bool isBestValue;
  final String? badgeLabelEn;
  final String? badgeLabelTh;

  const PackageEntity({
    required this.id,
    required this.nameEn,
    required this.nameTh,
    required this.descriptionEn,
    required this.descriptionTh,
    required this.price,
    required this.currency,
    required this.duration,
    required this.tier,
    required this.features,
    this.isBestValue = false,
    this.badgeLabelEn,
    this.badgeLabelTh,
  });

  String nameByLocale(String locale) => locale == 'th' ? nameTh : nameEn;
  String descriptionByLocale(String locale) => locale == 'th' ? descriptionTh : descriptionEn;
  String? badgeByLocale(String locale) => locale == 'th' ? badgeLabelTh : badgeLabelEn;

  String get formattedPrice {
    if (currency == 'THB') {
      return '฿${price.toStringAsFixed(0)}';
    }
    return '\$${price.toStringAsFixed(2)}';
  }

  @override
  List<Object?> get props => [id, nameEn, price, duration, tier];
}

class PackageFeatureEntity extends Equatable {
  final String descriptionEn;
  final String descriptionTh;
  final bool isIncluded;
  final String? icon;

  const PackageFeatureEntity({
    required this.descriptionEn,
    required this.descriptionTh,
    this.isIncluded = true,
    this.icon,
  });

  String descriptionByLocale(String locale) =>
      locale == 'th' ? descriptionTh : descriptionEn;

  @override
  List<Object?> get props => [descriptionEn, descriptionTh];
}
