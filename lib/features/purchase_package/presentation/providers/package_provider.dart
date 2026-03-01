// lib/features/purchase_package/presentation/providers/package_provider.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/package_repository_impl.dart';
import '../../domain/entities/package_entity.dart';
import '../../domain/usecases/get_packages_usecase.dart';
import '../../domain/usecases/purchase_package_usecase.dart';

// ─── Packages State ───────────────────────────────────────────────────────────

sealed class PackagesState {
  const PackagesState();
}

class PackagesInitial extends PackagesState {
  const PackagesInitial();
}

class PackagesLoading extends PackagesState {
  const PackagesLoading();
}

class PackagesLoaded extends PackagesState {
  final List<PackageEntity> packages;
  const PackagesLoaded(this.packages);
}

class PackagesError extends PackagesState {
  final String message;
  const PackagesError(this.message);
}

// ─── Purchase State ───────────────────────────────────────────────────────────

sealed class PurchaseState {
  const PurchaseState();
}

class PurchaseIdle extends PurchaseState {
  const PurchaseIdle();
}

class PurchaseLoading extends PurchaseState {
  final String packageId;
  const PurchaseLoading(this.packageId);
}

class PurchaseSuccess extends PurchaseState {
  final String packageId;
  const PurchaseSuccess(this.packageId);
}

class PurchaseError extends PurchaseState {
  final String message;
  const PurchaseError(this.message);
}

// ─── Packages Notifier ────────────────────────────────────────────────────────

class PackagesNotifier extends Notifier<PackagesState> {
  @override
  PackagesState build() {
    fetchPackages();
    return const PackagesLoading();
  }

  Future<void> fetchPackages() async {
    state = const PackagesLoading();

    final useCase = GetPackagesUseCase(ref.read(packageRepositoryProvider));
    final result = await useCase();

    // Random outcome: 70% success, 10% empty, 20% error
    final roll = Random().nextInt(100);
    debugPrint('roll $roll');
    if (roll < 70) {
      result.fold(
        (failure) => state = PackagesError(failure.message),
        (packages) => state = PackagesLoaded(packages),
      );
    } else if (roll < 80) {
      state = const PackagesLoaded([]);
    } else {
      state = const PackagesError('Simulated random error');
    }
  }
}

final packagesProvider = NotifierProvider<PackagesNotifier, PackagesState>(
  PackagesNotifier.new,
);


