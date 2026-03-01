// lib/core/config/app_config.dart

enum Environment { staging, prod }

class AppConfig {
  final Environment environment;
  final String baseUrl;
  final String firebaseProjectId;
  final bool enableLogging;

  const AppConfig._({
    required this.environment,
    required this.baseUrl,
    required this.firebaseProjectId,
    required this.enableLogging,
  });

  static const AppConfig staging = AppConfig._(
    environment: Environment.staging,
    baseUrl: 'https://api-staging.example.com/v1',
    firebaseProjectId: 'your-project-staging',
    enableLogging: true,
  );

  static const AppConfig prod = AppConfig._(
    environment: Environment.prod,
    baseUrl: 'https://api.example.com/v1',
    firebaseProjectId: 'your-project-prod',
    enableLogging: false,
  );

  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;

  String get environmentName => environment == Environment.staging ? 'STAGING' : 'PROD';
}

// Global config instance - set at app startup
late final AppConfig appConfig;
