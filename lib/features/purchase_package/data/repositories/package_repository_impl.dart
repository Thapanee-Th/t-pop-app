// lib/features/purchase_package/data/repositories/package_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/package_entity.dart';
import '../../domain/repositories/package_repository.dart';
import '../datasources/package_datasource.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageDataSource remoteDataSource;

  PackageRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PackageEntity>>> getPackages() async {
    try {
      final models = await remoteDataSource.getPackages();
      return Right(models.map((m) => m.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> purchasePackage(String packageId) async {
    try {
      final result = await remoteDataSource.purchasePackage(packageId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

final packageRepositoryProvider = Provider<PackageRepository>((ref) {
  return PackageRepositoryImpl(ref.read(packageDataSourceProvider));
});
