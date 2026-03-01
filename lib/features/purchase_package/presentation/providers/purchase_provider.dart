import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/features/purchase_package/data/repositories/package_repository_impl.dart';
import 'package:flutter_subscription_app/features/purchase_package/domain/usecases/purchase_package_usecase.dart';
import 'package:flutter_subscription_app/features/purchase_package/presentation/providers/purchase_state.dart';

class PurchaseNotifier extends Notifier<PurchaseState> {
  @override
  PurchaseState build() => const PurchaseIdle();

  Future<void> purchase(String packageId) async {
    state = PurchaseLoading(packageId);

    final useCase = PurchasePackageUseCase(ref.read(packageRepositoryProvider));
    final result = await useCase(packageId);

    result.fold(
      (failure) => state = PurchaseError(failure.message),
      (_) => state = PurchaseSuccess(packageId),
    );
  }

  void reset() => state = const PurchaseIdle();
}

final purchaseProvider = NotifierProvider<PurchaseNotifier, PurchaseState>(
  PurchaseNotifier.new,
);
