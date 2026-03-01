// lib/features/purchase_package/domain/repositories/package_repository.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/package_entity.dart';

abstract class PackageRepository {
  Future<Either<Failure, List<PackageEntity>>> getPackages();
  Future<Either<Failure, bool>> purchasePackage(String packageId);
}
