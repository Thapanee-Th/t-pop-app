// lib/main_prod.dart
// Run with: flutter run --target lib/main_prod.dart --release
// Or: flutter run -t lib/main_prod.dart --flavor prod

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'core/config/firebase_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appConfig = AppConfig.prod;

  await Firebase.initializeApp(
    options: FirebaseConfig.prodOptions,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
