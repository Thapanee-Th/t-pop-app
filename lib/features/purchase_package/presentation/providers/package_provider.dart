

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/providers/package_state.dart';
import '../../data/repositories/package_repository_impl.dart';
import '../../domain/usecases/get_packages_usecase.dart';
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


