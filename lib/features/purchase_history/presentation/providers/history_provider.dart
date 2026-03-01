// lib/features/purchase_history/presentation/providers/history_provider.dart

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/history_repository_impl.dart';
import '../../domain/entities/purchase_history_entity.dart';
import '../../domain/usecases/get_purchase_history_usecase.dart';

// ─── State ────────────────────────────────────────────────────────────────────

sealed class HistoryState {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<PurchaseHistoryEntity> activeItems;
  final List<PurchaseHistoryEntity> expiredItems;

  const HistoryLoaded({
    required this.activeItems,
    required this.expiredItems,
  });

  bool get isEmpty => activeItems.isEmpty && expiredItems.isEmpty;
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
}

// ─── Notifier ─────────────────────────────────────────────────────────────────

class HistoryNotifier extends Notifier<HistoryState> {
  @override
  HistoryState build() {
    fetchHistory();
    return const HistoryLoading();
  }

  Future<void> fetchHistory() async {
    state = const HistoryLoading();

    final useCase =
        GetPurchaseHistoryUseCase(ref.read(historyRepositoryProvider));
    final result = await useCase();

    // Random outcome: 70% success, 10% empty, 20% error
    final roll = Random().nextInt(100);
    if (roll < 70) {
      result.fold(
        (failure) => state = HistoryError(failure.message),
        (items) {
          final active = items
              .where((i) => i.status == SubscriptionStatus.active)
              .toList()
            ..sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
          final expired = items
              .where((i) => i.status != SubscriptionStatus.active)
              .toList()
            ..sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
          state = HistoryLoaded(activeItems: active, expiredItems: expired);
        },
      );
    } else if (roll < 80) {
      state = const HistoryLoaded(
        activeItems: [],
        expiredItems: [],
      );
    } else {
      state = const HistoryError('Simulated random error');
    }
  }
}

final historyProvider = NotifierProvider<HistoryNotifier, HistoryState>(
  HistoryNotifier.new,
);
