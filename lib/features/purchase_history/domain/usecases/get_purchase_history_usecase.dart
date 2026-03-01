// lib/features/purchase_history/domain/usecases/get_purchase_history_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/purchase_history_entity.dart';
import '../repositories/history_repository.dart';

class GetPurchaseHistoryUseCase {
  final HistoryRepository repository;

  const GetPurchaseHistoryUseCase(this.repository);

  Future<Either<Failure, List<PurchaseHistoryEntity>>> call() {
    return repository.getPurchaseHistory();
  }
}
