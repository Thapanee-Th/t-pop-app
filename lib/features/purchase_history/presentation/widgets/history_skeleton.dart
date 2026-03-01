// lib/features/purchase_history/presentation/widgets/history_skeleton.dart

import 'package:flutter/material.dart';
import 'package:flutter_subscription_app/core/widgets/skeleton_box.dart';

class HistoryCardSkeleton extends StatelessWidget {
  const HistoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SkeletonBox(width: 48, height: 48, borderRadius: 12),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: 120, height: 18),
                    SizedBox(height: 6),
                    SkeletonBox(width: 200, height: 14),
                  ],
                ),
              ),
              SkeletonBox(width: 70, height: 28, borderRadius: 14),
            ],
          ),
          SizedBox(height: 16),
          Divider(height: 1),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonBox(width: 100, height: 12),
              SkeletonBox(width: 120, height: 12),
            ],
          ),
           SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonBox(width: 80, height: 12),
              SkeletonBox(width: 100, height: 12),
            ],
          ),
              SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonBox(width: 80, height: 12),
              SkeletonBox(width: 100, height: 12),
            ],
          ),
              SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonBox(width: 80, height: 12),
              SkeletonBox(width: 100, height: 12),
            ],
          ),
        ],
      ),
    );
  }


}

class HistoryListSkeleton extends StatelessWidget {
  const HistoryListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
         Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
         Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
         const SkeletonBox(width: 120, height: 20),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
           
            child: const SkeletonBox(width: 20, height: 20),
          ),
        ],
      ),
    ),
         const SizedBox(height: 16),
          ...List.generate(4, (_) => const HistoryCardSkeleton())],
      ),
    );
  }
}
