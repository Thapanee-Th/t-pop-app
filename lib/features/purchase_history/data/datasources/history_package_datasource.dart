// lib/features/purchase_history/data/datasources/history_remote_datasource.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../models/purchase_history_model.dart';

abstract class HistoryPackageDataSource {
  Future<List<PurchaseHistoryModel>> getPurchaseHistory();
}

class HistoryPackageDataSourceImpl implements HistoryPackageDataSource {
  final DioClient dioClient;

  HistoryPackageDataSourceImpl(this.dioClient);

  @override
  Future<List<PurchaseHistoryModel>> getPurchaseHistory() async {
    await Future.delayed(const Duration(seconds: 2));
    //TODO
    // Replace with actual API:
    // final response = await dioClient.dio.get('/user/purchases');
    // return (response.data['data'] as List).map((e) => PurchaseHistoryModel.fromJson(e)).toList();

    return _mockHistory;
  } 

  static final _mockHistory = [
    PurchaseHistoryModel(
      id: 'hist_001',
      orderId: 'ORD-2024-001234',
      nameEn: 'STAR',
      nameTh: 'T-POP STAR',
       descriptionEn: 'T-POP STAR Package for 4 weeks',
      descriptionTh: 'T-POP STAR แพ็กเกจราย 4 สัปดาห์',
      amount: 299,
      currency: 'THB',
      purchaseDate: DateTime.now()
          .toIso8601String(),
      startDate: DateTime.now()
          .toIso8601String(),
      expiryDate: DateTime.now()
          .add(const Duration(days: 28))
          .toIso8601String(),
      status: 'active',
      paymentMethod: 'credit_card',
      lastFourDigits: '4242',
    ),
    PurchaseHistoryModel(
      id: 'hist_002',
      orderId: 'ORD-2024-000987',
    nameEn: 'T-POP LITE',
      nameTh: 'T-POP LITE',
      descriptionEn: 'T-POP LITE Package for 1 week',
      descriptionTh: 'T-POP LITE  แพ็กเกจราย 1 สัปดาห์',
      amount: 99,
      currency: 'THB',
      purchaseDate: DateTime.now()
          .subtract(const Duration(days: 65))
          .toIso8601String(),
      startDate: DateTime.now()
          .subtract(const Duration(days: 65))
          .toIso8601String(),
      expiryDate: DateTime.now()
          .subtract(const Duration(days: 58))
          .toIso8601String(),
      status: 'expired',
      paymentMethod: 'prompt_pay',
      lastFourDigits: null,
    ),
    PurchaseHistoryModel(
      id: 'hist_003',
      orderId: 'ORD-2024-000456',
      nameEn: 'T-POP LITE',
      nameTh: 'T-POP LITE',
      descriptionEn: 'T-POP LITE Package for 1 week',
      descriptionTh: 'T-POP LITE  แพ็กเกจราย 1 สัปดาห์',
      amount: 99,
      currency: 'THB',
      purchaseDate: DateTime.now()
          .subtract(const Duration(days: 125))
          .toIso8601String(),
      startDate: DateTime.now()
          .subtract(const Duration(days: 125))
          .toIso8601String(),
      expiryDate: DateTime.now()
          .subtract(const Duration(days: 118))
          .toIso8601String(),
      status: 'expired',
      paymentMethod: 'apple_pay',
      lastFourDigits: null,
    ),
  ];
}

final historyPackageDataSourceProvider = Provider<HistoryPackageDataSource>(
  (ref) => HistoryPackageDataSourceImpl(ref.read(dioClientProvider)),
);
