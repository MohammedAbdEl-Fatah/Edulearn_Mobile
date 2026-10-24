import 'package:shared_preferences/shared_preferences.dart';

class StorageSharedPreferences {
  StorageSharedPreferences._();
  static final StorageSharedPreferences instance = StorageSharedPreferences._();
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //write data
  Future<bool> set<T>({required String key, required T value}) async {
    return switch (value) {
      String v => _sharedPreferences.setString(key, v),
      int v => _sharedPreferences.setInt(key, v),
      bool v => _sharedPreferences.setBool(key, v),
      double v => _sharedPreferences.setDouble(key, v),
      List<String> v => _sharedPreferences.setStringList(key, v),
      _ => throw UnsupportedError(
        'Unsupported type: ${value.runtimeType}',
      ), //saving for me if send mistake datatype
    };
  }

  T? get<T>(String key) {
    return switch (T) {
      const (String) => _sharedPreferences.getString(key) as T?,
      const (int) => _sharedPreferences.getInt(key) as T?,
      const (bool) => _sharedPreferences.getBool(key) as T?,
      const (double) => _sharedPreferences.getDouble(key) as T?,
      const (List<String>) => _sharedPreferences.getStringList(key) as T?,
      _ => throw UnsupportedError('Unsupported type: $T'),
    };
  }
}
