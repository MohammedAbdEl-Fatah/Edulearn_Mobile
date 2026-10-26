import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Env { dev, prod }

class AppConfig {
  // Singleton instance
  const AppConfig._({
    required this.env,
    required this.baseUrl,
    required this.enableLogs,
  });

  final Env env;
  final String baseUrl;
  final bool enableLogs;

  bool get isProduction => env == Env.prod;

  static AppConfig dev = AppConfig._(
    env: Env.dev,
    baseUrl: dotenv.get('BASEURL'),
    enableLogs: true,
  );

  static AppConfig prod = AppConfig._(
    env: Env.prod,
    baseUrl: dotenv.get('BASEURL'),
    enableLogs: false,
  );

  static AppConfig fromEnv(String env) => env == Env.prod.name ? prod : dev;

  /// Get the current environment from the environment variable `ENV`
  /// run
  /// flutter run --dart-define=ENV=dev
  ///   flutter build apk --dart-define=ENV=prod
  static const String _env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static final AppConfig current = fromEnv(_env);
}
