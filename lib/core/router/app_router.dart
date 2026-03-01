// lib/core/router/app_router.dart

import 'package:go_router/go_router.dart';
import '../../features/purchase_package/presentation/pages/purchase_package_page.dart';
import '../../features/purchase_history/presentation/pages/purchase_history_page.dart';
import '../widgets/main_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: '/packages',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/packages',
          name: 'purchasePackage',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PurchasePackagePage(),
          ),
        ),
        GoRoute(
          path: '/history',
          name: 'purchaseHistory',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PurchaseHistoryPage(),
          ),
        ),
      ],
    ),
  ],
);

