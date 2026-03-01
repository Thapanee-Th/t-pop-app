// lib/features/purchase_package/presentation/widgets/package_skeleton.dart



import 'package:flutter/material.dart';
import 'package:flutter_subscription_app/core/widgets/skeleton_box.dart';

class PackageCardSkeleton extends StatelessWidget {
  const PackageCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeletonBox(width: 80, height: 24),
              SkeletonBox(width: 60, height: 24, borderRadius: 12),
            ],
          ),
          const SizedBox(height: 8),
          const SkeletonBox(width: 200, height: 16),
          const SizedBox(height: 16),
          const SkeletonBox(width: 120, height: 36),
          const SizedBox(height: 4),
          const SkeletonBox(width: 80, height: 14),
          const SizedBox(height: 20),
          // const Divider(height: 1),
          // const SizedBox(height: 16),
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const SkeletonBox(width: 20, height: 20, borderRadius: 10),
                  const SizedBox(width: 10),
                  SkeletonBox(width: 150 + (index * 20.0), height: 14),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SkeletonBox(width: double.infinity, height: 52, borderRadius: 12),
        ],
      ),
    );
  }


}

