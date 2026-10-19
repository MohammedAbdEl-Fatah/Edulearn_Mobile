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

  static const AppConfig dev = AppConfig._(
    env: Env.dev,
    baseUrl: "", //todo write the base url for the dev environment
    enableLogs: true,
  );

  static const AppConfig prod = AppConfig._(
    env: Env.prod,
    baseUrl: "", //todo write the base url for the prod environment
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
