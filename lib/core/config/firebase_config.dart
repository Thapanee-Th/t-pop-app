// lib/core/config/firebase_config.dart

import 'package:firebase_core/firebase_core.dart';
import 'app_config.dart';

class FirebaseConfig {
  // Replace these with your actual Firebase config values
  static FirebaseOptions get stagingOptions => const FirebaseOptions(
    apiKey: 'YOUR_STAGING_API_KEY',
    appId: 'YOUR_STAGING_APP_ID',
    messagingSenderId: 'YOUR_STAGING_SENDER_ID',
    projectId: 'your-project-staging',
    storageBucket: 'your-project-staging.appspot.com',
  );

  static FirebaseOptions get prodOptions => const FirebaseOptions(
    apiKey: 'YOUR_PROD_API_KEY',
    appId: 'YOUR_PROD_APP_ID',
    messagingSenderId: 'YOUR_PROD_SENDER_ID',
    projectId: 'your-project-prod',
    storageBucket: 'your-project-prod.appspot.com',
  );

  static FirebaseOptions get currentOptions {
    return appConfig.isStaging ? stagingOptions : prodOptions;
  }
}
