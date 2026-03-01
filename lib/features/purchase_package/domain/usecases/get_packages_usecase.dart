// lib/features/purchase_package/domain/usecases/get_packages_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/package_entity.dart';
import '../repositories/package_repository.dart';

class GetPackagesUseCase {
  final PackageRepository repository;

  const GetPackagesUseCase(this.repository);

  Future<Either<Failure, List<PackageEntity>>> call() {
    return repository.getPackages();
  }
}
