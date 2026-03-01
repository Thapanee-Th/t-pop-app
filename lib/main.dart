import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_subscription_app/core/config/firebase_config.dart';
import 'core/config/app_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set to staging by default for local development
  appConfig = AppConfig.staging;

    // TODO: Add real FirebaseOptions before enabling this.
  await Firebase.initializeApp(
    options: FirebaseConfig.currentOptions,
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
