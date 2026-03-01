// lib/features/purchase_package/domain/usecases/purchase_package_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/package_repository.dart';

class PurchasePackageUseCase {
  final PackageRepository repository;

  const PurchasePackageUseCase(this.repository);

  Future<Either<Failure, bool>> call(String packageId) {
    return repository.purchasePackage(packageId);
  }
}
