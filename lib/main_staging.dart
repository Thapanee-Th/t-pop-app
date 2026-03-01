// Run with: flutter run --target lib/main_staging.dart
// Or: flutter run -t lib/main_staging.dart --flavor staging

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appConfig = AppConfig.staging;
  //TODO: Add real FirebaseOptions before enabling this.
  // await Firebase.initializeApp(
  //   options: FirebaseConfig.stagingOptions,
  // );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
