// lib/features/purchase_history/domain/repositories/history_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/purchase_history_entity.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<PurchaseHistoryEntity>>> getPurchaseHistory();
}
