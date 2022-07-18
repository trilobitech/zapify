import 'package:shared_preferences/shared_preferences.dart';
import 'package:zapfy/config/storage/key_value_storage.dart';

class PreferencesStorage implements LocalConfigStorage {
  PreferencesStorage({
    required SharedPreferences prefs,
    Map<String, dynamic> localConfigDefaults = const {},
  })  : _prefs = prefs,
        _defaults = localConfigDefaults;

  final SharedPreferences _prefs;
  final Map<String, dynamic> _defaults;

  @override
  T getValue<T extends Object>(String key) {
    if (!_prefs.containsKey(key)) {
      return _defaults[key];
    }
    return _prefs.get(key) as T;
  }

  @override
  Future setValue<T extends Object>(String key, T value) async {
    if (value is int) {
      return await _prefs.setInt(key, value);
    }
    if (value is bool) {
      return await _prefs.setBool(key, value);
    }
    if (value is double) {
      return await _prefs.setDouble(key, value);
    }
    if (value is String) {
      return await _prefs.setString(key, value);
    }
    if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    }
    throw UnsupportedError('Value "$value" for key "$key" is unsupported');
  }
}
