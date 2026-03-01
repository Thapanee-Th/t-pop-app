// lib/features/purchase_package/data/models/package_model.dart

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/package_entity.dart';

part 'package_model.g.dart';

@JsonSerializable()
class PackageFeatureModel {
  @JsonKey(name: 'description_en')
  final String descriptionEn;
  @JsonKey(name: 'description_th')
  final String descriptionTh;
  @JsonKey(name: 'is_highlighted')
  final bool isIncluded;
  final String? icon;

  const PackageFeatureModel({
    required this.descriptionEn,
    required this.descriptionTh,
    this.isIncluded = false,
    this.icon,
  });

  factory PackageFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$PackageFeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageFeatureModelToJson(this);

  PackageFeatureEntity toEntity() => PackageFeatureEntity(
        descriptionEn: descriptionEn,
        descriptionTh: descriptionTh,
        isIncluded: isIncluded,
        icon: icon,
      );
}

@JsonSerializable()
class PackageModel {
  final String id;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'name_th')
  final String nameTh;
  @JsonKey(name: 'description_en')
  final String descriptionEn;
  @JsonKey(name: 'description_th')
  final String descriptionTh;
  final double price;
  final String currency;
  final String duration;
  final String tier;
  final List<PackageFeatureModel> features;
  @JsonKey(name: 'badge_label_en')
  final String? badgeLabelEn;
  @JsonKey(name: 'badge_label_th')
  final String? badgeLabelTh;

  const PackageModel({
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
    this.badgeLabelEn,
    this.badgeLabelTh,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);

  PackageEntity toEntity() => PackageEntity(
        id: id,
        nameEn: nameEn,
        nameTh: nameTh,
        descriptionEn: descriptionEn,
        descriptionTh: descriptionTh,
        price: price,
        currency: currency,
        duration: PackageDuration.weekly,
        tier: _tierFromString(tier),
        features: features.map((f) => f.toEntity()).toList(),
        badgeLabelEn: badgeLabelEn,
        badgeLabelTh: badgeLabelTh,
      );

  PackageTier _tierFromString(String value) {
    switch (value) {
      case 'premium':
        return PackageTier.premium;
      case 'pro':
        return PackageTier.pro;
      default:
        return PackageTier.basic;
    }
  }
}
