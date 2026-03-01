import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../models/package_model.dart';

abstract class PackageDataSource {
  Future<List<PackageModel>> getPackages();
  Future<bool> purchasePackage(String packageId);
}

class PackageDataSourceImpl implements PackageDataSource {
  final DioClient dioClient;

  PackageDataSourceImpl(this.dioClient);

  @override
  Future<List<PackageModel>> getPackages() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock data — replace with actual API call:
    // final response = await dioClient.dio.get('/packages');
    // return (response.data['data'] as List).map((e) => PackageModel.fromJson(e)).toList();

    return _mockPackages;
  }

  @override
  Future<bool> purchasePackage(String packageId) async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO:
    // Mock success — replace with:
    // final response = await dioClient.dio.post('/purchases', data: {'package_id': packageId});
    // return response.data['success'] == true;
    final roll = Random().nextInt(100);
    if (roll < 70) {
      return true;
    } else {
      return false;
    }
   
  }

  static final _mockPackages = [
    const PackageModel(
      id: 'tpop_lite',
      nameEn: 'T-POP LITE',
      nameTh: 'T-POP LITE',
      descriptionEn: 'T-POP LITE Package for 1 week',
      descriptionTh: 'T-POP LITE  แพ็กเกจราย 1 สัปดาห์',
      price: 99,
      currency: 'THB',
      duration: 'weekly',
      tier: 'tpop_lite',
       features: [
        PackageFeatureModel(
          descriptionEn: 'Receive bonus coins',
          descriptionTh: 'รับเหรียญโบนัสพิเศษ',
          isIncluded: true,
          icon: 'storage',
        ),
         PackageFeatureModel(
          descriptionEn: 'Unlock daily voting limit.',
          descriptionTh: 'ปลดล็อกลิมิตโหวตประจำวัน',
          isIncluded: true,
          icon: 'storage',
        ),
         PackageFeatureModel(
          descriptionEn: 'Free frame and decoration.',
          descriptionTh: 'กรอบรูปและของตกแต่งสุดพิเศษ',
          isIncluded: true,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Eligibility to purchase Boost Vote packages.',
          descriptionTh: 'สิทธิ์ซื้อแพ็คเกจ Boost Vote',
          isIncluded: true,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Receive double rewards for completing missions X2',
          descriptionTh: 'รับรางวัลจากการทำภารกิจ X2',
          isIncluded: false,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Skip the task of watching ads.',
          descriptionTh: 'ข้ามภารกิจดูโฆษณา',
          isIncluded: false,
          icon: 'storage',
        ),
      ],
     
    ),
    const PackageModel(
      id: 'tpop_star',
      nameEn: 'T-POP STAR',
      nameTh: 'T-POP STAR',
      descriptionEn: 'T-POP STAR Package for 4 weeks',
      descriptionTh: 'T-POP STAR แพ็กเกจราย 4 สัปดาห์',
      price: 299,
      currency: 'THB',
      duration: 'monthly',
      tier: 'premiem',
      badgeLabelEn: 'Most Popular',
      badgeLabelTh: 'ยอดนิยม',
     features: [
         PackageFeatureModel(
          descriptionEn: 'Receive bonus coins',
          descriptionTh: 'รับเหรียญโบนัสพิเศษ',
          isIncluded: true,
          icon: 'storage',
        ),
         PackageFeatureModel(
          descriptionEn: 'Unlock daily voting limit.',
          descriptionTh: 'ปลดล็อกลิมิตโหวตประจำวัน',
          isIncluded: true,
          icon: 'storage',
        ),
         PackageFeatureModel(
          descriptionEn: 'Free frame and decoration.',
          descriptionTh: 'กรอบรูปและของตกแต่งสุดพิเศษ',
          isIncluded: true,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Eligibility to purchase Boost Vote packages.',
          descriptionTh: 'สิทธิ์ซื้อแพ็คเกจ Boost Vote',
          isIncluded: true,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Receive double rewards for completing missions X2',
          descriptionTh: 'รับรางวัลจากการทำภารกิจ X2',
          isIncluded: true,
          icon: 'storage',
        ),
        PackageFeatureModel(
          descriptionEn: 'Skip the task of watching ads.',
          descriptionTh: 'ข้ามภารกิจดูโฆษณา',
          isIncluded: true,
          icon: 'storage',
        ),
      ],
    ),
   
  ];
}

final packageDataSourceProvider = Provider<PackageDataSource>((ref) {
  return PackageDataSourceImpl(ref.read(dioClientProvider));
});
