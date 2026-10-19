import 'package:edulearn_mobile/core/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test app config in prod or dev.", () {
    test("dev config enable logs", () {
      final value = AppConfig.fromEnv("dev");
      expect(value.env, Env.dev);
      expect(value.enableLogs, isTrue);
    });

    test("prod config enable logs", () {
      final value = AppConfig.fromEnv("prod");
      expect(value.env, Env.prod);
      expect(value.isProduction, isTrue);
      expect(value.enableLogs, isFalse);
    });
    test('unknown env falls back to dev', () {
      expect(AppConfig.fromEnv('whatever').env, Env.dev);
    });
  });
}
