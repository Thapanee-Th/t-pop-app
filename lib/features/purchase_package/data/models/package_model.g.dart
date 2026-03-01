// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageFeatureModel _$PackageFeatureModelFromJson(Map<String, dynamic> json) =>
    PackageFeatureModel(
      descriptionEn: json['description_en'] as String,
      descriptionTh: json['description_th'] as String,
      isIncluded: json['is_highlighted'] as bool? ?? false,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$PackageFeatureModelToJson(
        PackageFeatureModel instance) =>
    <String, dynamic>{
      'description_en': instance.descriptionEn,
      'description_th': instance.descriptionTh,
      'is_highlighted': instance.isIncluded,
      'icon': instance.icon,
    };

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
      id: json['id'] as String,
      nameEn: json['name_en'] as String,
      nameTh: json['name_th'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionTh: json['description_th'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      duration: json['duration'] as String,
      tier: json['tier'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => PackageFeatureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      badgeLabelEn: json['badge_label_en'] as String?,
      badgeLabelTh: json['badge_label_th'] as String?,
    );

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_th': instance.nameTh,
      'description_en': instance.descriptionEn,
      'description_th': instance.descriptionTh,
      'price': instance.price,
      'currency': instance.currency,
      'duration': instance.duration,
      'tier': instance.tier,
      'features': instance.features,
      'badge_label_en': instance.badgeLabelEn,
      'badge_label_th': instance.badgeLabelTh,
    };
