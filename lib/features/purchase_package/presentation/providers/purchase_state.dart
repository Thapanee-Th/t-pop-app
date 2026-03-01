// lib/features/purchase_package/presentation/providers/package_provider.dart



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


