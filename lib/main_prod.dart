
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appConfig = AppConfig.prod;
  //TODO: Add real FirebaseOptions before enabling this.
  // await Firebase.initializeApp(
  //   options: FirebaseConfig.prodOptions,
  // );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
