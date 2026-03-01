// lib/features/purchase_history/data/repositories/history_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/purchase_history_entity.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_package_datasource.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryPackageDataSource packageDataSource;

  HistoryRepositoryImpl(this.packageDataSource);

  @override
  Future<Either<Failure, List<PurchaseHistoryEntity>>> getPurchaseHistory() async {
    try {
      final models = await packageDataSource.getPurchaseHistory();
      return Right(models.map((m) => m.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepositoryImpl(ref.read(historyPackageDataSourceProvider));
});
